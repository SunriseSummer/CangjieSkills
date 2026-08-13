"""Release backend for the immutable, single-file SQLite knowledge base."""

from __future__ import annotations

import atexit
import gzip
import json
import sqlite3
import zlib
from collections import defaultdict
from functools import lru_cache
from pathlib import Path

from .constants import APPLICATION_ID, SCHEMA_VERSION
from .models import Page


def decode_body(value: bytes, label: str) -> str:
    try:
        return zlib.decompress(value).decode("utf-8")
    except (zlib.error, UnicodeDecodeError) as exc:
        raise ValueError(f"corrupt compressed document {label}: {exc}") from exc


class SQLiteBackend:
    def __init__(self, skill_root: Path):
        self.skill_root = skill_root.resolve()
        self.database = self.skill_root / "references" / "knowledge.sqlite3"
        self._connection: sqlite3.Connection | None = None
        atexit.register(self.close)

    def connection(self) -> sqlite3.Connection:
        if self._connection is not None:
            return self._connection
        if not self.database.is_file():
            raise ValueError(f"knowledge database is missing: {self.database}")
        connection = sqlite3.connect(
            self.database.resolve().as_uri() + "?mode=ro&immutable=1", uri=True
        )
        connection.execute("PRAGMA query_only=ON")
        application_id = connection.execute("PRAGMA application_id").fetchone()[0]
        metadata = dict(connection.execute("SELECT key,value FROM meta"))
        if application_id != APPLICATION_ID:
            connection.close()
            raise ValueError(f"not a cangjie-coding knowledge database: {self.database}")
        if metadata.get("schema_version") != SCHEMA_VERSION:
            connection.close()
            raise ValueError(
                f"unsupported knowledge database schema {metadata.get('schema_version')!r}; "
                f"expected {SCHEMA_VERSION}"
            )
        self._connection = connection
        return connection

    def close(self) -> None:
        if self._connection is not None:
            self._connection.close()
            self._connection = None

    @lru_cache(maxsize=1)
    def load_records(self) -> list[dict]:
        try:
            signatures: dict[int, list[str]] = defaultdict(list)
            for rowid, signature in self.connection().execute(
                "SELECT document_rowid,signature FROM signatures ORDER BY document_rowid,ordinal"
            ):
                signatures[int(rowid)].append(str(signature))
            records: list[dict] = []
            query = (
                "SELECT rowid,id,kind,level,parent_id,path,title,summary,"
                "declared_domain,package,signature FROM documents ORDER BY rowid"
            )
            for row in self.connection().execute(query):
                rowid, record_id, kind, level, parent, path, title, summary, domain, package, signature = row
                record = {
                    "id": str(record_id), "kind": str(kind), "level": int(level),
                    "parent": str(parent), "path": str(path), "title": str(title),
                    "summary": str(summary),
                }
                if signature:
                    record["signature"] = str(signature)
                if signatures.get(int(rowid)):
                    record["signatures"] = signatures[int(rowid)]
                if domain:
                    record["domain"] = str(domain)
                if package:
                    record["package"] = str(package)
                records.append(record)
            return records
        except sqlite3.Error as exc:
            raise ValueError(f"invalid document records in {self.database}: {exc}") from exc

    @lru_cache(maxsize=1)
    def load_search_content_index(self) -> dict[str, str]:
        try:
            row = self.connection().execute(
                "SELECT content FROM assets WHERE name='routing-index.json.gz'"
            ).fetchone()
            if row is None:
                raise ValueError("routing-index.json.gz asset is missing")
            payload = json.loads(gzip.decompress(row[0]).decode("utf-8"))
        except (sqlite3.Error, OSError, UnicodeDecodeError, json.JSONDecodeError) as exc:
            raise ValueError(f"invalid routing index in {self.database}: {exc}") from exc
        pages = payload.get("pages") if payload.get("format") == 1 else None
        if not isinstance(pages, dict) or not all(
            isinstance(key, str) and isinstance(value, str) for key, value in pages.items()
        ):
            raise ValueError(f"invalid routing index schema in {self.database}")
        return pages

    @lru_cache(maxsize=None)
    def load_page_content(self, relative_path: str) -> str:
        row = self.connection().execute(
            "SELECT body_zlib FROM documents WHERE path=?", (relative_path,)
        ).fetchone()
        return "" if row is None else decode_body(row[0], relative_path)

    def load_pages(
        self, selected: list[tuple[dict, int]], include_content: bool = True
    ) -> list[Page]:
        ids = [str(record["id"]) for record, _ in selected]
        stored: dict[str, tuple[int, bytes | None]] = {}
        for start in range(0, len(ids), 500):
            chunk = ids[start : start + 500]
            placeholders = ",".join("?" for _ in chunk)
            columns = "id,body_chars,body_zlib" if include_content else "id,body_chars,NULL"
            for record_id, characters, body in self.connection().execute(
                f"SELECT {columns} FROM documents WHERE id IN ({placeholders})", chunk
            ):
                stored[str(record_id)] = (int(characters), body)
        pages: list[Page] = []
        for record, distance in selected:
            record_id = str(record["id"])
            if record_id not in stored:
                raise ValueError(f"missing page for {record_id}: references/{record.get('path')}")
            characters, compressed = stored[record_id]
            content = decode_body(compressed, str(record.get("path", record_id))) if include_content else None
            if content is not None and len(content) != characters:
                raise ValueError(f"document length mismatch for {record_id}")
            pages.append(Page(record, content, distance, characters))
        return pages
