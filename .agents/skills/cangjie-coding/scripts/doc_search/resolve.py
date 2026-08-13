from __future__ import annotations

import argparse

from .catalog import choose_shallowest_exact, filtered_records, normalized_selector, normalized_title, path_aliases, record_sort_key, resolve_exact_selector
from .constants import NON_ACTION_QUERY_TERMS
from .content import normalized_search_record
from .models import Catalog
from .query import folded_term_present, routing_terms_for
from .ranking import manifest_hits


def resolve_query_node(query: str, terms: list[str], catalog: Catalog, args: argparse.Namespace) -> dict:
    normalized = normalized_selector(query)
    records = filtered_records(catalog, args)
    exact = [
        record for record in records
        if str(record["id"]).casefold() == normalized
        or normalized in path_aliases(record)
        or str(record.get("title", "")).strip().casefold() == normalized
        or normalized_title(record) == normalized
    ]
    if exact:
        return choose_shallowest_exact(exact, query)
    hits = manifest_hits(query, terms, args, limit=None, records=records)
    if not hits:
        raise ValueError(f"no layered-document node matches {query!r}")
    # Expand from the closest overview of the best semantic hit.  Re-scoring
    # only non-leaves can otherwise promote a broad root whose index happens
    # to mention unrelated query terms distributed across several rows.
    best = hits[0].record
    if args.view == "leaves" and best.get("kind") == "api-member" and len(terms) > 1:
        normalized, _ = normalized_search_record(
            str(best.get("id", "")), str(best.get("title", "")),
            str(best.get("summary", "")), str(best.get("path", "")),
            " ".join(best.get("signatures") or ([best.get("signature", "")] if best.get("signature") else [])),
        )
        receiver = folded_term_present(
            " ".join((normalized["id"], normalized["title"], normalized["summary"])),
            terms[0],
        )
        action = any(
            folded_term_present(" ".join((normalized["id"], normalized["title"])), term)
            for term in terms[1:] if term not in NON_ACTION_QUERY_TERMS
        )
        if receiver and action:
            # A receiver/member query already identifies the final contract;
            # promoting it back to the type index defeats narrow leaf lookup
            # and can trigger the broad-API guard.
            return best
    cursor = best
    while cursor and not catalog.children.get(str(cursor["id"])):
        cursor = catalog.by_id.get(str(cursor.get("parent", "")))
    if cursor:
        return cursor

    nonleaf_hits = [hit for hit in hits if catalog.children.get(str(hit.record["id"]))]
    if nonleaf_hits:
        hits = nonleaf_hits
    top_score = hits[0].score
    tied = [hit.record for hit in hits if hit.score == top_score]
    if len(tied) > 1:
        shortest_length = min(len(str(item["id"])) for item in tied)
        shortest = [item for item in tied if len(str(item["id"])) == shortest_length]
        if len(shortest) == 1:
            return shortest[0]
        ids = ", ".join(str(item["id"]) for item in tied[:8])
        raise ValueError(f"ambiguous node query {query!r}; use --node with one of: {ids}")
    return hits[0].record

def resolve_roots(query: str, terms: list[str], catalog: Catalog, args: argparse.Namespace) -> list[dict]:
    roots: list[dict] = []
    if query:
        roots.append(resolve_query_node(query, terms, catalog, args))
    roots.extend(resolve_exact_selector(selector, catalog, args) for selector in args.node)
    if not roots:
        raise ValueError("subtree expansion requires a query or at least one --node")
    unique: dict[str, dict] = {}
    for record in roots:
        unique[str(record["id"])] = record
    return sorted(unique.values(), key=record_sort_key)

def resolve_roots_tolerant(
    query: str, terms: list[str], catalog: Catalog, args: argparse.Namespace
) -> tuple[list[dict], list[str]]:
    """Resolve a batch without discarding valid nodes because one selector is bad."""
    roots: list[dict] = []
    warnings: list[str] = []
    if query:
        try:
            roots.append(resolve_query_node(query, terms, catalog, args))
        except ValueError as exc:
            warnings.append(str(exc))
    for selector in args.node:
        try:
            roots.append(resolve_exact_selector(selector, catalog, args))
        except ValueError as exc:
            warnings.append(str(exc))
    if not roots:
        if warnings:
            raise ValueError("; ".join(warnings))
        raise ValueError("subtree expansion requires a query or at least one --node")
    unique = {str(record["id"]): record for record in roots}
    return sorted(unique.values(), key=record_sort_key), warnings

def resolve_query_batch_tolerant(
    queries: list[str], catalog: Catalog, args: argparse.Namespace
) -> tuple[list[dict], list[str]]:
    """Resolve independent semantic queries and exact nodes into one expansion."""
    roots: list[dict] = []
    warnings: list[str] = []
    for query in queries:
        terms = routing_terms_for(query)
        if not terms:
            warnings.append(f"query must contain at least one word: {query!r}")
            continue
        try:
            roots.append(resolve_query_node(query, terms, catalog, args))
        except ValueError as exc:
            warnings.append(str(exc))
    for selector in args.node:
        try:
            roots.append(resolve_exact_selector(selector, catalog, args))
        except ValueError as exc:
            warnings.append(str(exc))
    if not roots:
        if warnings:
            raise ValueError("; ".join(warnings))
        raise ValueError("subtree expansion requires a query or at least one --node")
    unique = {str(record["id"]): record for record in roots}
    return sorted(unique.values(), key=record_sort_key), warnings
