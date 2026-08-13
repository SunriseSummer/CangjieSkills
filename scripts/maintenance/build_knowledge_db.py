#!/usr/bin/env python3
"""Build and verify the single-file Cangjie knowledge database."""

from __future__ import annotations

import argparse
import gzip
import hashlib
import json
import os
import sqlite3
import tempfile
import zlib
from pathlib import Path


SCRIPT_DIR = Path(__file__).resolve().parent
DEV_ROOT = SCRIPT_DIR.parents[1]
SOURCE_ROOT = DEV_ROOT / "references"
SKILL_ROOT = DEV_ROOT / ".agents" / "skills" / "cangjie-coding"
DEFAULT_DATABASE = SKILL_ROOT / "references" / "knowledge.sqlite3"
SCHEMA_VERSION = "2"
GENERATOR_VERSION = "2"
APPLICATION_ID = 0x434A534B  # "CJSK"


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Build or verify the cangjie-coding SQLite knowledge database."
    )
    parser.add_argument("--source-root", type=Path, default=SOURCE_ROOT)
    parser.add_argument("--output", type=Path, default=DEFAULT_DATABASE)
    parser.add_argument(
        "--check",
        action="store_true",
        help="Verify that the existing database exactly represents the Markdown source",
    )
    return parser.parse_args()


def canonical_json(value: object) -> bytes:
    return json.dumps(
        value, ensure_ascii=False, sort_keys=True, separators=(",", ":")
    ).encode("utf-8")


def read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8-sig", errors="replace")


def record_domain(record: dict) -> str:
    path = str(record.get("path", ""))
    declared = str(record.get("domain", ""))
    if declared and declared != "all":
        return declared
    if path.startswith("language/"):
        return "language"
    if path.startswith("tools/"):
        return "tools"
    if path.startswith("api/stdx/"):
        return "stdx"
    if path.startswith("api/std/"):
        return "std"
    if path.startswith("api/"):
        return "api"
    if path.startswith("examples/"):
        return "examples"
    return "all"


def runtime_record(record: dict) -> dict:
    """Keep only fields consumed or emitted by the release search runtime."""
    result = {
        key: record[key]
        for key in ("id", "kind", "level", "parent", "path", "title", "summary")
    }
    for key in ("signature", "signatures", "domain", "package"):
        if record.get(key):
            result[key] = record[key]
    return result


def load_records(source_root: Path) -> list[dict]:
    api_manifest = source_root / "api" / "manifest.json"
    guide_manifest = source_root / "guide-manifest.json"
    if not api_manifest.is_file() or not guide_manifest.is_file():
        raise ValueError("source root must contain api/manifest.json and guide-manifest.json")

    api_records = json.loads(api_manifest.read_text(encoding="utf-8"))
    package_ids = sorted(
        (record["id"] for record in api_records if record.get("kind") == "api-package"),
        key=len,
        reverse=True,
    )
    for record in api_records:
        record_id = str(record.get("id", ""))
        package = next(
            (
                candidate
                for candidate in package_ids
                if record_id == candidate or record_id.startswith(candidate + ".")
            ),
            None,
        )
        if package:
            record["package"] = package

    records = api_records + json.loads(guide_manifest.read_text(encoding="utf-8"))
    records.append(
        {
            "id": "references",
            "kind": "index",
            "level": 1,
            "parent": "skill",
            "path": "index.md",
            "title": "知识库总索引",
            "summary": "语言、API、应用示例与工具链入口。",
        }
    )
    return records


def logical_hash(
    records: list[dict],
    bodies: dict[str, str],
    routing_index: bytes,
) -> str:
    digest = hashlib.sha256()
    digest.update(f"schema={SCHEMA_VERSION}\ngenerator={GENERATOR_VERSION}\n".encode())
    for record in records:
        digest.update(b"record\0" + canonical_json(record) + b"\0")
        digest.update(b"body\0" + bodies[str(record["path"])].encode("utf-8") + b"\0")
    digest.update(b"routing\0" + routing_index)
    return digest.hexdigest()


def collect(source_root: Path) -> tuple[list[dict], dict[str, str], bytes, str]:
    if (source_root / "_source").exists():
        raise ValueError(
            "references/_source is not part of v5; active Markdown is the authoritative source"
        )
    records = load_records(source_root)
    ids: set[str] = set()
    paths: set[str] = set()
    bodies: dict[str, str] = {}
    for record in records:
        record_id = str(record.get("id", ""))
        relative = str(record.get("path", ""))
        if not record_id or record_id in ids:
            raise ValueError(f"missing or duplicate document id: {record_id!r}")
        if not relative or relative in paths:
            raise ValueError(f"missing or duplicate document path: {relative!r}")
        ids.add(record_id)
        paths.add(relative)
        page = source_root / relative
        if not page.is_file():
            raise ValueError(f"manifest references missing page: {relative}")
        bodies[relative] = read_text(page)

    unknown_parents = sorted(
        {
            str(record.get("parent", ""))
            for record in records
            if record.get("parent") not in ids and record.get("parent") != "skill"
        }
    )
    if unknown_parents:
        raise ValueError(f"manifest contains unknown parent ids: {unknown_parents[:5]}")
    active_markdown = {
        path.relative_to(source_root).as_posix()
        for path in source_root.rglob("*.md")
    }
    if active_markdown != paths:
        missing = sorted(active_markdown - paths)[:5]
        stale = sorted(paths - active_markdown)[:5]
        raise ValueError(
            f"active Markdown/manifest mismatch; unmanifested={missing}, missing={stale}"
        )

    routing_path = source_root / "search-content.json.gz"
    routing_index = routing_path.read_bytes()
    try:
        payload = json.loads(gzip.decompress(routing_index).decode("utf-8"))
    except (OSError, UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise ValueError(f"invalid routing index: {exc}") from exc
    indexed_paths = set(payload.get("pages", {})) if payload.get("format") == 1 else set()
    if indexed_paths != paths:
        raise ValueError("routing index paths differ from manifest paths")
    return records, bodies, routing_index, logical_hash(records, bodies, routing_index)


def create_schema(connection: sqlite3.Connection) -> None:
    connection.executescript(
        f"""
        PRAGMA application_id={APPLICATION_ID};
        PRAGMA user_version={SCHEMA_VERSION};
        PRAGMA page_size=4096;
        PRAGMA auto_vacuum=NONE;
        PRAGMA journal_mode=OFF;
        PRAGMA synchronous=OFF;
        PRAGMA temp_store=MEMORY;

        CREATE TABLE meta(
            key TEXT PRIMARY KEY,
            value TEXT NOT NULL
        ) WITHOUT ROWID;

        CREATE TABLE documents(
            rowid INTEGER PRIMARY KEY,
            id TEXT NOT NULL UNIQUE,
            parent_id TEXT,
            domain TEXT NOT NULL,
            declared_domain TEXT NOT NULL,
            kind TEXT NOT NULL,
            level INTEGER NOT NULL,
            title TEXT NOT NULL,
            summary TEXT NOT NULL,
            path TEXT NOT NULL UNIQUE,
            package TEXT NOT NULL,
            signature TEXT NOT NULL,
            body_chars INTEGER NOT NULL,
            body_sha256 BLOB NOT NULL,
            body_zlib BLOB NOT NULL
        );
        CREATE INDEX documents_parent ON documents(parent_id);
        CREATE INDEX documents_domain_kind ON documents(domain, kind);

        CREATE TABLE signatures(
            document_rowid INTEGER NOT NULL,
            ordinal INTEGER NOT NULL,
            signature TEXT NOT NULL,
            PRIMARY KEY(document_rowid, ordinal)
        ) WITHOUT ROWID;
        CREATE INDEX signatures_text ON signatures(signature);

        CREATE TABLE assets(
            name TEXT PRIMARY KEY,
            sha256 BLOB NOT NULL,
            content BLOB NOT NULL
        ) WITHOUT ROWID;
        """
    )


def build_database(source_root: Path, output: Path) -> dict[str, int | str]:
    records, bodies, routing_index, content_hash = collect(source_root)
    output = output.resolve()
    output.parent.mkdir(parents=True, exist_ok=True)
    fd, temporary_name = tempfile.mkstemp(
        prefix=output.name + ".", suffix=".tmp", dir=output.parent
    )
    os.close(fd)
    temporary = Path(temporary_name)
    try:
        connection = sqlite3.connect(temporary)
        try:
            connection.execute("PRAGMA foreign_keys=ON")
            create_schema(connection)
            metadata = {
                "schema_version": SCHEMA_VERSION,
                "generator_version": GENERATOR_VERSION,
                "cangjie_version": "1.0.5",
                "stdx_version": "1.0.5.1",
                "logical_hash": content_hash,
                "document_count": str(len(records)),
            }
            connection.executemany(
                "INSERT INTO meta(key,value) VALUES(?,?)", sorted(metadata.items())
            )

            document_rows = []
            for rowid, record in enumerate(records, 1):
                path = str(record["path"])
                body = bodies[path]
                body_bytes = body.encode("utf-8")
                document_rows.append(
                    (
                        rowid,
                        str(record["id"]),
                        str(record.get("parent", "")),
                        record_domain(record),
                        str(record.get("domain", "")),
                        str(record.get("kind", "")),
                        int(record.get("level", 0)),
                        str(record.get("title", "")),
                        str(record.get("summary", "")),
                        path,
                        str(record.get("package", "")),
                        str(record.get("signature", "")),
                        len(body),
                        hashlib.sha256(body_bytes).digest(),
                        zlib.compress(body_bytes, 9),
                    )
                )
            connection.executemany(
                "INSERT INTO documents VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
                document_rows,
            )

            signature_rows = []
            for document_rowid, record in enumerate(records, 1):
                for ordinal, signature in enumerate(record.get("signatures") or ()):
                    signature_rows.append((document_rowid, ordinal, signature))
            connection.executemany(
                "INSERT INTO signatures VALUES(?,?,?)", signature_rows
            )

            connection.execute(
                "INSERT INTO assets VALUES(?,?,?)",
                (
                    "routing-index.json.gz",
                    hashlib.sha256(routing_index).digest(),
                    routing_index,
                ),
            )
            connection.commit()
            check = connection.execute("PRAGMA quick_check").fetchone()[0]
            if check != "ok":
                raise ValueError(f"SQLite quick_check failed: {check}")
        finally:
            connection.close()
        os.replace(temporary, output)
    finally:
        if temporary.exists():
            temporary.unlink()
    return {
        "documents": len(records),
        "bytes": output.stat().st_size,
        "logical_hash": content_hash,
    }


def connect_readonly(database: Path) -> sqlite3.Connection:
    uri = database.resolve().as_uri() + "?mode=ro&immutable=1"
    connection = sqlite3.connect(uri, uri=True)
    connection.execute("PRAGMA query_only=ON")
    return connection


def verify_database(source_root: Path, database: Path) -> dict[str, int | str]:
    records, bodies, routing_index, expected_hash = collect(source_root)
    if not database.is_file():
        raise ValueError(f"database is missing: {database}")
    connection = connect_readonly(database)
    try:
        quick_check = connection.execute("PRAGMA quick_check").fetchone()[0]
        if quick_check != "ok":
            raise ValueError(f"SQLite quick_check failed: {quick_check}")
        metadata = dict(connection.execute("SELECT key,value FROM meta"))
        if metadata.get("schema_version") != SCHEMA_VERSION:
            raise ValueError(
                f"schema mismatch: {metadata.get('schema_version')} != {SCHEMA_VERSION}"
            )
        if metadata.get("logical_hash") != expected_hash:
            raise ValueError("database logical hash differs from the Markdown source")
        if int(metadata.get("document_count", -1)) != len(records):
            raise ValueError("database document count differs from the Markdown source")
        for record in records:
            row = connection.execute(
                "SELECT rowid,kind,level,parent_id,path,title,summary,declared_domain,"
                "package,signature,body_chars,body_sha256,body_zlib "
                "FROM documents WHERE id=?",
                (str(record["id"]),),
            ).fetchone()
            if row is None:
                raise ValueError(f"missing record: {record['id']}")
            (
                rowid, kind, level, parent, path, title, summary, declared_domain,
                package, signature, body_chars, body_hash, body_zlib,
            ) = row
            stored = {
                "id": str(record["id"]), "kind": kind, "level": level,
                "parent": parent, "path": path, "title": title, "summary": summary,
            }
            stored_signatures = [
                value[0] for value in connection.execute(
                    "SELECT signature FROM signatures WHERE document_rowid=? ORDER BY ordinal",
                    (rowid,),
                )
            ]
            if signature:
                stored["signature"] = signature
            if stored_signatures:
                stored["signatures"] = stored_signatures
            if declared_domain:
                stored["domain"] = declared_domain
            if package:
                stored["package"] = package
            if stored != runtime_record(record):
                raise ValueError(f"runtime metadata mismatch: {record['id']}")
            body = bodies[str(record["path"])]
            body_bytes = body.encode("utf-8")
            if body_chars != len(body) or body_hash != hashlib.sha256(body_bytes).digest():
                raise ValueError(f"body metadata mismatch: {record['id']}")
            if zlib.decompress(body_zlib).decode("utf-8") != body:
                raise ValueError(f"body mismatch: {record['id']}")
        asset = connection.execute(
            "SELECT sha256,content FROM assets WHERE name='routing-index.json.gz'"
        ).fetchone()
        if asset is None or asset[0] != hashlib.sha256(routing_index).digest() or asset[1] != routing_index:
            raise ValueError("routing index mismatch")
        return {
            "documents": len(records),
            "bytes": database.stat().st_size,
            "logical_hash": expected_hash,
        }
    finally:
        connection.close()


def main() -> int:
    args = parse_args()
    source_root = args.source_root.resolve()
    output = args.output.resolve()
    result = (
        verify_database(source_root, output)
        if args.check
        else build_database(source_root, output)
    )
    action = "verified" if args.check else "built"
    print(
        f"{action} {output}: {result['documents']} documents, {result['bytes']} bytes, "
        f"logical_hash={result['logical_hash']}"
    )
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (OSError, ValueError, sqlite3.Error) as exc:
        print(f"error: {exc}", file=os.sys.stderr)
        raise SystemExit(2)
