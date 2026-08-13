from __future__ import annotations

import argparse
from collections import deque

from .catalog import record_sort_key
from .constants import DEFAULT_MAX_API_LEAVES, DEFAULT_MAX_TOPIC_LEAVES
from .models import Catalog, Page


def subtree_distances(roots: list[dict], catalog: Catalog, depth: int | None) -> dict[str, int]:
    distances: dict[str, int] = {}
    queue: deque[tuple[str, int]] = deque((str(record["id"]), 0) for record in roots)
    while queue:
        record_id, distance = queue.popleft()
        previous = distances.get(record_id)
        if previous is not None and previous <= distance:
            continue
        distances[record_id] = distance
        if depth is not None and distance >= depth:
            continue
        for child in catalog.children.get(record_id, []):
            queue.append((str(child["id"]), distance + 1))
    return distances

def expand_records(roots: list[dict], catalog: Catalog, view: str, depth: int | None = None) -> list[tuple[dict, int]]:
    distances = subtree_distances(roots, catalog, depth)
    want_leaf = view == "leaves"
    selected = [
        (catalog.by_id[record_id], distance)
        for record_id, distance in distances.items()
        if (not catalog.children.get(record_id)) == want_leaf
    ]
    selected.sort(key=lambda item: (item[1], *record_sort_key(item[0])))
    return selected

def expansion_payload(
    view: str, roots: list[dict], pages: list[Page], estimate: bool,
    warnings: list[str] | None = None,
) -> dict:
    total_chars = sum(page.characters for page in pages)
    payload = {
        "view": view,
        "roots": [
            {"id": root["id"], "kind": root.get("kind"), "path": root.get("path"), "title": root.get("title")}
            for root in roots
        ],
        "stats": {"pages": len(pages), "characters": total_chars},
        "pages": [],
    }
    if warnings:
        payload["warnings"] = warnings
    for page in pages:
        item = {
            "id": page.record["id"],
            "kind": page.record.get("kind"),
            "level": page.record.get("level"),
            "distance": page.distance,
            "path": page.record.get("path"),
            "title": page.record.get("title"),
            "characters": page.characters,
        }
        if not estimate:
            if page.content is None:
                raise ValueError(f"page body was not loaded for {page.record['id']}")
            item["content"] = page.content
        payload["pages"].append(item)
    return payload

def enforce_expansion_limits(pages: list[Page], args: argparse.Namespace) -> None:
    if args.force or args.estimate:
        return
    total_chars = sum(page.characters for page in pages)
    exceeded: list[str] = []
    if len(pages) > args.max_pages:
        exceeded.append(f"{len(pages)} pages > --max-pages {args.max_pages}")
    if total_chars > args.max_chars:
        exceeded.append(f"{total_chars} characters > --max-chars {args.max_chars}")
    if exceeded:
        raise ValueError(
            "subtree expansion refused: " + "; ".join(exceeded)
            + ". Narrow --node/--depth, inspect with --estimate, or explicitly use --force."
        )

def enforce_api_leaf_policy(
    roots: list[dict], catalog: Catalog, args: argparse.Namespace
) -> None:
    """Prevent accidental dumps of every contract below a large API index."""
    if args.view != "leaves" or args.force or args.estimate:
        return
    offenders: list[tuple[str, int]] = []
    for root in roots:
        path = str(root.get("path", ""))
        kind = str(root.get("kind", ""))
        is_api_index = path.startswith("api/") and (
            kind in {"index", "api-package", "api-type", "api-extension", "api-member-index"}
            or bool(catalog.children.get(str(root["id"])))
        )
        if not is_api_index:
            continue
        count = len(expand_records([root], catalog, "leaves", args.depth))
        if count > DEFAULT_MAX_API_LEAVES:
            offenders.append((str(root["id"]), count))
    if offenders:
        details = ", ".join(f"{record_id} ({count} leaves)" for record_id, count in offenders)
        raise ValueError(
            "wide API leaf expansion refused: " + details + ". "
            "The API index already lists every active member signature and summary. "
            "Use --view indexes, search '<Type> <member-or-intent>', then expand the exact member ID; "
            "use --estimate to inspect size or --force only when every member contract is required."
        )

    topic_offenders: list[tuple[str, int]] = []
    for root in roots:
        record_id = str(root["id"])
        is_broad_topic = (
            root.get("kind") == "guide-topic"
            or record_id in {"references", "language", "tools", "examples"}
        )
        if not is_broad_topic:
            continue
        count = len(expand_records([root], catalog, "leaves", args.depth))
        if count > DEFAULT_MAX_TOPIC_LEAVES:
            topic_offenders.append((record_id, count))
    if topic_offenders:
        details = ", ".join(
            f"{record_id} ({count} leaves)" for record_id, count in topic_offenders
        )
        raise ValueError(
            "wide topic leaf expansion refused: " + details + ". "
            "Use --view indexes to read the topic map, run compact --query lookups for the "
            "needed concepts, then combine their exact leaf IDs in one --view leaves call; "
            "use --estimate to inspect size or --force only when the entire topic is required."
        )

def keep_bounded_roots(
    roots: list[dict], catalog: Catalog, args: argparse.Namespace
) -> tuple[list[dict], list[str]]:
    """Skip only offending roots in a multi-root batch; keep single-root refusal."""
    if len(roots) <= 1:
        enforce_api_leaf_policy(roots, catalog, args)
        return roots, []
    accepted: list[dict] = []
    warnings: list[str] = []
    for root in roots:
        try:
            enforce_api_leaf_policy([root], catalog, args)
        except ValueError as exc:
            warnings.append(str(exc))
        else:
            accepted.append(root)
    if not accepted:
        raise ValueError("; ".join(warnings))
    return accepted, warnings
