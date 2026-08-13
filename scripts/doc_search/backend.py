"""Storage-neutral access used by the shared query engine."""

from __future__ import annotations

from pathlib import Path
from typing import Protocol

from .models import Page


class Backend(Protocol):
    skill_root: Path

    def load_records(self) -> list[dict]: ...

    def load_search_content_index(self) -> dict[str, str]: ...

    def load_page_content(self, relative_path: str) -> str: ...

    def load_pages(
        self, selected: list[tuple[dict, int]], include_content: bool = True
    ) -> list[Page]: ...

_backend: Backend | None = None


def configure_backend(backend: Backend) -> None:
    global _backend
    _backend = backend


def current_backend() -> Backend:
    if _backend is None:
        raise RuntimeError("document-search backend was not configured")
    return _backend


def skill_root() -> Path:
    return current_backend().skill_root


def load_records() -> list[dict]:
    return current_backend().load_records()


def load_search_content_index() -> dict[str, str]:
    return current_backend().load_search_content_index()


def load_page_content(relative_path: str) -> str:
    return current_backend().load_page_content(relative_path)


def load_pages(
    selected: list[tuple[dict, int]], include_content: bool = True
) -> list[Page]:
    return current_backend().load_pages(selected, include_content)

