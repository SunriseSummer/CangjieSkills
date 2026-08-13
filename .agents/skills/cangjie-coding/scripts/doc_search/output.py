from __future__ import annotations

import argparse
import contextlib
import datetime as dt
import io
import json
import re
import sys
import time

from .backend import load_records
from .constants import GENERIC_ARGUMENT_TERMS
from .content import matching_snippets
from .models import Hit
from .query import folded_term_present, query_shape_note, terms_for, with_identifier_aliases


def print_manifest(
    hits: list[Hit], query: str, terms: list[str] | None = None,
    seen: dict[str, str] | None = None,
) -> None:
    shape_note = query_shape_note(query)
    if shape_note:
        print(shape_note)
        print()
    if not hits:
        print(
            f"No layered-document matches for {query!r}. "
            "Try fewer terms, a domain filter, or an exact document ID."
        )
        return
    print(f"Found {len(hits)} layered-document match(es) for {query!r}:")
    query_terms = terms if terms is not None else terms_for(query)
    top_matched = set(hits[0].matched_terms)
    collectively_matched = {term for hit in hits for term in hit.matched_terms}
    top = hits[0].record
    top_signatures = top.get("signatures") or ([top.get("signature", "")] if top.get("signature") else [])
    generic_surface = "<t>" in str(top.get("title", "")).casefold() or any(
        re.search(r"(?:<t>|\bT\b)", str(signature)) for signature in top_signatures
    )
    abstracted_arguments = [
        term for term in query_terms
        if generic_surface and term in GENERIC_ARGUMENT_TERMS and term not in top_matched
    ]
    collectively_unmatched = [
        term for term in query_terms
        if term not in collectively_matched and term not in abstracted_arguments
    ]
    top_unmatched = [
        term for term in query_terms
        if term not in top_matched and term not in abstracted_arguments
    ]
    if abstracted_arguments:
        print(
            "Note: concrete type argument(s) "
            f"{', '.join(abstracted_arguments)} are represented by generic T in the returned contract."
        )
    if collectively_unmatched:
        print(
            "Note: the returned results collectively did not match query term(s): "
            f"{', '.join(collectively_unmatched)}; verify the spelling or try a narrower query."
        )
    elif top_unmatched:
        print(
            "Note: this multi-topic result list is diversified across query terms; "
            "use --all-terms to require co-occurrence in one page, or repeat --query "
            "for independent lookups."
        )
    print()
    for index, hit in enumerate(hits, 1):
        record = hit.record
        record_id = str(record.get("id"))
        print(f"### {index}. {record.get('id')} [{record.get('kind')} L{record.get('level')}] score={hit.score}")
        if seen is not None and record_id in seen:
            print(f"- same document already shown for query: {seen[record_id]!r}\n")
            continue
        if seen is not None:
            seen[record_id] = query
        for signature in output_signatures(hit, limit=4):
            print(f"- `{str(signature).replace(chr(10), ' ')}`")
        if record.get("summary"):
            print(f"- {record['summary']}")
        for contract in focused_child_contracts(hit):
            print(
                f"- exact overload `{contract['signature']}` — {contract['summary']} "
                f"(id: `{contract['id']}`)"
            )
        for snippet in hit.matched_snippets:
            print(f"- match: {snippet}")
        if record.get("package"):
            print(f"- package: `{record['package']}`")
        if index == 1 and ordinary_use_ready(hit):
            print(
                "- decision: exact active signature and ordinary-call contract are already present; "
                "expand only for exceptions, limits, or a complete example."
            )
        print(f"- path: references/{record['path']}\n")

def output_signatures(hit: Hit, limit: int = 8) -> list[str]:
    """Return only signatures useful for this hit instead of dumping large package tables."""
    record = hit.record
    signatures = list(record.get("signatures") or ([record.get("signature")] if record.get("signature") else []))
    if len(signatures) <= limit:
        return [str(signature) for signature in signatures]
    ranked: list[tuple[int, int, str]] = []
    for ordinal, signature in enumerate(signatures):
        text = with_identifier_aliases(str(signature)).casefold()
        coverage = sum(
            1 for term in hit.matched_terms if folded_term_present(text, term)
        )
        ranked.append((coverage, ordinal, str(signature)))
    best_coverage = max((item[0] for item in ranked), default=0)
    # An overload group contains the receiver/member name in every row.  Keep
    # only the rows that also cover the requested parameter or constraint, so
    # `sort lessThan` does not spend the response budget on key/by/plain forms.
    matched = [
        signature for coverage, _, signature in ranked
        if coverage == best_coverage and coverage > 0
    ]
    return (matched or [str(signature) for signature in signatures])[:limit]

def focused_child_contracts(hit: Hit, limit: int = 4) -> list[dict]:
    """Expose exact overload leaves selected by a compact overload-index hit."""
    if hit.record.get("kind") != "api-member-index" or not hit.matched_terms:
        return []
    parent_id = str(hit.record.get("id", ""))
    candidates: list[tuple[int, int, str, dict]] = []
    for record in load_records():
        if record.get("parent") != parent_id or record.get("kind") != "api-member":
            continue
        signatures = record.get("signatures") or ([record.get("signature", "")] if record.get("signature") else [])
        text = with_identifier_aliases(
            " ".join((str(record.get("title", "")), " ".join(signatures)))
        ).casefold()
        coverage = sum(
            1 for term in hit.matched_terms if folded_term_present(text, term)
        )
        candidates.append((coverage, -int(record.get("level", 99)), str(record.get("path", "")), record))
    if not candidates:
        return []
    best_coverage = max(item[0] for item in candidates)
    # A subject-only match does not identify an overload.  Require at least one
    # additional matched term before attaching detail contracts.
    if best_coverage < 2:
        return []
    selected = sorted(
        (item for item in candidates if item[0] == best_coverage),
        key=lambda item: (-item[0], item[2]),
    )[:limit]
    contracts: list[dict] = []
    for _, _, _, record in selected:
        signatures = record.get("signatures") or ([record.get("signature", "")] if record.get("signature") else [])
        contracts.append({
            "id": record["id"],
            "signature": str(signatures[0]) if signatures else "",
            "summary": str(record.get("summary", "")),
            "path": str(record.get("path", "")),
        })
    return contracts

def ordinary_use_ready(hit: Hit) -> bool:
    """Whether compact output already carries a normal-call implementation contract."""
    if hit.record.get("kind") == "api-member":
        return bool(output_signatures(hit) and hit.record.get("summary"))
    return bool(focused_child_contracts(hit))

def hit_payload(hit: Hit) -> dict:
    # Ignore legacy provenance keys if a caller supplies an old in-memory
    # record; schema 2 does not store them, and they must never leak to output.
    omitted = {"source", "source_signature", "source_signatures", "signatures", "signature"}
    payload = {
        "score": hit.score,
        "matched_terms": list(hit.matched_terms),
        **{key: value for key, value in hit.record.items() if key not in omitted},
    }
    signatures = output_signatures(hit)
    if hit.record.get("signature") and len(signatures) == 1:
        payload["signature"] = signatures[0]
    elif signatures:
        payload["signatures"] = signatures
    total_signatures = len(hit.record.get("signatures") or [])
    if total_signatures > len(signatures):
        payload["signature_count"] = total_signatures
    if hit.matched_snippets:
        payload["matched_snippets"] = list(hit.matched_snippets)
    contracts = focused_child_contracts(hit)
    if contracts:
        payload["focused_contracts"] = contracts
    if ordinary_use_ready(hit):
        payload["ordinary_use_ready"] = True
    return payload

def batch_match_payload(groups: list[tuple[str, list[str], list[Hit]]]) -> list[dict]:
    """Keep query-to-hit mappings while emitting each document payload only once."""
    seen: dict[str, str] = {}
    result: list[dict] = []
    for query, _, hits in groups:
        rows: list[dict] = []
        for hit in hits:
            record_id = str(hit.record["id"])
            if record_id in seen:
                rows.append({
                    "id": record_id,
                    "score": hit.score,
                    "matched_terms": list(hit.matched_terms),
                    "reused_from_query": seen[record_id],
                })
            else:
                seen[record_id] = query
                rows.append(hit_payload(hit))
        result.append({"query": query, "results": rows})
    return result

def rendered(function, *args, **kwargs) -> str:
    buffer = io.StringIO()
    with contextlib.redirect_stdout(buffer):
        function(*args, **kwargs)
    return buffer.getvalue()

def append_trace(args: argparse.Namespace, event: dict, started: float) -> None:
    if args.trace_file is None:
        return
    path = args.trace_file.expanduser().resolve()
    path.parent.mkdir(parents=True, exist_ok=True)
    record = {
        "schema": 1,
        "timestamp": dt.datetime.now(dt.timezone.utc).isoformat(),
        "duration_ms": round((time.perf_counter() - started) * 1000, 3),
        "argv": sys.argv[1:],
        "domains": list(args.domain),
        "kinds": list(args.kind),
        **event,
    }
    with path.open("a", encoding="utf-8", newline="\n") as stream:
        stream.write(json.dumps(record, ensure_ascii=False, separators=(",", ":")) + "\n")

def print_expansion(payload: dict, estimate: bool) -> None:
    roots = ", ".join(str(item["id"]) for item in payload["roots"])
    stats = payload["stats"]
    print(
        f"Resolved {payload['view']} subtree for {roots}: "
        f"{stats['pages']} page(s), {stats['characters']} character(s)."
    )
    for warning in payload.get("warnings", []):
        print(f"Warning: {warning}")
    if estimate:
        for page in payload["pages"]:
            print(
                f"- {page['id']} [{page['kind']} distance={page['distance']}] "
                f"{page['characters']} chars — references/{page['path']}"
            )
        return
    for page in payload["pages"]:
        print(f"\n===== {page['id']} — references/{page['path']} =====")
        content = page["content"]
        print(content, end="" if content.endswith("\n") else "\n")
