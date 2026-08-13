#!/usr/bin/env python3
"""Benchmark the development Markdown and release SQLite query backends."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import sqlite3
import statistics
import subprocess
import sys
import time
import zlib
from pathlib import Path


SCRIPT_DIR = Path(__file__).resolve().parent
DEV_ROOT = SCRIPT_DIR.parents[1]
RELEASE_SKILL = DEV_ROOT / ".agents" / "skills" / "cangjie-coding"
MARKDOWN_SEARCH = DEV_ROOT / "scripts" / "search_docs.py"
QUERY_FILE = DEV_ROOT / "scripts" / "tests" / "data" / "retrieval-evaluation-queries.json"


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Benchmark Markdown/SQLite query backends.")
    parser.add_argument("--output", type=Path)
    return parser.parse_args()


def file_metrics(root: Path) -> dict[str, int]:
    files = [path for path in root.rglob("*") if path.is_file()]
    return {"files": len(files), "bytes": sum(path.stat().st_size for path in files)}


def run(script: Path, arguments: list[str]) -> tuple[float, int, str, str]:
    environment = os.environ.copy()
    environment["PYTHONDONTWRITEBYTECODE"] = "1"
    started = time.perf_counter()
    completed = subprocess.run(
        [sys.executable, str(script), *arguments],
        capture_output=True,
        text=True,
        encoding="utf-8",
        errors="replace",
        env=environment,
        timeout=90,
        check=False,
    )
    elapsed = (time.perf_counter() - started) * 1000
    return elapsed, completed.returncode, completed.stdout, completed.stderr


def summarize(values: list[float]) -> dict[str, float]:
    return {
        "rounds": len(values),
        "mean_ms": round(statistics.mean(values), 3),
        "median_ms": round(statistics.median(values), 3),
        "min_ms": round(min(values), 3),
        "max_ms": round(max(values), 3),
    }


def benchmark_case(
    name: str, arguments: list[str], rounds: int, *, compatibility_required: bool = False
) -> dict:
    scripts = {
        "markdown": MARKDOWN_SEARCH,
        "sqlite": RELEASE_SKILL / "scripts" / "search_docs.py",
    }
    timings: dict[str, list[float]] = {"markdown": [], "sqlite": []}
    outputs: dict[str, str] = {}
    for _ in range(rounds):
        for version, script in scripts.items():
            elapsed, returncode, stdout, stderr = run(script, arguments)
            if returncode != 0:
                raise RuntimeError(f"{name}/{version} failed: {stderr}")
            timings[version].append(elapsed)
            previous = outputs.setdefault(version, stdout)
            if stdout != previous:
                raise RuntimeError(f"{name}/{version} output changed between rounds")
    output_identical = outputs["markdown"] == outputs["sqlite"]
    result = {
        "name": name,
        "arguments": arguments,
        "markdown": summarize(timings["markdown"]),
        "sqlite": summarize(timings["sqlite"]),
        "compatibility_required": compatibility_required,
        "output_identical": output_identical,
        "markdown_response_characters": len(outputs["markdown"]),
        "sqlite_response_characters": len(outputs["sqlite"]),
        "response_character_delta": len(outputs["sqlite"]) - len(outputs["markdown"]),
        "markdown_response_sha256": hashlib.sha256(outputs["markdown"].encode("utf-8")).hexdigest(),
        "sqlite_response_sha256": hashlib.sha256(outputs["sqlite"].encode("utf-8")).hexdigest(),
    }
    if "--json" in arguments:
        payload = json.loads(outputs["sqlite"])
        queries = payload.get("queries") if isinstance(payload, dict) else None
        if isinstance(queries, list):
            result["sqlite_query_count"] = len(queries)
            result["sqlite_empty_query_results"] = sum(
                1 for item in queries if not item.get("results")
            )
    return result


def sqlite_microbench(database: Path) -> dict[str, float | int]:
    connection = sqlite3.connect(database.resolve().as_uri() + "?mode=ro&immutable=1", uri=True)
    connection.execute("PRAGMA query_only=ON")

    def mean_ms(action, rounds: int) -> float:
        started = time.perf_counter()
        for _ in range(rounds):
            action()
        return (time.perf_counter() - started) * 1000 / rounds

    def exact() -> int:
        row = connection.execute(
            "SELECT body_zlib FROM documents WHERE id=?",
            ("std.collection.class.arraylist.reverse",),
        ).fetchone()
        return len(zlib.decompress(row[0]))

    tree_sql = """
        WITH RECURSIVE subtree(id) AS (
            SELECT id FROM documents WHERE id=?
            UNION ALL
            SELECT documents.id FROM documents JOIN subtree
              ON documents.parent_id=subtree.id
        )
        SELECT count(*),sum(body_chars) FROM documents WHERE id IN subtree
    """
    result = {
        "sqlite_version": sqlite3.sqlite_version,
        "exact_page_with_decompression_mean_ms": round(mean_ms(exact, 500), 4),
        "recursive_tree_metadata_mean_ms": round(
            mean_ms(
                lambda: connection.execute(tree_sql, ("language.collections",)).fetchone(),
                200,
            ),
            4,
        ),
    }
    connection.close()
    return result


def main() -> int:
    args = parse_args()
    queries = json.loads(QUERY_FILE.read_text(encoding="utf-8"))
    batch_arguments: list[str] = []
    for query in queries:
        batch_arguments.extend(("--query", query))
    batch_arguments.extend(("--max-results", "3", "--json"))

    cases = [
        benchmark_case("exact-symbol", ["ArrayList reverse", "--max-results", "1", "--json"], 5),
        benchmark_case(
            "subtree-estimate",
            ["--node", "language.generic", "--view", "leaves", "--estimate", "--json"],
            5,
            compatibility_required=True,
        ),
        benchmark_case(
            "subtree-content",
            ["--node", "examples.project-build", "--view", "leaves", "--json"],
            3,
            compatibility_required=True,
        ),
        benchmark_case("stdx-setup-query", ["stdx 安装 并发", "--domain", "tools", "--max-results", "2"], 3),
        benchmark_case(f"{len(queries)}-query-batch", batch_arguments, 2),
    ]
    incompatible = [
        case["name"] for case in cases
        if case["compatibility_required"] and not case["output_identical"]
    ]
    if incompatible:
        raise RuntimeError(
            "Markdown/SQLite operations differ: " + ", ".join(incompatible)
        )
    batch = cases[-1]
    if batch.get("sqlite_query_count") != len(queries) or batch.get("sqlite_empty_query_results"):
        raise RuntimeError("evaluation batch is incomplete")

    database = RELEASE_SKILL / "references" / "knowledge.sqlite3"
    payload = {
        "schema": 1,
        "python": sys.version.split()[0],
        "packaging": {
            "release": file_metrics(RELEASE_SKILL),
            "release_references": file_metrics(RELEASE_SKILL / "references"),
        },
        "sqlite": sqlite_microbench(database),
        "cases": cases,
    }
    rendered = json.dumps(payload, ensure_ascii=False, indent=2)
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(rendered + "\n", encoding="utf-8", newline="\n")
    print(rendered)
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (OSError, RuntimeError, sqlite3.Error, subprocess.SubprocessError) as exc:
        print(f"error: {exc}", file=sys.stderr)
        raise SystemExit(2)
