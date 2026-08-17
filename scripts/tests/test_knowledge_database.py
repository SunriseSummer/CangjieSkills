#!/usr/bin/env python3
"""Regression and differential tests for the SQLite release backend."""

from __future__ import annotations

import hashlib
import json
import os
import shutil
import sqlite3
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch


SCRIPT_DIR = Path(__file__).resolve().parent
DEV_ROOT = SCRIPT_DIR.parents[1]
SKILL_ROOT = DEV_ROOT / ".agents" / "skills" / "cangjie-coding"
DATABASE = SKILL_ROOT / "references" / "knowledge.sqlite3"
RELEASE_SEARCH = SKILL_ROOT / "scripts" / "search_docs.py"
EVALUATION_QUERIES = SCRIPT_DIR / "data" / "retrieval-evaluation-queries.json"
DOCUMENT_COUNT = 8136

sys.dont_write_bytecode = True
sys.path.insert(0, str(SKILL_ROOT / "scripts"))
import search_docs
from doc_search.sqlite_backend import SQLiteBackend
sys.path.insert(0, str(SCRIPT_DIR.parent / "maintenance"))
import build_knowledge_db


def run_search(script: Path, arguments: list[str]) -> subprocess.CompletedProcess[str]:
    environment = os.environ.copy()
    environment["PYTHONDONTWRITEBYTECODE"] = "1"
    return subprocess.run(
        [sys.executable, str(script), *arguments],
        capture_output=True,
        text=True,
        encoding="utf-8",
        errors="replace",
        env=environment,
        timeout=60,
        check=False,
    )


class KnowledgeDatabaseTests(unittest.TestCase):
    def test_standard_project_layout_and_root_build_entrypoint(self) -> None:
        self.assertFalse((DEV_ROOT / ".skills-dev-utils").exists())
        self.assertFalse((DEV_ROOT / "cangjie-coding").exists())
        self.assertFalse((DEV_ROOT / "assets").exists())
        self.assertTrue(EVALUATION_QUERIES.is_file())
        self.assertTrue((DEV_ROOT / "README.md").is_file())
        self.assertTrue((DEV_ROOT / "build.py").is_file())
        completed = subprocess.run(
            [sys.executable, str(DEV_ROOT / "build.py"), "--check"],
            capture_output=True,
            text=True,
            encoding="utf-8",
            errors="replace",
            timeout=30,
            check=False,
        )
        self.assertEqual(completed.returncode, 0, completed.stderr)
        self.assertIn("database_sha256=", completed.stdout)
        self.assertFalse((SKILL_ROOT / "scripts" / "__pycache__").exists())

    def test_release_contains_only_runtime_files(self) -> None:
        files = {
            path.relative_to(SKILL_ROOT).as_posix()
            for path in SKILL_ROOT.rglob("*")
            if path.is_file()
        }
        expected = {
                "SKILL.md",
                "references/knowledge.sqlite3",
                "scripts/search_docs.py",
                "scripts/setup_stdx.py",
        }
        expected.update(
            f"scripts/doc_search/{name}"
            for name in {
                "__init__.py", "backend.py", "catalog.py", "cli.py", "constants.py",
                "content.py", "expansion.py", "models.py", "output.py", "query.py",
                "ranking.py", "resolve.py", "sqlite_backend.py",
            }
        )
        expected.update(
            f"scripts/stdx_setup/{name}"
            for name in {
                "__init__.py", "archive.py", "cli.py", "errors.py",
                "manifest.py", "models.py", "policy.py", "system.py",
            }
        )
        self.assertEqual(files, expected)

    def test_database_identity_schema_and_counts(self) -> None:
        connection = sqlite3.connect(DATABASE)
        try:
            self.assertEqual(
                connection.execute("PRAGMA application_id").fetchone()[0],
                build_knowledge_db.APPLICATION_ID,
            )
            self.assertEqual(connection.execute("PRAGMA user_version").fetchone()[0], 2)
            self.assertEqual(connection.execute("PRAGMA quick_check").fetchone()[0], "ok")
            metadata = dict(connection.execute("SELECT key,value FROM meta"))
            self.assertEqual(metadata["cangjie_version"], "1.1.3")
            self.assertEqual(metadata["stdx_version"], "1.1.3.1")
            self.assertEqual(int(metadata["document_count"]), DOCUMENT_COUNT)
            self.assertNotIn("source_document_count", metadata)
            self.assertEqual(
                connection.execute("SELECT count(*) FROM documents").fetchone()[0], DOCUMENT_COUNT
            )
            tables = {
                row[0]
                for row in connection.execute(
                    "SELECT name FROM sqlite_master WHERE type='table'"
                )
            }
            self.assertNotIn("source_documents", tables)
            self.assertNotIn("docs_fts", tables)
        finally:
            connection.close()

    def test_database_matches_every_authoritative_page(self) -> None:
        result = build_knowledge_db.verify_database(DEV_ROOT / "references", DATABASE)
        self.assertEqual(result["documents"], DOCUMENT_COUNT)

    def test_runtime_metadata_matches_authoring_manifests(self) -> None:
        expected = [
            build_knowledge_db.runtime_record(record)
            for record in build_knowledge_db.load_records(DEV_ROOT / "references")
        ]
        self.assertEqual(search_docs.load_records(), expected)

    def test_build_is_byte_deterministic(self) -> None:
        with tempfile.TemporaryDirectory(prefix="cangjie-db-repro-") as temporary:
            first = Path(temporary) / "first.sqlite3"
            second = Path(temporary) / "second.sqlite3"
            build_knowledge_db.build_database(DEV_ROOT / "references", first)
            build_knowledge_db.build_database(DEV_ROOT / "references", second)
            self.assertEqual(
                hashlib.sha256(first.read_bytes()).digest(),
                hashlib.sha256(second.read_bytes()).digest(),
            )

    def test_release_connection_is_query_only(self) -> None:
        backend = SQLiteBackend(SKILL_ROOT)
        try:
            connection = backend.connection()
            self.assertEqual(connection.execute("PRAGMA query_only").fetchone()[0], 1)
            with self.assertRaises(sqlite3.OperationalError):
                connection.execute("DELETE FROM meta")
        finally:
            backend.close()

    def test_estimate_reads_character_metadata_without_decompression(self) -> None:
        catalog = search_docs.build_catalog(search_docs.load_records())
        root = search_docs.resolve_exact_selector(
            "language.collections", catalog, type("Args", (), {"domain": [], "kind": []})()
        )
        selected = search_docs.expand_records([root], catalog, "indexes", depth=1)
        backend = SQLiteBackend(SKILL_ROOT)
        with patch("doc_search.sqlite_backend.decode_body", side_effect=AssertionError("decompressed")):
            pages = backend.load_pages(selected, include_content=False)
        self.assertTrue(pages)
        self.assertTrue(all(page.content is None and page.characters > 0 for page in pages))

    def test_schema_mismatch_fails_closed(self) -> None:
        with tempfile.TemporaryDirectory(prefix="cangjie-db-schema-") as temporary:
            altered = Path(temporary) / "knowledge.sqlite3"
            shutil.copy2(DATABASE, altered)
            connection = sqlite3.connect(altered)
            connection.execute("UPDATE meta SET value='999' WHERE key='schema_version'")
            connection.commit()
            connection.close()
            backend = SQLiteBackend(SKILL_ROOT)
            backend.database = altered
            try:
                with self.assertRaisesRegex(ValueError, "unsupported knowledge database schema"):
                    backend.connection()
            finally:
                backend.close()

    def test_representative_expansions_are_complete_and_provenance_free(self) -> None:
        cases = [
            [
                "--node", "language.generic", "--view", "indexes",
                "--depth", "1", "--estimate", "--json",
            ],
            ["--node", "examples.project-build.unit-test", "--view", "leaves", "--json"],
        ]
        for arguments in cases:
            with self.subTest(arguments=arguments):
                completed = run_search(RELEASE_SEARCH, arguments)
                self.assertEqual(completed.returncode, 0, completed.stderr)
                payload = json.loads(completed.stdout)
                self.assertTrue(payload["roots"])
                self.assertTrue(payload["pages"])
                for page in payload["pages"]:
                    if "content" in page:
                        self.assertNotRegex(page["content"].splitlines()[0], r'\bsource="')

    def test_v5_query_contracts_cover_known_evaluation_failures(self) -> None:
        completed = run_search(
            RELEASE_SEARCH,
            [
                "--query", "PI std.math",
                "--query", "Array Float64 initialization constructor",
                "--query", "Byte literal byte b'a' b'0'",
                "--query", "Float64 isFinite isNaN isInf",
                "--query", "C FFI clang Werror native library",
                "--max-results", "3", "--json",
            ],
        )
        self.assertEqual(completed.returncode, 0, completed.stderr)
        payload = json.loads(completed.stdout)
        results = {
            item["query"]: item["results"]
            for item in payload["queries"]
        }
        self.assertEqual(
            results["PI std.math"][0]["id"],
            "std.math.interface.floatingpoint.getpi",
        )
        self.assertEqual(
            results["Array Float64 initialization constructor"][0]["id"],
            "std.core.struct.array.init",
        )
        self.assertTrue(
            any("byte-literal-conversion" in item["id"] for item in results["Byte literal byte b'a' b'0'"])
        )
        self.assertTrue(
            any(item["id"] == "std.core.intrinsic.float64" for item in results["Float64 isFinite isNaN isInf"])
        )
        cffi_text = json.dumps(results["C FFI clang Werror native library"], ensure_ascii=False)
        self.assertIn("-Werror", cffi_text)

    def test_all_73_evaluation_queries_return_database_backed_results(self) -> None:
        queries = json.loads(EVALUATION_QUERIES.read_text(encoding="utf-8"))
        self.assertEqual(len(queries), 73)
        arguments: list[str] = []
        for query in queries:
            arguments.extend(("--query", query))
        arguments.extend(("--max-results", "3", "--json"))
        completed = run_search(RELEASE_SEARCH, arguments)
        self.assertEqual(completed.returncode, 0, completed.stderr)
        payload = json.loads(completed.stdout)
        self.assertEqual([item["query"] for item in payload["queries"]], queries)
        for item in payload["queries"]:
            with self.subTest(query=item["query"]):
                self.assertTrue(item["results"])


if __name__ == "__main__":
    unittest.main(verbosity=2)
