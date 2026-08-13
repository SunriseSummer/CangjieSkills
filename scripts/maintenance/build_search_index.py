#!/usr/bin/env python3
"""Build the compact full-text routing index used by search_docs.py."""

from __future__ import annotations

import argparse
import gzip
import json
import sys
from pathlib import Path


SCRIPT_DIR = Path(__file__).resolve().parent
DEV_ROOT = SCRIPT_DIR.parents[1]
SCRIPT_ROOT = DEV_ROOT / "scripts"
SKILL_ROOT = DEV_ROOT / ".agents" / "skills" / "cangjie-coding"
REFERENCE_ROOT = DEV_ROOT / "references"
SEARCH_CONTENT_INDEX = REFERENCE_ROOT / "search-content.json.gz"
sys.dont_write_bytecode = True
sys.path.insert(0, str(SCRIPT_ROOT))
import search_docs
sys.path.insert(0, str(SCRIPT_DIR))
import build_knowledge_db


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Build or verify the compressed document search index.")
    parser.add_argument("--check", action="store_true", help="Fail if the committed index is missing or stale")
    return parser.parse_args()


def build_payload() -> dict[str, object]:
    pages: dict[str, str] = {}
    for record in build_knowledge_db.load_records(REFERENCE_ROOT):
        relative = str(record.get("path", ""))
        if not relative or relative in pages:
            continue
        page = REFERENCE_ROOT / relative
        if not page.is_file():
            raise ValueError(f"cannot index missing page: references/{relative}")
        pages[relative] = search_docs.prepare_search_content(
            page.read_text(encoding="utf-8-sig", errors="replace")
        )
    return {"format": 1, "pages": dict(sorted(pages.items()))}


def encoded_payload() -> bytes:
    raw = json.dumps(
        build_payload(), ensure_ascii=False, sort_keys=True, separators=(",", ":")
    ).encode("utf-8")
    return gzip.compress(raw, compresslevel=9, mtime=0)


def main() -> int:
    args = parse_args()
    payload = build_payload()
    raw = json.dumps(payload, ensure_ascii=False, sort_keys=True, separators=(",", ":")).encode("utf-8")
    expected = gzip.compress(raw, compresslevel=9, mtime=0)
    target = SEARCH_CONTENT_INDEX
    if args.check:
        if not target.is_file() or target.read_bytes() != expected:
            print("search content index is missing or stale; run scripts/maintenance/build_search_index.py", file=sys.stderr)
            return 1
        print(f"search content index is current: {len(payload['pages'])} pages, {target.stat().st_size} bytes")
        return 0
    target.write_bytes(expected)
    print(f"wrote {target}: {len(payload['pages'])} pages, {len(expected)} bytes")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (OSError, ValueError) as exc:
        print(f"error: {exc}", file=sys.stderr)
        raise SystemExit(2)
