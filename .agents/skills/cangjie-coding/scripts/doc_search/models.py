from dataclasses import dataclass


@dataclass
class Hit:
    score: int
    record: dict
    matched_terms: tuple[str, ...]
    matched_snippets: tuple[str, ...] = ()

@dataclass
class Catalog:
    records: list[dict]
    by_id: dict[str, dict]
    children: dict[str, list[dict]]

@dataclass
class Page:
    record: dict
    content: str | None
    distance: int
    characters: int
