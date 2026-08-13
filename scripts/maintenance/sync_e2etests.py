#!/usr/bin/env python3
"""Synchronize a task corpus into this project's versioned e2etests directory."""

from __future__ import annotations

import argparse
import hashlib
from pathlib import Path
import shutil
import sys


PROJECT_ROOT = Path(__file__).resolve().parents[2]
DESTINATION = (PROJECT_ROOT / "e2etests").resolve()


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", type=Path, help="task corpus to copy")
    return parser.parse_args()


def inventory(root: Path) -> dict[str, str]:
    return {
        path.relative_to(root).as_posix(): hashlib.sha256(path.read_bytes()).hexdigest()
        for path in root.rglob("*")
        if path.is_file()
    }


def main() -> int:
    source = parse_args().source.expanduser().resolve()
    if not source.is_dir() or not (source / "validate.py").is_file():
        raise ValueError(f"invalid task corpus: {source}")
    if DESTINATION.parent != PROJECT_ROOT or DESTINATION.name != "e2etests":
        raise RuntimeError(f"unsafe destination: {DESTINATION}")
    if DESTINATION.exists():
        shutil.rmtree(DESTINATION)
    shutil.copytree(source, DESTINATION)
    if inventory(source) != inventory(DESTINATION):
        raise RuntimeError("source and destination inventories differ")
    print(f"synced {len(inventory(source))} files: {source} -> {DESTINATION}")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (OSError, RuntimeError, ValueError) as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        raise SystemExit(1)
