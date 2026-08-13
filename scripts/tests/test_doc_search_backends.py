#!/usr/bin/env python3
"""Differential tests for the Markdown and SQLite query frontends."""

from __future__ import annotations

import os
import subprocess
import sys
import unittest
from pathlib import Path


SCRIPT_DIR = Path(__file__).resolve().parent
DEV_ROOT = SCRIPT_DIR.parents[1]
DEV_SEARCH = DEV_ROOT / "scripts" / "search_docs.py"
RELEASE_ROOT = DEV_ROOT / ".agents" / "skills" / "cangjie-coding"
RELEASE_SEARCH = RELEASE_ROOT / "scripts" / "search_docs.py"


def run(script: Path, arguments: list[str]) -> subprocess.CompletedProcess[str]:
    environment = os.environ.copy()
    environment["PYTHONDONTWRITEBYTECODE"] = "1"
    return subprocess.run(
        [sys.executable, str(script), *arguments],
        capture_output=True,
        text=True,
        encoding="utf-8",
        errors="replace",
        timeout=30,
        env=environment,
        check=False,
    )


class BackendParityTests(unittest.TestCase):
    def test_representative_queries_have_identical_results(self) -> None:
        cases = [
            ["--query", "HashMap get", "--query", "enum pattern", "--max-results", "2", "--json"],
            ["--node", "language.collections", "--view", "indexes", "--depth", "1", "--estimate", "--json"],
            ["--node", "std.collection.class.hashmap.get", "--view", "leaves", "--json"],
            ["宏包 开发 引用 编译", "--domain", "examples", "--max-results", "3", "--json"],
        ]
        for arguments in cases:
            with self.subTest(arguments=arguments):
                markdown = run(DEV_SEARCH, arguments)
                sqlite = run(RELEASE_SEARCH, arguments)
                self.assertEqual(markdown.returncode, 0, markdown.stderr)
                self.assertEqual(sqlite.returncode, 0, sqlite.stderr)
                self.assertEqual(markdown.stdout, sqlite.stdout)

    def test_query_modules_remain_small_and_release_specific(self) -> None:
        source_root = DEV_ROOT / "scripts" / "doc_search"
        for path in source_root.glob("*.py"):
            with self.subTest(path=path.name):
                lines = path.read_text(encoding="utf-8").splitlines()
                self.assertLessEqual(len(lines), 300)
        published = RELEASE_ROOT / "scripts" / "doc_search"
        self.assertFalse((published / "markdown_backend.py").exists())
        self.assertFalse((published / "sqlite_entry.py").exists())


if __name__ == "__main__":
    unittest.main()
