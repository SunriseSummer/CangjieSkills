#!/usr/bin/env python3
"""Run the event-ledger acceptance flow without shell-specific dependencies."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys
import tomllib


if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.stderr.reconfigure(encoding="utf-8", errors="replace")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--project", type=Path, default=Path(__file__).resolve().parent / "oracle")
    parser.add_argument("--skill-root", type=Path)
    return parser.parse_args()


def find_setup(task: Path, explicit: Path | None) -> Path:
    roots = [explicit] if explicit else []
    env_root = os.environ.get("CANGJIE_SKILL_ROOT")
    if env_root:
        roots.append(Path(env_root))
    for ancestor in (task, *task.parents):
        roots.extend((ancestor, ancestor / ".agents" / "skills" / "cangjie-coding"))
    for root in roots:
        if root is None:
            continue
        candidate = root.expanduser().resolve() / "scripts" / "setup_stdx.py"
        if candidate.is_file():
            return candidate
    raise FileNotFoundError("setup_stdx.py not found; pass --skill-root or set CANGJIE_SKILL_ROOT")


def run(command: list[str], cwd: Path, env: dict[str, str] | None = None) -> subprocess.CompletedProcess[str]:
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
    if re.search(r"\bwarning\b", result.stdout, re.IGNORECASE):
        raise RuntimeError(f"{' '.join(command)} emitted a warning")
    return result


def verify_frozen(task: Path, manifest: dict[str, object]) -> None:
    for relative, metadata in manifest["files"].items():
        path = (task / relative).resolve()
        if not path.is_relative_to(task) or not path.is_file():
            raise FileNotFoundError(f"frozen file missing: {relative}")
        actual = hashlib.sha256(path.read_bytes()).hexdigest()
        if actual != metadata["sha256"]:
            raise ValueError(f"frozen hash mismatch: {relative}")


def verify_project_test(project: Path, manifest: dict[str, object]) -> None:
    relative = "event_ledger_archive_test.cj"
    expected = manifest["files"][relative]["sha256"]
    project_test = project / "src" / relative
    if not project_test.is_file() or hashlib.sha256(project_test.read_bytes()).hexdigest() != expected:
        raise ValueError(f"project copy missing or modified: src/{relative}")


def loader_environment(project: Path) -> dict[str, str]:
    manifest = tomllib.loads((project / "cjpm.toml").read_text(encoding="utf-8-sig"))
    paths: list[str] = []
    for target in manifest.get("target", {}).values():
        paths.extend(target.get("bin-dependencies", {}).get("path-option", []))
    env = os.environ.copy()
    joined = os.pathsep.join(paths)
    env["PATH"] = joined + os.pathsep + env.get("PATH", "")
    if sys.platform == "darwin":
        env["DYLD_LIBRARY_PATH"] = joined + os.pathsep + env.get("DYLD_LIBRARY_PATH", "")
    elif sys.platform != "win32":
        env["LD_LIBRARY_PATH"] = joined + os.pathsep + env.get("LD_LIBRARY_PATH", "")
    return env


def executable(project: Path) -> Path:
    suffix = ".exe" if sys.platform == "win32" else ""
    candidates = [project / "target" / "release" / "bin" / f"main{suffix}"]
    package = tomllib.loads((project / "cjpm.toml").read_text(encoding="utf-8-sig"))["package"]["name"]
    candidates.append(project / "target" / "release" / "bin" / f"{package}{suffix}")
    return next((path for path in candidates if path.is_file()), candidates[0])


def main() -> int:
    args = parse_args()
    task = Path(__file__).resolve().parent
    project = args.project.expanduser().resolve()
    if not project.is_dir():
        raise FileNotFoundError(f"project directory not found: {project}")
    manifest = json.loads((task / "frozen-hashes.json").read_text(encoding="utf-8-sig"))
    verify_frozen(task, manifest)
    verify_project_test(project, manifest)
    setup = find_setup(task, args.skill_root)
    run([sys.executable, str(setup), "--project", str(project)], task)
    run(["cjpm", "clean"], project)
    run(["cjpm", "build"], project)
    tests = run(["cjpm", "test"], project).stdout
    expected_tests = int(manifest["expectedTestSummary"]["total"])
    if not re.search(rf"TOTAL:\s*{expected_tests}\b", tests) or not re.search(r"FAILED.*:\s*0\b", tests):
        raise ValueError(f"test summary did not report {expected_tests} total and 0 failed")
    program = executable(project)
    env = loader_environment(project)
    outputs: list[str] = []
    for round_number in range(1, 4):
        result = subprocess.run(
            [str(program)], cwd=project, env=env, capture_output=True, text=True, encoding="utf-8", check=False
        )
        if result.returncode:
            raise RuntimeError(f"application failed on stability round {round_number}")
        outputs.append(result.stdout.replace("\r\n", "\n").rstrip("\n") + "\n")
    if len(set(outputs)) != 1:
        raise ValueError("application output is not stable across three runs")
    actual = hashlib.sha256(outputs[0].encode()).hexdigest()
    if actual != manifest["expectedStdout"]["sha256"]:
        raise ValueError(f"application stdout hash mismatch: {actual}")
    print(f"ACCEPT {task.name}: hashes, {expected_tests} tests, warnings, and stable stdout passed")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (OSError, RuntimeError, ValueError, json.JSONDecodeError, tomllib.TOMLDecodeError) as exc:
        print(f"ACCEPT ERROR: {exc}", file=sys.stderr)
        raise SystemExit(1)
