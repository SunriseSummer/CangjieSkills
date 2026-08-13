#!/usr/bin/env python3
"""Run an implementation's portable quality gate and verify its artifacts."""

from __future__ import annotations

import hashlib
from pathlib import Path
import subprocess
import sys


def nonempty_files(root: Path, pattern: str) -> list[Path]:
    return [path for path in root.rglob(pattern) if path.is_file() and path.stat().st_size > 0]


def main() -> int:
    project = Path(__file__).resolve().parent
    frozen_test = project / "quality_gate_expression_vm_test.cj"
    project_test = project / "src" / frozen_test.name
    if not project_test.is_file() or hashlib.sha256(project_test.read_bytes()).digest() != hashlib.sha256(
        frozen_test.read_bytes()
    ).digest():
        raise RuntimeError(f"project copy missing or modified: src/{frozen_test.name}")
    quality = project / "quality.py"
    if not quality.is_file():
        raise FileNotFoundError("quality.py is required")
    subprocess.run([sys.executable, str(quality)], cwd=project, check=True)
    checks = {
        "formatted source": nonempty_files(project / "reports" / "formatted", "*.cj"),
        "lint csv": nonempty_files(project / "reports", "lint*.csv"),
        "test xml": nonempty_files(project / "reports" / "tests", "*.xml"),
        "coverage html": nonempty_files(project / "reports" / "coverage", "*.html"),
        "coverage xml": nonempty_files(project / "reports" / "coverage", "*.xml"),
        "coverage json": nonempty_files(project / "reports" / "coverage", "*.json"),
    }
    missing = [name for name, files in checks.items() if not files]
    if missing:
        raise RuntimeError(f"missing or empty artifacts: {', '.join(missing)}")
    print("QUALITY_GATE_ASSERTIONS=6/6")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (OSError, RuntimeError, subprocess.CalledProcessError) as exc:
        print(f"ACCEPT ERROR: {exc}", file=sys.stderr)
        raise SystemExit(1)
