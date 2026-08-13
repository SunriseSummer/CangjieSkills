#!/usr/bin/env python3
"""Shared frozen acceptance runner for the source-auditor tasks."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys


if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.stderr.reconfigure(encoding="utf-8", errors="replace")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--project",
        type=Path,
        default=Path(os.environ.get("CANGJIE_TASK_ROOT", Path(__file__).resolve().parent)) / "oracle",
        help="auditor workspace root (default: ./oracle)",
    )
    parser.add_argument("--expected-tests", type=int, default=None)
    return parser.parse_args()


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def safe_child(root: Path, relative: str) -> Path:
    result = (root / Path(relative.replace("/", os.sep))).resolve()
    if not result.is_relative_to(root):
        raise ValueError(f"path escapes task/project root: {relative}")
    return result


def frozen_digest(value: object) -> str:
    if isinstance(value, str):
        return value
    if isinstance(value, dict) and isinstance(value.get("sha256"), str):
        return value["sha256"]
    raise ValueError("invalid frozen hash entry")


def install_frozen(task: Path, project: Path, manifest: dict[str, object]) -> None:
    files = manifest.get("files")
    mapping = manifest.get("mapping")
    if not isinstance(files, dict) or not isinstance(mapping, list):
        raise ValueError("manifest must contain files and mapping")
    for relative, expected in files.items():
        source = safe_child(task, relative)
        if not source.is_file():
            raise FileNotFoundError(f"frozen file missing: {relative}")
        if sha256(source) != frozen_digest(expected):
            raise ValueError(f"frozen hash mismatch: {relative}")
    for item in mapping:
        if not isinstance(item, dict):
            raise ValueError("invalid mapping entry")
        relative_source = str(item["frozen"])
        relative_target = str(item["target"])
        if relative_target.startswith("oracle/"):
            relative_target = relative_target[len("oracle/") :]
        source = safe_child(task, relative_source)
        target = safe_child(project, relative_target)
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(source, target)
        if sha256(target) != frozen_digest(files[relative_source]):
            raise ValueError(f"copied frozen hash mismatch: {item['target']}")


def assert_project_scale(project: Path) -> tuple[int, int, int]:
    excluded = {"target", "fixtures", "reports", ".cangjie", ".codegraph"}
    files = [
        path
        for path in project.rglob("*.cj")
        if not excluded.intersection(path.relative_to(project).parts)
        and not re.search(r"_tests?\.cj$", path.name)
    ]
    line_count = sum(len(path.read_text(encoding="utf-8").splitlines()) for path in files)
    packages: set[str] = set()
    for path in files:
        match = re.search(
            r"^\s*package\s+([A-Za-z_][A-Za-z0-9_.]*)",
            path.read_text(encoding="utf-8"),
            re.MULTILINE,
        )
        if match:
            packages.add(match.group(1))
    if not 600 <= line_count <= 2000:
        raise ValueError(f"production Cangjie LOC was {line_count}; expected 600..2000")
    if len(files) < 8:
        raise ValueError(f"production Cangjie files were {len(files)}; expected at least 8")
    if len(packages) < 4:
        raise ValueError(f"production packages were {len(packages)}; expected at least 4")
    return line_count, len(files), len(packages)


def run(
    command: list[str],
    cwd: Path,
    env: dict[str, str] | None = None,
    allow_warning: bool = False,
) -> subprocess.CompletedProcess[str]:
    result = subprocess.run(
        command,
        cwd=cwd,
        env=env,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
        encoding="utf-8",
        errors="replace",
        check=False,
    )
    print(result.stdout, end="")
    if result.returncode:
        raise RuntimeError(f"{' '.join(command)} failed with exit code {result.returncode}")
    if not allow_warning and re.search(r"\bwarning\b", result.stdout, re.IGNORECASE):
        raise RuntimeError(f"{' '.join(command)} emitted a warning")
    return result


def build_native(project: Path) -> tuple[Path, dict[str, str]]:
    libs = project / "libs"
    libs.mkdir(parents=True, exist_ok=True)
    if sys.platform == "win32":
        library = libs / "libauditor_native.dll"
        alias = libs / "auditor_native.dll"
        platform_flags: list[str] = []
    elif sys.platform == "darwin":
        library = libs / "libauditor_native.dylib"
        alias = library
        platform_flags = ["-fPIC"]
    else:
        library = libs / "libauditor_native.so"
        alias = library
        platform_flags = ["-fPIC"]
    run(
        [
            "clang",
            "-shared",
            "-fstack-protector-all",
            "-Wall",
            "-Wextra",
            "-Werror",
            *platform_flags,
            str(project / "native" / "auditor_native.c"),
            "-o",
            str(library),
        ],
        project,
    )
    if alias != library:
        shutil.copyfile(library, alias)
    env = os.environ.copy()
    env["PATH"] = str(libs) + os.pathsep + env.get("PATH", "")
    if sys.platform == "darwin":
        env["DYLD_LIBRARY_PATH"] = str(libs) + os.pathsep + env.get("DYLD_LIBRARY_PATH", "")
    elif sys.platform != "win32":
        env["LD_LIBRARY_PATH"] = str(libs) + os.pathsep + env.get("LD_LIBRARY_PATH", "")
    return library, env


def normalize(text: str) -> str:
    return text.replace("\r\n", "\n")


def executable(project: Path) -> Path:
    suffix = ".exe" if sys.platform == "win32" else ""
    return project / "target" / "release" / "bin" / f"auditor_app{suffix}"


def assert_exit(command: list[str], cwd: Path, env: dict[str, str], code: int, expected: str) -> None:
    result = subprocess.run(
        command,
        cwd=cwd,
        env=env,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
        encoding="utf-8",
        errors="replace",
        check=False,
    )
    if result.returncode != code or normalize(result.stdout).rstrip("\n") != expected:
        raise ValueError(f"exit/stdout contract failed: {' '.join(command)}")


def main() -> int:
    args = parse_args()
    task = Path(os.environ.get("CANGJIE_TASK_ROOT", Path(__file__).resolve().parent)).resolve()
    project = args.project.resolve()
    if not project.is_dir():
        raise FileNotFoundError(f"project directory not found: {project}")
    manifest = json.loads((task / "frozen-hashes.json").read_text(encoding="utf-8-sig"))
    scale = assert_project_scale(project)
    print(f"SCALE productionLoc={scale[0]} files={scale[1]} packages={scale[2]}")
    install_frozen(task, project, manifest)
    _, env = build_native(project)
    run(["cjpm", "clean"], project, env)
    run(["cjpm", "build"], project, env)
    tests = run(["cjpm", "test"], project, env).stdout
    expected_tests = args.expected_tests
    if expected_tests is None:
        expected_tests = int(manifest.get("counts", {}).get("behaviorTests", 0)) or {
            "auditor_incremental": 76,
            "auditor_repair": 59,
            "macro_native_source_auditor": 59,
        }.get(task.name)
    if expected_tests and (
        not re.search(rf"TOTAL:\s*{expected_tests}\b", tests)
        or not re.search(r"FAILED.*:\s*0\b", tests)
    ):
        raise ValueError(f"test summary did not report {expected_tests} total and 0 failed")
    run(["cjpm", "run", "--name", "auditor_app", "--run-args=fixtures/sources"], project, env)
    program = executable(project)
    golden = normalize((project / "fixtures" / "expected" / "report.txt").read_text(encoding="utf-8"))
    result = subprocess.run(
        [str(program), "fixtures/sources"], cwd=project, env=env, capture_output=True, text=True, encoding="utf-8"
    )
    if result.returncode != 4 or normalize(result.stdout) != golden:
        raise ValueError("normal audit exit/stdout differs from the frozen contract")
    assert_exit([str(program)], project, env, 2, "error usage: auditor <sources-dir>")
    assert_exit(
        [str(program), "fixtures/does-not-exist"],
        project,
        env,
        3,
        "error missing-root fixtures/does-not-exist",
    )
    run([sys.executable, str(task / "quality.py"), "--project", str(project)], task, env, allow_warning=True)
    print(f"ACCEPT {manifest.get('task', task.name)}: frozen hashes, behavior, CLI, and quality gates passed")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (OSError, ValueError, RuntimeError, json.JSONDecodeError) as exc:
        print(f"ACCEPT ERROR: {exc}", file=sys.stderr)
        raise SystemExit(1)
