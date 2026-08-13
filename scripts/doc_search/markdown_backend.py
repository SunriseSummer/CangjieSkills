"""Development backend that queries the authored Markdown knowledge tree."""

from __future__ import annotations

import gzip
import json
from functools import lru_cache
from pathlib import Path

from .models import Page


class MarkdownBackend:
    def __init__(self, skill_root: Path):
        self.skill_root = skill_root.resolve()
        self.references = self.skill_root / "references"

    @lru_cache(maxsize=1)
    def load_records(self) -> list[dict]:
        api_path = self.references / "api" / "manifest.json"
        guide_path = self.references / "guide-manifest.json"
        if not api_path.is_file() or not guide_path.is_file():
            raise ValueError(
                "Markdown backend requires references/api/manifest.json "
                "and references/guide-manifest.json"
            )
        api_records = json.loads(api_path.read_text(encoding="utf-8"))
        package_ids = sorted(
            (item["id"] for item in api_records if item.get("kind") == "api-package"),
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
        records = api_records + json.loads(guide_path.read_text(encoding="utf-8"))
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

    @lru_cache(maxsize=1)
    def load_search_content_index(self) -> dict[str, str]:
        path = self.references / "search-content.json.gz"
        try:
            payload = json.loads(gzip.decompress(path.read_bytes()).decode("utf-8"))
        except (OSError, UnicodeDecodeError, json.JSONDecodeError) as exc:
            raise ValueError(f"invalid Markdown routing index {path}: {exc}") from exc
        pages = payload.get("pages") if payload.get("format") == 1 else None
        if not isinstance(pages, dict) or not all(
            isinstance(key, str) and isinstance(value, str) for key, value in pages.items()
        ):
            raise ValueError(f"invalid Markdown routing index schema: {path}")
        return pages

    @lru_cache(maxsize=None)
    def load_page_content(self, relative_path: str) -> str:
        path = self.references / relative_path
        if not path.is_file():
            return ""
        return path.read_text(encoding="utf-8")

    def load_pages(
        self, selected: list[tuple[dict, int]], include_content: bool = True
    ) -> list[Page]:
        pages: list[Page] = []
        for record, distance in selected:
            relative = str(record.get("path", ""))
            path = self.references / relative
            if not path.is_file():
                raise ValueError(f"missing page for {record['id']}: references/{relative}")
            content = path.read_text(encoding="utf-8")
            pages.append(
                Page(record, content if include_content else None, distance, len(content))
            )
        return pages
