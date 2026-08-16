#!/usr/bin/env python3
"""Build or verify the cangjie-coding release database."""

from __future__ import annotations

import argparse
import hashlib
import os
import sqlite3
import sys
import tempfile
from pathlib import Path

sys.dont_write_bytecode = True

PROJECT_ROOT = Path(__file__).resolve().parent
SCRIPT_ROOT = PROJECT_ROOT / "scripts"
MAINTENANCE_ROOT = SCRIPT_ROOT / "maintenance"
REFERENCE_ROOT = PROJECT_ROOT / "references"
SKILL_ROOT = PROJECT_ROOT / ".agents" / "skills" / "cangjie-coding"
DATABASE = SKILL_ROOT / "references" / "knowledge.sqlite3"
ROUTING_INDEX = REFERENCE_ROOT / "search-content.json.gz"

RELEASE_FILES = {
    PROJECT_ROOT / "SKILL": SKILL_ROOT / "SKILL.md",
    SCRIPT_ROOT / "setup_stdx.py": SKILL_ROOT / "scripts" / "setup_stdx.py",
    SCRIPT_ROOT / "cj_ast.py": SKILL_ROOT / "scripts" / "cj_ast.py",
    SCRIPT_ROOT / "doc_search" / "sqlite_entry.py": SKILL_ROOT / "scripts" / "search_docs.py",
}
RELEASE_SEARCH_MODULES = {
    "__init__.py", "backend.py", "catalog.py", "cli.py", "constants.py",
    "content.py", "expansion.py", "models.py", "output.py", "query.py",
    "ranking.py", "resolve.py", "sqlite_backend.py",
}
RELEASE_STDX_MODULES = {
    "__init__.py", "archive.py", "cli.py", "errors.py", "manifest.py",
    "models.py", "policy.py", "system.py",
}

sys.path.insert(0, str(MAINTENANCE_ROOT))
import build_knowledge_db  # noqa: E402
import build_search_index  # noqa: E402


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Build the .agents/skills/cangjie-coding SQLite knowledge database."
    )
    parser.add_argument(
        "--check",
        action="store_true",
        help="Verify generated artifacts without modifying them",
    )
    return parser.parse_args()


def replace_bytes(path: Path, content: bytes) -> None:
    """Atomically replace a generated file in its existing project directory."""
    path.parent.mkdir(parents=True, exist_ok=True)
    descriptor, temporary_name = tempfile.mkstemp(
        prefix=path.name + ".", suffix=".tmp", dir=path.parent
    )
    temporary = Path(temporary_name)
    try:
        with os.fdopen(descriptor, "wb") as stream:
            stream.write(content)
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(temporary, path)
    finally:
        if temporary.exists():
            temporary.unlink()


def check_routing_index(expected: bytes) -> None:
    if not ROUTING_INDEX.is_file() or ROUTING_INDEX.read_bytes() != expected:
        raise ValueError("routing index is missing or stale; run python build.py")


def publish_runtime(check: bool) -> None:
    """Copy the authoritative development Skill files into the release tree."""
    mappings = dict(RELEASE_FILES)
    module_root = SCRIPT_ROOT / "doc_search"
    release_module_root = SKILL_ROOT / "scripts" / "doc_search"
    mappings.update(
        (module_root / name, release_module_root / name)
        for name in RELEASE_SEARCH_MODULES
    )
    stdx_module_root = SCRIPT_ROOT / "stdx_setup"
    release_stdx_root = SKILL_ROOT / "scripts" / "stdx_setup"
    mappings.update(
        (stdx_module_root / name, release_stdx_root / name)
        for name in RELEASE_STDX_MODULES
    )
    missing = [str(source) for source in mappings if not source.is_file()]
    if missing:
        raise ValueError(f"release source files are missing: {missing}")
    stale = [target for source, target in mappings.items() if not target.is_file() or target.read_bytes() != source.read_bytes()]
    unexpected = []
    for root, allowed in (
        (release_module_root, RELEASE_SEARCH_MODULES),
        (release_stdx_root, RELEASE_STDX_MODULES),
    ):
        if root.is_dir():
            unexpected.extend(path for path in root.iterdir() if path.is_file() and path.name not in allowed)
    cache_paths = [
        path for path in (SKILL_ROOT / "scripts").rglob("__pycache__") if path.is_dir()
    ] if (SKILL_ROOT / "scripts").is_dir() else []
    if check:
        if stale or unexpected or cache_paths:
            paths = [str(path) for path in stale + unexpected + cache_paths]
            raise ValueError(f"published Skill runtime is stale; run python build.py: {paths}")
        return
    for source, target in mappings.items():
        replace_bytes(target, source.read_bytes())
    for path in unexpected:
        path.unlink()
    for path in sorted(cache_paths, key=lambda item: len(item.parts), reverse=True):
        for child in path.iterdir():
            if child.is_file():
                child.unlink()
        path.rmdir()


def main() -> int:
    args = parse_args()
    if not (PROJECT_ROOT / "SKILL").is_file():
        raise ValueError(f"development Skill entry is missing: {PROJECT_ROOT / 'SKILL'}")

    expected_index = build_search_index.encoded_payload()
    if args.check:
        publish_runtime(check=True)
        check_routing_index(expected_index)
        result = build_knowledge_db.verify_database(REFERENCE_ROOT, DATABASE)
        action = "verified"
    else:
        publish_runtime(check=False)
        if not ROUTING_INDEX.is_file() or ROUTING_INDEX.read_bytes() != expected_index:
            replace_bytes(ROUTING_INDEX, expected_index)
            print(
                f"updated {ROUTING_INDEX}: "
                f"{len(build_search_index.build_payload()['pages'])} pages, "
                f"{len(expected_index)} bytes"
            )
        result = build_knowledge_db.build_database(REFERENCE_ROOT, DATABASE)
        action = "built"

    file_hash = hashlib.sha256(DATABASE.read_bytes()).hexdigest()
    print(
        f"{action} {DATABASE}: {result['documents']} documents, {result['bytes']} bytes"
    )
    print(f"logical_hash={result['logical_hash']}")
    print(f"database_sha256={file_hash}")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (OSError, ValueError, sqlite3.Error) as exc:
        print(f"error: {exc}", file=sys.stderr)
        raise SystemExit(2)
