from __future__ import annotations

import argparse
import json
import sys
import time
from pathlib import Path

from .backend import load_pages, load_records
from .catalog import build_catalog
from .constants import DEFAULT_MAX_CHARS, DEFAULT_MAX_PAGES
from .expansion import enforce_expansion_limits, expand_records, expansion_payload, keep_bounded_roots
from .output import append_trace, batch_match_payload, print_expansion, print_manifest, rendered
from .query import routing_terms_for
from .ranking import compact_routing_hits, manifest_hits
from .resolve import resolve_query_batch_tolerant


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Search layered Cangjie 1.1.3 docs.")
    parser.add_argument("query", nargs="*", help="Words, qualified symbol, or subtree name")
    parser.add_argument(
        "--query",
        dest="batch_queries",
        action="append",
        default=[],
        help="Independent compact query; repeat to batch several lookups in one process",
    )
    parser.add_argument("--domain", action="append", default=[], help="language/std/stdx/tools/api/examples/all; repeatable")
    parser.add_argument("--kind", action="append", default=[], help="Filter manifest kind; repeatable")
    parser.add_argument("--max-results", type=int, default=3, help="Maximum results, 1-30 (default: 3)")
    parser.add_argument("--all-terms", action="store_true", help="Require all query terms")
    parser.add_argument(
        "--view",
        choices=("matches", "indexes", "leaves"),
        default="matches",
        help="matches: compact search results; indexes/leaves: full pages in a resolved subtree",
    )
    parser.add_argument(
        "--node",
        action="append",
        default=[],
        help="Exact document ID or path to expand; repeat to combine subtrees",
    )
    parser.add_argument("--depth", type=int, help="Maximum descendant distance for subtree expansion")
    parser.add_argument("--estimate", action="store_true", help="With --view indexes/leaves, size expansion without page bodies")
    parser.add_argument("--max-pages", type=int, default=DEFAULT_MAX_PAGES, help="Expansion page limit")
    parser.add_argument("--max-chars", type=int, default=DEFAULT_MAX_CHARS, help="Expansion character limit")
    parser.add_argument("--force", action="store_true", help="Allow an expansion beyond page/character limits")
    parser.add_argument("--json", action="store_true", help="Emit JSON")
    parser.add_argument(
        "--trace-file",
        type=Path,
        help="Append one machine-readable JSONL audit record for this invocation",
    )
    return parser.parse_args()

def main() -> int:
    started = time.perf_counter()
    args = parse_args()
    if not 1 <= args.max_results <= 30:
        raise SystemExit("--max-results must be between 1 and 30")
    if args.depth is not None and args.depth < 0:
        raise SystemExit("--depth must be zero or greater")
    if args.max_pages < 1:
        raise SystemExit("--max-pages must be at least 1")
    if args.max_chars < 1:
        raise SystemExit("--max-chars must be at least 1")
    positional_query = " ".join(args.query).strip()
    queries = ([positional_query] if positional_query else []) + [item.strip() for item in args.batch_queries if item.strip()]
    query = queries[0] if len(queries) == 1 else ""
    terms = routing_terms_for(query)
    try:
        if args.view == "matches" and args.node:
            raise ValueError("--node requires --view indexes or --view leaves")
        if args.view == "matches" and (args.depth is not None or args.estimate or args.force):
            raise ValueError("--depth, --estimate and --force require a subtree --view mode")
        if args.view == "matches" and not queries:
            raise ValueError("query must contain at least one word")
        if args.view != "matches":
            catalog = build_catalog(load_records())
            roots, warnings = resolve_query_batch_tolerant(queries, catalog, args)
            roots, policy_warnings = keep_bounded_roots(roots, catalog, args)
            warnings.extend(policy_warnings)
            selected = expand_records(roots, catalog, args.view, args.depth)
            pages = load_pages(selected, include_content=not args.estimate)
            enforce_expansion_limits(pages, args)
            payload = expansion_payload(args.view, roots, pages, args.estimate, warnings)
            output = (
                json.dumps(payload, ensure_ascii=False, indent=2)
                if args.json else rendered(print_expansion, payload, args.estimate)
            )
            sys.stdout.write(output + ("" if output.endswith("\n") else "\n"))
            append_trace(args, {
                "mode": args.view, "queries": queries, "result_count": len(payload["pages"]),
                "result_ids": [item["id"] for item in payload["pages"]],
                "content_characters": payload["stats"]["characters"], "response_characters": len(output),
                "warnings": warnings,
            }, started)
        else:
            groups = []
            outputs = []
            seen_documents: dict[str, str] | None = {} if len(queries) > 1 else None
            for item in queries:
                item_terms = routing_terms_for(item)
                if not item_terms:
                    raise ValueError(f"query must contain at least one word: {item!r}")
                item_hits = compact_routing_hits(
                    manifest_hits(item, item_terms, args, limit=None), item, args.max_results
                )
                groups.append((item, item_terms, item_hits))
                outputs.append(rendered(print_manifest, item_hits, item, item_terms, seen_documents))
            if args.json:
                result = batch_match_payload(groups)
                output = json.dumps(result[0]["results"] if len(result) == 1 else {"queries": result}, ensure_ascii=False, indent=2)
            else:
                output = "\n".join(part.rstrip() for part in outputs) + "\n"
            sys.stdout.write(output + ("" if output.endswith("\n") else "\n"))
            append_trace(args, {
                "mode": "matches", "queries": queries,
                "result_count": sum(len(item_hits) for _, _, item_hits in groups),
                "result_ids": [str(hit.record["id"]) for _, _, item_hits in groups for hit in item_hits],
                "response_characters": len(output),
            }, started)
    except ValueError as exc:
        append_trace(args, {"mode": args.view, "queries": queries, "error": str(exc)}, started)
        raise SystemExit(str(exc)) from exc
    return 0
