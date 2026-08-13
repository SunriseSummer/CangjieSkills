#!/usr/bin/env python3
"""Print a bounded, read-only outline of Cangjie source files with Tree-sitter."""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path
from typing import Any


if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
if hasattr(sys.stderr, "reconfigure"):
    sys.stderr.reconfigure(encoding="utf-8", errors="replace")

try:
    import tree_sitter_cangjie as cangjie
    from tree_sitter import Language, Parser, Query, QueryCursor
except ImportError as exc:  # pragma: no cover - depends on the host environment
    raise SystemExit(
        "cj_ast.py requires tree-sitter==0.25.2 and tree-sitter-cangjie==1.0.5.post1"
    ) from exc


LANGUAGE = Language(cangjie.language())
PARSER = Parser(LANGUAGE)
TAGS_QUERY = Query(LANGUAGE, cangjie.TAGS_QUERY)
IMPORT_QUERY = Query(
    LANGUAGE,
    """
    (importList
      [
        (packageFull)
        (scoped_identifier)
        (subGroupOfPackage)
        (packageGroup)
        (packageAlias)
      ] @import.path) @import
    """,
)
MACRO_QUERY = Query(LANGUAGE, "(macroExpression) @macro")
CALL_QUERY = Query(
    LANGUAGE,
    """
    (postfixExpression
      operand: (_) @call.callee
      suffix: (callSuffix) @call.args) @call
    """,
)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Show Cangjie imports, definitions and Tree-sitter parse warnings."
    )
    parser.add_argument("paths", nargs="+", help=".cj files or directories (directories are recursive)")
    parser.add_argument("--calls", action="store_true", help="Include call candidates; may be verbose")
    parser.add_argument("--errors-only", action="store_true", help="Only print files that have parse warnings")
    parser.add_argument("--json", action="store_true", help="Emit machine-readable JSON")
    parser.add_argument("--max-items", type=int, default=80, help="Maximum records per category and file (default: 80)")
    return parser.parse_args()


def source_files(values: list[str]) -> list[Path]:
    files: set[Path] = set()
    for value in values:
        path = Path(value).expanduser()
        if path.is_file() and path.suffix.lower() == ".cj":
            files.add(path.resolve())
        elif path.is_dir():
            files.update(item.resolve() for item in path.rglob("*.cj") if item.is_file())
        else:
            print(f"warning: skip missing or non-Cangjie path: {path}", file=sys.stderr)
    return sorted(files, key=lambda item: item.as_posix())


def node_text(node, source: bytes) -> str:
    return source[node.start_byte : node.end_byte].decode("utf-8", errors="replace").strip()


def position(node) -> dict[str, int]:
    return {
        "line": node.start_point.row + 1,
        "column_bytes": node.start_point.column + 1,
        "end_line": node.end_point.row + 1,
        "end_column_bytes": node.end_point.column + 1,
        "start_byte": node.start_byte,
        "end_byte": node.end_byte,
    }


def query_matches(query: Query, root_node):
    return QueryCursor(query).matches(root_node)


def captured_nodes(query: Query, root_node, name: str):
    for _, captures in query_matches(query, root_node):
        yield from captures.get(name, [])


def macro_ranges(root_node) -> list[tuple[int, int, int, int]]:
    return [
        (node.start_byte, node.end_byte, node.start_point.row, node.end_point.row)
        for node in captured_nodes(MACRO_QUERY, root_node, "macro")
    ]


def is_macro_related(node, ranges: list[tuple[int, int, int, int]]) -> bool:
    for start, end, start_row, end_row in ranges:
        byte_overlap = node.start_byte <= end and node.end_byte >= start
        row_overlap = node.start_point.row <= end_row and node.end_point.row >= start_row
        if byte_overlap or row_overlap:
            return True
    return False


def parse_warnings(root_node, source: bytes, ranges) -> list[dict[str, Any]]:
    warnings: list[dict[str, Any]] = []
    stack = [root_node]
    source_lines = source.decode("utf-8", errors="replace").splitlines()
    while stack:
        node = stack.pop()
        if node.type == "ERROR" or node.is_missing:
            line_index = node.start_point.row
            snippet = source_lines[line_index].strip() if line_index < len(source_lines) else ""
            warnings.append(
                {
                    "kind": f"MISSING {node.type}" if node.is_missing else "ERROR",
                    **position(node),
                    "macro_related": is_macro_related(node, ranges),
                    "snippet": snippet[:240],
                }
            )
        stack.extend(reversed(node.children))
    warnings.sort(key=lambda item: (item["start_byte"], item["end_byte"], item["kind"]))
    return warnings


def imports(root_node, source: bytes) -> list[dict[str, Any]]:
    records = []
    seen = set()
    for node in captured_nodes(IMPORT_QUERY, root_node, "import.path"):
        value = node_text(node, source)
        key = (node.start_byte, node.end_byte, value)
        if key in seen:
            continue
        seen.add(key)
        records.append({"path": value, **position(node)})
    return sorted(records, key=lambda item: item["start_byte"])


def definitions(root_node, source: bytes) -> list[dict[str, Any]]:
    records = []
    seen = set()
    for _, captures in query_matches(TAGS_QUERY, root_node):
        names = captures.get("name", [])
        for capture_name, nodes in captures.items():
            if not capture_name.startswith("definition."):
                continue
            kind = capture_name.removeprefix("definition.")
            for node in nodes:
                candidates = [
                    item
                    for item in names
                    if node.start_byte <= item.start_byte and item.end_byte <= node.end_byte
                ]
                name_node = candidates[0] if candidates else (names[0] if names else node)
                name = node_text(name_node, source).splitlines()[0][:160]
                key = (kind, name, node.start_byte)
                if key in seen:
                    continue
                seen.add(key)
                records.append({"kind": kind, "name": name, **position(node)})
    return sorted(records, key=lambda item: (item["start_byte"], item["kind"], item["name"]))


def calls(root_node, source: bytes) -> list[dict[str, Any]]:
    records = []
    seen = set()
    for _, captures in query_matches(CALL_QUERY, root_node):
        for node in captures.get("call.callee", []):
            value = node_text(node, source).replace("\n", " ")[:200]
            key = (value, node.start_byte, node.end_byte)
            if key in seen:
                continue
            seen.add(key)
            records.append({"callee": value, **position(node)})
    return sorted(records, key=lambda item: item["start_byte"])


def analyze(path: Path, include_calls: bool, max_items: int) -> dict[str, Any]:
    source = path.read_bytes()
    tree = PARSER.parse(source)
    ranges = macro_ranges(tree.root_node)
    warning_records = parse_warnings(tree.root_node, source, ranges)
    import_records = imports(tree.root_node, source)
    definition_records = definitions(tree.root_node, source)
    call_records = calls(tree.root_node, source) if include_calls else []

    def bounded(items: list[dict[str, Any]]) -> tuple[list[dict[str, Any]], int]:
        return items[:max_items], max(0, len(items) - max_items)

    warning_items, warning_omitted = bounded(warning_records)
    import_items, import_omitted = bounded(import_records)
    definition_items, definition_omitted = bounded(definition_records)
    call_items, call_omitted = bounded(call_records)
    return {
        "file": str(path),
        "bytes": len(source),
        "root_type": tree.root_node.type,
        "has_parse_warning": bool(warning_records),
        "counts": {
            "imports": len(import_records),
            "definitions": len(definition_records),
            "macros": len(ranges),
            "calls": len(call_records) if include_calls else None,
            "warnings": len(warning_records),
            "macro_related_warnings": sum(item["macro_related"] for item in warning_records),
        },
        "omitted": {
            "imports": import_omitted,
            "definitions": definition_omitted,
            "calls": call_omitted,
            "warnings": warning_omitted,
        },
        "imports": import_items,
        "definitions": definition_items,
        "calls": call_items if include_calls else None,
        "warnings": warning_items,
    }


def print_human(records: list[dict[str, Any]], include_calls: bool) -> None:
    for record in records:
        counts = record["counts"]
        state = "parse-warning" if record["has_parse_warning"] else "parse-ok"
        call_summary = f" calls={counts['calls']}" if include_calls else ""
        print(
            f"{record['file']}: {state} imports={counts['imports']} "
            f"definitions={counts['definitions']} macros={counts['macros']}"
            f" warnings={counts['warnings']}{call_summary}"
        )
        for item in record["imports"]:
            print(f"  import L{item['line']}: {item['path']}")
        for item in record["definitions"]:
            print(f"  {item['kind']} L{item['line']}: {item['name']}")
        if include_calls:
            for item in record["calls"]:
                print(f"  call L{item['line']}: {item['callee']}")
        for item in record["warnings"]:
            suffix = " macro_related" if item["macro_related"] else ""
            print(
                f"  TREE-SITTER {item['kind']} L{item['line']}:{item['column_bytes']}"
                f"{suffix}: {item['snippet']}"
            )
        omitted = {key: value for key, value in record["omitted"].items() if value}
        if omitted:
            print(f"  omitted: {omitted}")


def main() -> int:
    args = parse_args()
    if not 1 <= args.max_items <= 1000:
        raise SystemExit("--max-items must be between 1 and 1000")
    files = source_files(args.paths)
    if not files:
        raise SystemExit("no .cj files found")
    records = [analyze(path, args.calls, args.max_items) for path in files]
    if args.errors_only:
        records = [record for record in records if record["has_parse_warning"]]
    if args.json:
        print(json.dumps(records, ensure_ascii=False, indent=2))
    else:
        print_human(records, args.calls)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
