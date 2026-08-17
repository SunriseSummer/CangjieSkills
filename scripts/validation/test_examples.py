#!/usr/bin/env python3
"""Extract and verify explicitly marked examples from Cangjie Markdown docs."""

from __future__ import annotations

import argparse
import difflib
import json
import os
import platform
import re
import shlex
import shutil
import signal
import subprocess
import sys
import tempfile
import time
import tomllib
from dataclasses import asdict, dataclass, field
from pathlib import Path, PurePosixPath
from typing import Any

from markdown_it import MarkdownIt
from tree_sitter import Language, Parser
import tree_sitter_cangjie as cangjie


if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
if hasattr(sys.stderr, "reconfigure"):
    sys.stderr.reconfigure(encoding="utf-8", errors="replace")


DEV_ROOT = Path(__file__).resolve().parents[2]
SKILL_ROOT = DEV_ROOT / ".agents" / "skills" / "cangjie-coding"
FIXTURE_ROOT = DEV_ROOT / "scripts" / "tests" / "data" / "fixtures"
VALID_MODES = {"syntax", "compile", "run", "project", "file", "expect", "skip"}
RUNNABLE_MODES = {"syntax", "compile", "run", "project"}
VALID_FORMS = {"unit", "expr", "stmt", "member"}
VALID_COMMANDS = {"check", "build", "run", "test"}
VALID_LAUNCHERS = {"cjpm", "direct"}
VALID_MATCHES = {"exact", "contains", "regex"}
VALID_STREAMS = {"stdout", "stderr"}
MAX_TIMEOUT = 300.0
ID_RE = re.compile(r"^[A-Za-z0-9][A-Za-z0-9._-]*$")
ANSI_ESCAPE_RE = re.compile(r"\x1b\[[0-?]*[ -/]*[@-~]")
STDX_TEST_ROOT = Path(tempfile.gettempdir()) / "cangjie-coding-stdx-tests"


@dataclass
class Block:
    path: Path
    line: int
    language: str
    content: str
    attrs: dict[str, str]

    @property
    def mode(self) -> str:
        return self.attrs.get("cjtest", "")

    @property
    def test_id(self) -> str:
        return self.attrs.get("id", "")


@dataclass
class Result:
    test_id: str
    mode: str
    status: str
    path: str
    line: int
    duration_ms: int = 0
    reason: str = ""
    command: list[str] | None = None
    exit_code: int | None = None
    stdout: str = ""
    stderr: str = ""
    diagnostics: list[dict[str, Any]] = field(default_factory=list)


@dataclass
class CommandResult:
    command: list[str]
    returncode: int
    stdout: str
    stderr: str
    timed_out: bool
    duration_ms: int


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Verify cjtest-marked Markdown examples.")
    parser.add_argument("paths", nargs="+", type=Path, help="Markdown files or directories")
    parser.add_argument("--mode", help="Comma-separated runnable modes (default: all)")
    parser.add_argument("--id", action="append", default=[], help="Run exact example id; repeatable")
    parser.add_argument("--strict", action="store_true", help="Fail on unclassified Cangjie fences")
    parser.add_argument("--allow", action="append", default=[], help="Allow a declared capability")
    parser.add_argument("--json", type=Path, help="Write machine-readable report")
    parser.add_argument("--keep-failed", action="store_true", help="Keep failed temporary projects")
    parser.add_argument("--list", action="store_true", help="List classified examples without running")
    parser.add_argument("--min-pass", type=int, default=0, help="Fail when fewer examples pass")
    parser.add_argument(
        "--max-compiler-warnings", type=int, default=None,
        help="Fail when successful compile/run/project results contain more compiler warnings",
    )
    parser.add_argument(
        "--max-legacy-skips", type=int, default=None,
        help="Fail when legacy-example-not-normalized skips exceed this value",
    )
    return parser.parse_args()


def compiler_warning_count(result: Result) -> int:
    """Count cjc warning diagnostics in otherwise successful executions."""
    if result.status != "PASS" or result.exit_code != 0:
        return 0
    output = ANSI_ESCAPE_RE.sub("", result.stderr)
    return len(re.findall(r"(?m)^warning:", output))


def markdown_files(paths: list[Path]) -> list[Path]:
    files: set[Path] = set()
    for value in paths:
        path = value.resolve()
        if path.is_file() and path.suffix.lower() == ".md":
            files.add(path)
        elif path.is_dir():
            files.update(item.resolve() for item in path.rglob("*.md") if item.is_file())
        else:
            raise ValueError(f"not a Markdown file or directory: {value}")
    return sorted(files, key=lambda item: item.as_posix())


def parse_info(info: str) -> tuple[str, dict[str, str]]:
    parts = shlex.split(info, posix=True)
    if not parts:
        return "", {}
    language = parts[0]
    attrs: dict[str, str] = {}
    for item in parts[1:]:
        if "=" not in item:
            raise ValueError(f"attribute must use key=value: {item!r}")
        key, value = item.split("=", 1)
        if key in attrs:
            raise ValueError(f"duplicate attribute: {key}")
        attrs[key] = value
    return language, attrs


def extract(files: list[Path]) -> tuple[list[Block], list[Result]]:
    parser = MarkdownIt("commonmark")
    blocks: list[Block] = []
    errors: list[Result] = []
    for path in files:
        text = path.read_text(encoding="utf-8-sig", errors="replace")
        for token in parser.parse(text):
            if token.type != "fence":
                continue
            line = (token.map[0] + 1) if token.map else 1
            try:
                language, attrs = parse_info(token.info.strip())
            except ValueError as exc:
                errors.append(Result("<metadata>", "metadata", "ERROR", str(path), line, reason=str(exc)))
                continue
            if language == "cangjie" and attrs.get("role") == "signature":
                continue
            if language == "cangjie" and not attrs.get("cjtest"):
                errors.append(Result("<unclassified>", "unclassified", "UNCLASSIFIED", str(path), line, reason="Cangjie fence lacks cjtest="))
            if attrs.get("cjtest"):
                blocks.append(Block(path, line, language, token.content, attrs))
    return blocks, errors


def validate(blocks: list[Block]) -> list[Result]:
    errors: list[Result] = []
    ids: dict[str, Block] = {}
    allowed = {
        "syntax": {"cjtest", "id", "form", "fixture", "timeout", "skip", "reason", "requires", "env", "os"},
        "compile": {"cjtest", "id", "form", "fixture", "target", "timeout", "exit", "skip", "reason", "requires", "env", "os"},
        "run": {"cjtest", "id", "form", "fixture", "timeout", "exit", "skip", "reason", "requires", "env", "os"},
        "project": {"cjtest", "id", "file", "command", "launcher", "args", "timeout", "exit", "skip", "reason", "requires", "env", "os"},
        "file": {"cjtest", "project", "file"},
        "expect": {"cjtest", "for", "stream", "match"},
        "skip": {"cjtest", "id", "reason"},
    }
    for block in blocks:
        mode = block.mode
        reason = ""
        if mode not in VALID_MODES:
            reason = f"unknown cjtest mode: {mode!r}"
        else:
            unknown = set(block.attrs) - allowed[mode]
            if unknown:
                reason = f"unknown attribute(s) for {mode}: {', '.join(sorted(unknown))}"
        if not reason and mode in RUNNABLE_MODES | {"skip"}:
            if not block.test_id:
                reason = "id is required"
            elif not ID_RE.fullmatch(block.test_id):
                reason = "id must match [A-Za-z0-9][A-Za-z0-9._-]*"
            elif block.test_id in ids:
                reason = f"duplicate id; first declared at {ids[block.test_id].path}:{ids[block.test_id].line}"
            else:
                ids[block.test_id] = block
        if not reason and mode in ("syntax", "compile", "run"):
            form = block.attrs.get("form", "unit")
            if form not in VALID_FORMS:
                reason = f"invalid form: {form}"
            elif mode in ("compile", "run") and form != "unit" and not block.attrs.get("fixture"):
                reason = "compile/run fragments require fixture="
        if not reason and mode == "project":
            if block.attrs.get("command", "build") not in VALID_COMMANDS:
                reason = "project command must be check/build/run/test"
            elif block.attrs.get("launcher", "cjpm") not in VALID_LAUNCHERS:
                reason = "project launcher must be cjpm/direct"
            elif block.attrs.get("launcher") == "direct" and block.attrs.get("command", "build") != "run":
                reason = "launcher=direct requires command=run"
            elif block.attrs.get("args") and block.attrs.get("launcher") != "direct":
                reason = "project args require launcher=direct"
            elif "file" not in block.attrs:
                reason = "project block requires file="
        if not reason and mode == "file" and not block.attrs.get("project"):
            reason = "file block requires project="
        if not reason and mode == "expect":
            if not block.attrs.get("for"):
                reason = "expect block requires for="
            elif block.attrs.get("stream", "stdout") not in VALID_STREAMS:
                reason = "expect stream must be stdout/stderr"
            elif block.attrs.get("match", "exact") not in VALID_MATCHES:
                reason = "expect match must be exact/contains/regex"
        if not reason and (mode == "skip" or block.attrs.get("skip") == "true") and not block.attrs.get("reason"):
            reason = "skipped example requires reason="
        if not reason and mode in ("project", "file"):
            try:
                safe_relative(block.attrs["file"])
            except ValueError as exc:
                reason = str(exc)
        if reason:
            errors.append(Result(block.test_id or "<metadata>", mode or "metadata", "ERROR", str(block.path), block.line, reason=reason))

    project_ids = {block.test_id: block for block in blocks if block.mode == "project" and block.test_id}
    for block in blocks:
        if block.mode == "file" and block.attrs.get("project") not in project_ids:
            errors.append(Result("<metadata>", "file", "ERROR", str(block.path), block.line, reason="file references unknown project"))
        if block.mode == "expect" and block.attrs.get("for") not in ids:
            errors.append(Result("<metadata>", "expect", "ERROR", str(block.path), block.line, reason="expect references unknown id"))
    return errors


def safe_relative(value: str) -> PurePosixPath:
    path = PurePosixPath(value.replace("\\", "/"))
    if path.is_absolute() or not path.parts or any(part in ("", ".", "..") for part in path.parts):
        raise ValueError(f"unsafe relative file path: {value!r}")
    return path


def parse_timeout(value: str | None, default: float) -> float:
    if not value:
        return default
    match = re.fullmatch(r"(\d+(?:\.\d+)?)(s|m)?", value)
    if not match:
        raise ValueError(f"invalid timeout: {value!r}")
    amount = float(match.group(1)) * (60 if match.group(2) == "m" else 1)
    if not 0 < amount <= MAX_TIMEOUT:
        raise ValueError(f"timeout must be >0 and <= {MAX_TIMEOUT:g}s")
    return amount


def terminate_process_tree(process: subprocess.Popen[str]) -> None:
    if os.name == "nt":
        subprocess.run(["taskkill", "/PID", str(process.pid), "/T", "/F"], capture_output=True, text=True)
    else:
        try:
            os.killpg(process.pid, signal.SIGKILL)
        except ProcessLookupError:
            pass


def run_command(
    command: list[str], cwd: Path, timeout: float, env: dict[str, str] | None = None
) -> CommandResult:
    started = time.perf_counter()
    kwargs: dict[str, Any] = {"cwd": cwd, "stdout": subprocess.PIPE, "stderr": subprocess.PIPE, "text": True, "encoding": "utf-8", "errors": "replace"}
    if env is not None:
        kwargs["env"] = env
    if os.name == "nt":
        kwargs["creationflags"] = subprocess.CREATE_NEW_PROCESS_GROUP
    else:
        kwargs["start_new_session"] = True
    process = subprocess.Popen(command, **kwargs)
    timed_out = False
    try:
        stdout, stderr = process.communicate(timeout=timeout)
    except subprocess.TimeoutExpired:
        timed_out = True
        terminate_process_tree(process)
        stdout, stderr = process.communicate()
    duration = int((time.perf_counter() - started) * 1000)
    return CommandResult(command, process.returncode if process.returncode is not None else -9, stdout[-20000:], stderr[-20000:], timed_out, duration)


def syntax_source(block: Block) -> str:
    form = block.attrs.get("form", "unit")
    if form == "unit":
        return block.content
    if form == "expr":
        return f"main(): Unit {{\n    let value = ({block.content.strip()})\n}}\n"
    if form == "stmt":
        body = "\n".join("    " + line for line in block.content.rstrip().splitlines())
        return f"main(): Unit {{\n{body}\n}}\n"
    body = "\n".join("    " + line for line in block.content.rstrip().splitlines())
    return f"class CjDocExample {{\n{body}\n}}\n"


def tree_sitter_errors(source: str) -> list[dict[str, Any]]:
    parser = Parser(Language(cangjie.language()))
    tree = parser.parse(source.encode("utf-8"))
    errors: list[dict[str, Any]] = []
    stack = [tree.root_node]
    while stack:
        node = stack.pop()
        if node.type == "ERROR" or node.is_missing:
            errors.append({"kind": "MISSING " + node.type if node.is_missing else "ERROR", "line": node.start_point.row + 1, "column_bytes": node.start_point.column + 1})
        stack.extend(reversed(node.children))
    return errors


def fixture_source(block: Block) -> str:
    form = block.attrs.get("form", "unit")
    if form == "unit":
        return block.content
    fixture = FIXTURE_ROOT / f"{block.attrs['fixture']}.cj.tmpl"
    if not fixture.is_file():
        raise ValueError(f"fixture not found: {fixture}")
    template = fixture.read_text(encoding="utf-8")
    if template.count("{{snippet}}") != 1:
        raise ValueError(f"fixture must contain exactly one {{{{snippet}}}}: {fixture}")
    return template.replace("{{snippet}}", block.content.rstrip())


def package_name(source: str, test_id: str) -> str:
    match = re.search(r"^\s*package\s+([A-Za-z_][\w.]*)", source, re.MULTILINE)
    if match:
        return match.group(1)
    return "cjdoc_" + re.sub(r"[^A-Za-z0-9_]", "_", test_id)[:40]


def create_single_project(root: Path, source: str, test_id: str) -> None:
    name = package_name(source, test_id)
    manifest = (
        "[package]\n"
        'cjc-version = "1.1.3"\n'
        f'name = "{name}"\n'
        'version = "0.1.0"\n'
        'output-type = "executable"\n'
    )
    (root / "src").mkdir(parents=True)
    (root / "cjpm.toml").write_text(manifest, encoding="utf-8", newline="\n")
    (root / "src" / "main.cj").write_text(source, encoding="utf-8", newline="\n")


def inferred_requirements(block: Block, files: list[Block] | None = None) -> set[str]:
    """Combine declared capabilities with deterministic source-level dependencies."""
    requirements = set(filter(None, block.attrs.get("requires", "").split(",")))
    related = [block, *(files or [])]
    if any(
        item.language == "cangjie"
        and re.search(r"(?m)^\s*import\s+stdx(?:\.|\s|$)", item.content)
        for item in related
    ):
        requirements.add("stdx")
    return requirements


def environment_skip(
    block: Block, allowed: set[str], files: list[Block] | None = None
) -> str:
    target_os = block.attrs.get("os")
    current = {"nt": "windows", "posix": "linux"}.get(os.name, sys.platform)
    if target_os and target_os != current:
        return f"requires os={target_os}; current={current}"
    for name in filter(None, block.attrs.get("env", "").split(",")):
        if name not in os.environ:
            return f"missing environment variable: {name}"
    for capability in sorted(inferred_requirements(block, files)):
        if capability not in allowed:
            return f"capability not allowed: {capability}"
    return ""


def configure_project_capabilities(
    root: Path, block: Block, files: list[Block] | None = None
) -> None:
    """Prepare explicitly allowed project capabilities after files are materialized."""
    requirements = inferred_requirements(block, files)
    if "stdx" in requirements:
        setup = SKILL_ROOT / "scripts" / "setup_stdx.py"
        process = run_command(
            [
                sys.executable, str(setup), "--project", str(root),
                "--destination", str(STDX_TEST_ROOT),
            ],
            root,
            240.0,
        )
        if process.timed_out or process.returncode != 0:
            detail = (process.stderr or process.stdout).strip()
            raise RuntimeError(f"stdx setup failed ({process.returncode}): {detail}")

    if "native-c" in requirements:
        source = root / "native" / "native.c"
        if not source.is_file():
            raise ValueError("requires=native-c expects native/native.c")
        clang = shutil.which("clang")
        if not clang:
            raise RuntimeError("requires=native-c needs clang on PATH")
        libraries = root / "libs"
        libraries.mkdir(parents=True, exist_ok=True)
        if os.name == "nt":
            output = libraries / "libnative.dll"
            command = [clang, "-shared", "-Wall", "-Wextra", "-Werror", "-fstack-protector-all", str(source), "-o", str(output)]
        elif sys.platform == "darwin":
            output = libraries / "libnative.dylib"
            command = [clang, "-shared", "-Wall", "-Wextra", "-Werror", "-fPIC", "-fstack-protector-all", str(source), "-o", str(output)]
        else:
            output = libraries / "libnative.so"
            command = [clang, "-shared", "-Wall", "-Wextra", "-Werror", "-fPIC", "-fstack-protector-all", str(source), "-o", str(output)]
        process = run_command(command, root, 120.0)
        if process.timed_out or process.returncode != 0:
            detail = (process.stderr or process.stdout).strip()
            raise RuntimeError(f"native C build failed ({process.returncode}): {detail}")
        if os.name == "nt":
            shutil.copy2(output, libraries / "native.dll")


def normalize_output(text: str) -> str:
    value = text.replace("\r\n", "\n").replace("\r", "\n")
    # cjpm 1.1.3 appends this launcher banner to stdout after the program exits.
    # Keep raw stdout in the JSON report, but exclude tool-owned noise when an
    # example declares the program's expected output.
    value = re.sub(r"\n*cjpm run finished\n?$", "", value)
    return value.rstrip("\n")


def compare_expected(actual: str, expected: Block) -> tuple[bool, str]:
    actual_value = normalize_output(actual)
    expected_value = normalize_output(expected.content)
    mode = expected.attrs.get("match", "exact")
    if mode == "exact":
        ok = actual_value == expected_value
    elif mode == "contains":
        ok = expected_value in actual_value
    else:
        ok = re.search(expected_value, actual_value, re.MULTILINE) is not None
    if ok:
        return True, ""
    diff = "\n".join(difflib.unified_diff(expected_value.splitlines(), actual_value.splitlines(), fromfile="expected", tofile="actual", lineterm=""))
    return False, diff[:8000]


def run_syntax(block: Block) -> Result:
    started = time.perf_counter()
    try:
        if block.language == "cangjie":
            diagnostics = tree_sitter_errors(syntax_source(block))
            status = "PASS" if not diagnostics else "FAIL"
            reason = "" if not diagnostics else "Tree-sitter produced ERROR/MISSING nodes"
        elif block.language == "toml":
            tomllib.loads(block.content)
            diagnostics, status, reason = [], "PASS", ""
        elif block.language in ("shell", "bash"):
            with tempfile.TemporaryDirectory(prefix="cjdoc-shell-") as temp:
                script = Path(temp) / "example.sh"
                script.write_text(block.content, encoding="utf-8", newline="\n")
                command = run_command(["bash", "-n", str(script)], block.path.parent, parse_timeout(block.attrs.get("timeout"), 2.0))
            diagnostics, status, reason = [], "PASS" if command.returncode == 0 else "FAIL", command.stderr
        else:
            diagnostics, status, reason = [], "ERROR", f"syntax mode does not support language {block.language!r}"
    except Exception as exc:
        diagnostics, status, reason = [], "FAIL", str(exc)
    return Result(block.test_id, "syntax", status, str(block.path), block.line, int((time.perf_counter() - started) * 1000), reason=reason, diagnostics=diagnostics)


def run_single(block: Block, expected: Block | None, keep_failed: bool) -> Result:
    try:
        source = fixture_source(block)
        timeout = parse_timeout(block.attrs.get("timeout"), 30.0 if block.mode == "compile" else 10.0)
    except ValueError as exc:
        return Result(block.test_id, block.mode, "ERROR", str(block.path), block.line, reason=str(exc))
    temp = Path(tempfile.mkdtemp(prefix="cjdoc-example-"))
    result: Result
    try:
        create_single_project(temp, source, block.test_id)
        configure_project_capabilities(temp, block)
        command = ["cjpm", "build"] if block.mode == "compile" else ["cjpm", "run"]
        process = run_command(command, temp, timeout)
        expected_exit = int(block.attrs.get("exit", "0"))
        status = "PASS" if not process.timed_out and process.returncode == expected_exit else "FAIL"
        reason = "timeout" if process.timed_out else ("" if status == "PASS" else f"expected exit {expected_exit}, got {process.returncode}")
        if status == "PASS" and expected:
            stream = process.stdout if expected.attrs.get("stream", "stdout") == "stdout" else process.stderr
            ok, diff = compare_expected(stream, expected)
            if not ok:
                status, reason = "FAIL", diff
        result = Result(block.test_id, block.mode, status, str(block.path), block.line, process.duration_ms, reason, process.command, process.returncode, process.stdout, process.stderr)
    except Exception as exc:
        result = Result(block.test_id, block.mode, "ERROR", str(block.path), block.line, reason=str(exc))
    if result.status == "PASS" or not keep_failed:
        shutil.rmtree(temp, ignore_errors=True)
    else:
        result.reason = f"{result.reason}\nkept: {temp}".strip()
    return result


def write_project_file(root: Path, relative: str, content: str) -> None:
    path = root.joinpath(*safe_relative(relative).parts)
    resolved = path.resolve()
    if root.resolve() not in resolved.parents:
        raise ValueError(f"project file escapes temporary root: {relative}")
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content, encoding="utf-8", newline="\n")


def project_runtime_environment(root: Path) -> dict[str, str]:
    """Expose configured dynamic dependency directories to a directly launched binary."""
    payload = tomllib.loads((root / "cjpm.toml").read_text(encoding="utf-8-sig"))
    entries: list[str] = []
    targets = payload.get("target", {})
    if isinstance(targets, dict):
        for target in targets.values():
            if not isinstance(target, dict):
                continue
            dependencies = target.get("bin-dependencies", {})
            paths = dependencies.get("path-option", []) if isinstance(dependencies, dict) else []
            if isinstance(paths, list):
                for value in paths:
                    if not isinstance(value, str):
                        continue
                    candidate = Path(value)
                    if not candidate.is_absolute():
                        candidate = root / candidate
                    if candidate.is_dir():
                        entries.append(str(candidate.resolve()))
    env = os.environ.copy()
    if entries:
        env["PATH"] = os.pathsep.join([*entries, env.get("PATH", "")])
    return env


def run_project_command(root: Path, block: Block, timeout: float) -> CommandResult:
    command_name = block.attrs.get("command", "build")
    if command_name != "run" or block.attrs.get("launcher", "cjpm") != "direct":
        return run_command(["cjpm", command_name], root, timeout)

    build = run_command(["cjpm", "build"], root, timeout)
    if build.timed_out or build.returncode != 0:
        return build
    executable = root / "target" / "release" / "bin" / ("main.exe" if os.name == "nt" else "main")
    if not executable.is_file():
        raise FileNotFoundError(f"direct project launcher cannot find executable: {executable}")
    arguments = shlex.split(block.attrs.get("args", ""), posix=True)
    return run_command(
        [str(executable), *arguments], root, timeout, env=project_runtime_environment(root)
    )


def run_project(block: Block, files: list[Block], expected: Block | None, keep_failed: bool) -> Result:
    try:
        timeout = parse_timeout(block.attrs.get("timeout"), 120.0)
    except ValueError as exc:
        return Result(block.test_id, "project", "ERROR", str(block.path), block.line, reason=str(exc))
    temp = Path(tempfile.mkdtemp(prefix="cjdoc-project-"))
    result: Result
    try:
        write_project_file(temp, block.attrs["file"], block.content)
        for item in files:
            if item.path != block.path:
                raise ValueError("all files for one project must be declared in the same Markdown file")
            write_project_file(temp, item.attrs["file"], item.content)
        manifest = temp / "cjpm.toml"
        if not manifest.is_file():
            raise ValueError("project must contain cjpm.toml")
        tomllib.loads(manifest.read_text(encoding="utf-8-sig"))
        if (temp / "build.cj").exists() and "build-script" not in block.attrs.get("requires", "").split(","):
            raise ValueError("project containing build.cj must declare requires=build-script")
        configure_project_capabilities(temp, block, files)
        process = run_project_command(temp, block, timeout)
        expected_exit = int(block.attrs.get("exit", "0"))
        status = "PASS" if not process.timed_out and process.returncode == expected_exit else "FAIL"
        reason = "timeout" if process.timed_out else ("" if status == "PASS" else f"expected exit {expected_exit}, got {process.returncode}")
        if status == "PASS" and expected:
            stream = process.stdout if expected.attrs.get("stream", "stdout") == "stdout" else process.stderr
            ok, diff = compare_expected(stream, expected)
            if not ok:
                status, reason = "FAIL", diff
        result = Result(block.test_id, "project", status, str(block.path), block.line, process.duration_ms, reason, process.command, process.returncode, process.stdout, process.stderr)
    except Exception as exc:
        result = Result(block.test_id, "project", "ERROR", str(block.path), block.line, reason=str(exc))
    if result.status == "PASS" or not keep_failed:
        shutil.rmtree(temp, ignore_errors=True)
    else:
        result.reason = f"{result.reason}\nkept: {temp}".strip()
    return result


def tool_version(command: list[str]) -> str:
    try:
        process = subprocess.run(command, capture_output=True, text=True, encoding="utf-8", errors="replace", timeout=10)
        return normalize_output(process.stdout or process.stderr).splitlines()[0]
    except Exception as exc:
        return f"unavailable: {exc}"


def main() -> int:
    args = parse_args()
    try:
        files = markdown_files(args.paths)
        selected_modes = set(args.mode.split(",")) if args.mode else RUNNABLE_MODES
        unknown_modes = selected_modes - RUNNABLE_MODES
        if unknown_modes:
            raise ValueError(f"unknown --mode values: {', '.join(sorted(unknown_modes))}")
        blocks, extraction_results = extract(files)
        metadata_results = validate(blocks)
    except ValueError as exc:
        raise SystemExit(str(exc)) from exc

    results = extraction_results + metadata_results
    invalid_locations = {(item.path, item.line) for item in metadata_results}
    expects = {block.attrs["for"]: block for block in blocks if block.mode == "expect" and "for" in block.attrs}
    project_files: dict[str, list[Block]] = {}
    for block in blocks:
        if block.mode == "file":
            project_files.setdefault(block.attrs.get("project", ""), []).append(block)

    runnable = [block for block in blocks if block.mode in RUNNABLE_MODES | {"skip"}]
    if args.id:
        requested = set(args.id)
        runnable = [block for block in runnable if block.test_id in requested]
        missing = requested - {block.test_id for block in runnable}
        if missing:
            results.append(Result(",".join(sorted(missing)), "selection", "ERROR", "<cli>", 0, reason="requested id not found"))

    allowed = set(args.allow)
    for block in runnable:
        if (str(block.path), block.line) in invalid_locations:
            continue
        if block.mode != "skip" and block.mode not in selected_modes:
            continue
        if args.list:
            results.append(Result(block.test_id, block.mode, "LISTED", str(block.path), block.line))
            continue
        related_files = project_files.get(block.test_id, []) if block.mode == "project" else []
        skip_reason = (
            block.attrs.get("reason", "")
            if block.mode == "skip" or block.attrs.get("skip") == "true"
            else environment_skip(block, allowed, related_files)
        )
        if skip_reason:
            results.append(Result(block.test_id, block.mode, "SKIP", str(block.path), block.line, reason=skip_reason))
        elif block.mode == "syntax":
            results.append(run_syntax(block))
        elif block.mode in ("compile", "run"):
            results.append(run_single(block, expects.get(block.test_id), args.keep_failed))
        elif block.mode == "project":
            results.append(run_project(block, project_files.get(block.test_id, []), expects.get(block.test_id), args.keep_failed))

    counts: dict[str, int] = {}
    for result in results:
        counts[result.status] = counts.get(result.status, 0) + 1
        if result.status in ("FAIL", "ERROR"):
            print(f"{result.status} {result.test_id} {result.path}:{result.line} {result.reason}")
    print("examples: " + " ".join(f"{key}={counts[key]}" for key in sorted(counts)))
    legacy_skips = sum(
        1 for result in results
        if result.status == "SKIP" and result.reason == "legacy-example-not-normalized"
    )
    compiler_warnings = sum(compiler_warning_count(result) for result in results)
    print(
        f"coverage: pass={counts.get('PASS', 0)} legacy_skips={legacy_skips} "
        f"compiler_warnings={compiler_warnings}"
    )

    report = {
        "schema": 1,
        "generated_at": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()),
        "environment": {
            "platform": platform.platform(),
            "python": sys.version.split()[0],
            "cjc": tool_version(["cjc", "--version"]),
            "cjpm": tool_version(["cjpm", "--version"]),
            "tree_sitter": "0.25.2",
            "tree_sitter_cangjie": "1.0.5.post1",
        },
        "counts": counts,
        "coverage": {
            "pass": counts.get("PASS", 0),
            "legacy_skips": legacy_skips,
            "compiler_warnings": compiler_warnings,
        },
        "results": [asdict(result) for result in results],
    }
    if args.json:
        args.json.parent.mkdir(parents=True, exist_ok=True)
        args.json.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8", newline="\n")

    failing = counts.get("FAIL", 0) + counts.get("ERROR", 0)
    if args.strict:
        failing += counts.get("UNCLASSIFIED", 0)
    if counts.get("PASS", 0) < args.min_pass:
        print(f"ERROR coverage gate: PASS {counts.get('PASS', 0)} < --min-pass {args.min_pass}")
        failing += 1
    if args.max_legacy_skips is not None and legacy_skips > args.max_legacy_skips:
        print(f"ERROR coverage gate: legacy skips {legacy_skips} > --max-legacy-skips {args.max_legacy_skips}")
        failing += 1
    if args.max_compiler_warnings is not None and compiler_warnings > args.max_compiler_warnings:
        print(
            "ERROR quality gate: compiler warnings "
            f"{compiler_warnings} > --max-compiler-warnings {args.max_compiler_warnings}"
        )
        failing += 1
    return 1 if failing else 0


if __name__ == "__main__":
    raise SystemExit(main())
