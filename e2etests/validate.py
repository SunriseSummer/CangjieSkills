#!/usr/bin/env python3
"""Validate the portable end-to-end task corpus."""

from __future__ import annotations

import ast
import hashlib
import json
from pathlib import Path
import sys

FORBIDDEN_DIRECTORIES = {
    "oracle",
    "target",
    "reports",
    "trace",
    "__pycache__",
    ".pytest_cache",
}
FORBIDDEN_SUFFIXES = {
    ".ps1",
    ".bat",
    ".cmd",
    ".dll",
    ".dylib",
    ".so",
    ".a",
    ".cjo",
    ".log",
    ".tmp",
}
EXPECTED_TASKS = 56


def load_manifest(path: Path) -> list[tuple[str, str]]:
    manifest = json.loads(path.read_text(encoding="utf-8-sig"))
    entries: list[tuple[str, str]] = []
    files = manifest.get("files", {})
    if isinstance(files, dict):
        for relative, metadata in files.items():
            digest = metadata if isinstance(metadata, str) else metadata["sha256"]
            entries.append((relative, digest))
    for metadata in manifest.get("frozen", []):
        entries.append((metadata["path"], metadata["sha256"]))
    return entries


def check_manifest(path: Path, errors: list[str]) -> None:
    root = path.parent.resolve()
    try:
        entries = load_manifest(path)
    except (OSError, KeyError, TypeError, json.JSONDecodeError) as exc:
        errors.append(f"invalid manifest {path}: {exc}")
        return
    for relative, expected in entries:
        candidate = (root / relative).resolve()
        if not candidate.is_relative_to(root):
            errors.append(f"manifest path escapes task: {path}: {relative}")
        elif not candidate.is_file():
            errors.append(f"frozen input missing: {path}: {relative}")
        elif hashlib.sha256(candidate.read_bytes()).hexdigest() != expected:
            errors.append(f"frozen hash mismatch: {path}: {relative}")


def main() -> int:
    root = Path(__file__).resolve().parent
    readme = (root / "README.md").read_text(encoding="utf-8")
    tasks = sorted(path for path in root.iterdir() if path.is_dir())
    errors: list[str] = []
    if len(tasks) != EXPECTED_TASKS:
        errors.append(f"expected {EXPECTED_TASKS} tasks, found {len(tasks)}")
    for task in tasks:
        if not (task / "task.md").is_file():
            errors.append(f"task.md missing: {task.name}")
        if f"`{task.name}`" not in readme:
            errors.append(f"README entry missing: {task.name}")
        if task.name.endswith(("_incremental", "_repair", "_fix")) and not (task / "seed").is_dir():
            errors.append(f"increment/repair seed missing: {task.name}")
    for path in root.rglob("*"):
        relative = path.relative_to(root)
        if FORBIDDEN_DIRECTORIES.intersection(relative.parts):
            errors.append(f"generated/reference directory present: {relative}")
        if path.is_file() and path.suffix.lower() in FORBIDDEN_SUFFIXES:
            errors.append(f"non-portable/generated file present: {relative}")
        if path.suffix.lower() == ".py":
            try:
                source = path.read_text(encoding="utf-8-sig")
                ast.parse(source, filename=str(path))
                if len(source.splitlines()) > 300:
                    errors.append(f"Python module exceeds 300 lines: {relative}")
            except (OSError, SyntaxError, UnicodeError) as exc:
                errors.append(f"invalid Python file {relative}: {exc}")
    for manifest in root.rglob("frozen-hashes.json"):
        check_manifest(manifest, errors)
    if errors:
        for error in errors:
            print(f"ERROR: {error}", file=sys.stderr)
        return 1
    files = [path for path in root.rglob("*") if path.is_file()]
    print(
        f"PASS tasks={len(tasks)} files={len(files)} "
        f"bytes={sum(path.stat().st_size for path in files)} "
        f"manifests={sum(1 for _ in root.rglob('frozen-hashes.json'))}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
