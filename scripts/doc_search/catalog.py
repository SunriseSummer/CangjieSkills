from __future__ import annotations

import argparse
import re
from collections import defaultdict

from .constants import VALID_DOMAINS
from .models import Catalog
from .query import domain_match


def selected_domains(args: argparse.Namespace) -> set[str]:
    domains = {item.strip().casefold() for value in args.domain for item in value.split(",") if item.strip()}
    unknown = domains - VALID_DOMAINS
    if unknown:
        raise ValueError(f"unknown domain(s): {', '.join(sorted(unknown))}")
    return domains

def selected_kinds(args: argparse.Namespace) -> set[str]:
    return {item.strip() for value in args.kind for item in value.split(",") if item.strip()}

def build_catalog(records: list[dict]) -> Catalog:
    by_id: dict[str, dict] = {}
    children: dict[str, list[dict]] = defaultdict(list)
    for record in records:
        record_id = str(record.get("id", ""))
        if not record_id:
            raise ValueError("manifest record has no id")
        if record_id in by_id:
            raise ValueError(f"duplicate manifest id: {record_id}")
        by_id[record_id] = record
    for record in records:
        parent = str(record.get("parent", ""))
        if parent:
            children[parent].append(record)
    for values in children.values():
        values.sort(key=record_sort_key)
    return Catalog(records, by_id, dict(children))

def record_sort_key(record: dict) -> tuple[int, str, str]:
    return (int(record.get("level", 99)), str(record.get("path", "")), str(record.get("id", "")))

def normalized_title(record: dict) -> str:
    return re.sub(r"^\d+(?:\.\d+)*[.、]?\s*", "", str(record.get("title", ""))).strip().casefold()

def normalized_selector(value: str) -> str:
    normalized = value.strip().replace("\\", "/")
    if normalized.casefold().startswith("references/"):
        normalized = normalized[len("references/"):]
    return normalized.rstrip("/").casefold()

def path_aliases(record: dict) -> set[str]:
    path = str(record.get("path", "")).replace("\\", "/").strip("/").casefold()
    aliases = {path}
    if path.endswith("/index.md"):
        aliases.add(path[:-len("/index.md")])
    elif path == "index.md":
        aliases.add("")
    if path.endswith(".md"):
        aliases.add(path[:-3])
    return aliases

def filtered_records(catalog: Catalog, args: argparse.Namespace) -> list[dict]:
    domains = selected_domains(args)
    kinds = selected_kinds(args)
    return [
        record
        for record in catalog.records
        if domain_match(record, domains) and (not kinds or record.get("kind") in kinds)
    ]

def choose_shallowest_exact(candidates: list[dict], selector: str) -> dict:
    minimum_level = min(int(item.get("level", 99)) for item in candidates)
    shallowest = sorted(
        (item for item in candidates if int(item.get("level", 99)) == minimum_level),
        key=record_sort_key,
    )
    if len(shallowest) == 1:
        return shallowest[0]
    ids = ", ".join(str(item["id"]) for item in shallowest[:8])
    raise ValueError(f"ambiguous node {selector!r}; use --node with one of: {ids}")

def resolve_exact_selector(selector: str, catalog: Catalog, args: argparse.Namespace) -> dict:
    normalized = normalized_selector(selector)
    records = filtered_records(catalog, args)
    id_matches = [record for record in records if str(record["id"]).casefold() == normalized]
    if id_matches:
        return id_matches[0]
    path_matches = [record for record in records if normalized in path_aliases(record)]
    if path_matches:
        return choose_shallowest_exact(path_matches, selector)
    title_matches = [
        record for record in records
        if str(record.get("title", "")).strip().casefold() == normalized or normalized_title(record) == normalized
    ]
    if title_matches:
        return choose_shallowest_exact(title_matches, selector)
    raise ValueError(f"unknown node {selector!r}; run a normal search first or use an exact manifest id/path")
