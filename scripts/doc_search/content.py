from __future__ import annotations

import re
from functools import lru_cache

from .backend import load_page_content, load_search_content_index
from .query import folded_term_present, with_identifier_aliases


def prepare_search_content(content: str) -> str:
    """Strip generated routing-only text and bound the page body indexed for search."""
    content = re.sub(r"^<!--\s*cj-doc\b[^\n]*-->\s*", "", content, count=1)
    # Generated breadcrumb/back links describe the parent category, not this page.
    # Indexing them makes every sibling appear to contain the category keywords.
    content = re.sub(r"(?m)^\s*\[←[^\]]*\]\([^\n]*\)\s*$", "", content)
    return content[:16000]

@lru_cache(maxsize=None)
def searchable_page_content(relative_path: str) -> str:
    indexed = load_search_content_index().get(relative_path)
    if indexed is not None:
        return indexed
    return prepare_search_content(load_page_content(relative_path))

@lru_cache(maxsize=None)
def normalized_search_fields(
    record_id: str, title: str, summary: str, path: str, signatures: str
) -> dict[str, str]:
    fields = {
        "id": record_id,
        "title": title,
        "summary": summary,
        "path": path,
        "signature": signatures,
    }
    content = searchable_page_content(path)
    if content:
        fields["content"] = content
    identifier_fields = {"id", "title", "path", "signature"}
    return {
        key: (with_identifier_aliases(value) if key in identifier_fields else value).casefold()
        for key, value in fields.items()
    }

@lru_cache(maxsize=None)
def normalized_search_record(
    record_id: str, title: str, summary: str, path: str, signatures: str
) -> tuple[dict[str, str], str]:
    """Cache both weighted fields and their search blob for a batched process."""
    fields = normalized_search_fields(record_id, title, summary, path, signatures)
    return fields, " ".join(fields.values())

def matching_snippets(record: dict, terms: list[str], limit: int = 4) -> tuple[str, ...]:
    """Return only the table/signature lines that supplied missing metadata terms."""
    if not terms:
        return ()
    signatures = record.get("signatures") or ([record.get("signature", "")] if record.get("signature") else [])
    metadata = " ".join(
        str(value)
        for value in (
            record.get("id", ""), record.get("title", ""), record.get("summary", ""),
            record.get("path", ""), " ".join(signatures),
        )
    ).casefold()
    wanted = [term for term in terms if not folded_term_present(metadata, term)]
    if not wanted:
        return ()
    content = searchable_page_content(str(record.get("path", "")))
    ranked: list[tuple[int, int, str]] = []
    seen: set[str] = set()
    for position, raw in enumerate(content.splitlines()):
        line = raw.strip()
        if (
            not line
            or line.startswith(("<!--", "[←", "```"))
            or len(line) > 500
        ):
            continue
        normalized = with_identifier_aliases(line).casefold()
        covered = [term for term in wanted if folded_term_present(normalized, term)]
        if not covered:
            continue
        cleaned = re.sub(r"\s+", " ", line)
        if cleaned in seen:
            continue
        seen.add(cleaned)
        shape_bonus = 25 if cleaned.startswith("|") else 15 if "`" in cleaned else 0
        ranked.append((100 * len(covered) + shape_bonus, position, cleaned))
    ranked.sort(key=lambda item: (-item[0], item[1]))
    return tuple(item[2] for item in ranked[:limit])
