#!/usr/bin/env python3
"""Validate the frozen secure-local-sync task with the active stdx release."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys


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
    if os.environ.get("CANGJIE_SKILL_ROOT"):
        roots.append(Path(os.environ["CANGJIE_SKILL_ROOT"]))
    for ancestor in (task, *task.parents):
        roots.extend((ancestor, ancestor / ".agents" / "skills" / "cangjie-coding"))
    for root in roots:
        if root is None:
            continue
        candidate = root.expanduser().resolve() / "scripts" / "setup_stdx.py"
        if candidate.is_file():
            return candidate
    raise FileNotFoundError("setup_stdx.py not found; pass --skill-root or set CANGJIE_SKILL_ROOT")


def run(command: list[str], cwd: Path) -> str:
    result = subprocess.run(
        command,
        cwd=cwd,
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
    return result.stdout.replace("\r\n", "\n").rstrip()


def main() -> int:
    args = parse_args()
    task = Path(__file__).resolve().parent
    project = args.project.expanduser().resolve()
    if not project.is_dir():
        raise FileNotFoundError(f"project directory not found: {project}")
    manifest = json.loads((task / "frozen-hashes.json").read_text(encoding="utf-8-sig"))
    for entry in manifest["frozen"]:
        path = (task / entry["path"]).resolve()
        if not path.is_relative_to(task) or not path.is_file():
            raise FileNotFoundError(f"frozen file missing: {entry['path']}")
        if hashlib.sha256(path.read_bytes()).hexdigest() != entry["sha256"]:
            raise ValueError(f"frozen hash mismatch: {entry['path']}")
    project_hashes = {
        "fixtures.cj": next(entry["sha256"] for entry in manifest["frozen"] if entry["path"] == "fixtures.cj"),
        "secure_local_sync_test.cj": next(
            entry["sha256"] for entry in manifest["frozen"] if entry["path"] == "secure_local_sync_test.cj"
        ),
    }
    for name, expected in project_hashes.items():
        project_copy = project / "src" / name
        if not project_copy.is_file() or hashlib.sha256(project_copy.read_bytes()).hexdigest() != expected:
            raise ValueError(f"project copy missing or modified: src/{name}")
    setup = find_setup(task, args.skill_root)
    run([sys.executable, str(setup), "--project", str(project)], task)
    run(["cjpm", "clean"], project)
    run(["cjpm", "build"], project)
    run(["cjpm", "test"], project)
    first = run(["cjpm", "run"], project)
    for round_number in range(2, 4):
        if run(["cjpm", "run"], project) != first:
            raise ValueError(f"cjpm run output changed on stability round {round_number}")
    print(f"ACCEPT {task.name}: hashes, clean/build/test, warnings, and run stability passed")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (OSError, RuntimeError, ValueError, json.JSONDecodeError) as exc:
        print(f"ACCEPT ERROR: {exc}", file=sys.stderr)
        raise SystemExit(1)
