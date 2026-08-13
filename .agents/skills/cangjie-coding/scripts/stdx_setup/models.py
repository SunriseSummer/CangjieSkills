"""Immutable data exchanged between setup stages."""

from __future__ import annotations

from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Any


@dataclass(frozen=True)
class Release:
    version: str
    platforms: frozenset[str]


@dataclass(frozen=True)
class Toolchain:
    version: str
    target: str
    platform: str
    release: Release


@dataclass(frozen=True)
class SetupPlan:
    toolchain: Toolchain
    linkage: str
    release_page: str
    asset_url: str
    destination: Path
    cache_dir: Path
    installation: Path
    manifest: Path | None
    dry_run: bool

    def as_dict(self) -> dict[str, Any]:
        value = asdict(self)
        value["cjc_version"] = self.toolchain.version
        value["target"] = self.toolchain.target
        value["platform"] = self.toolchain.platform
        value["stdx_version"] = self.toolchain.release.version
        del value["toolchain"]
        for key in ("destination", "cache_dir", "installation", "manifest"):
            value[key] = str(value[key]) if value[key] is not None else None
        value["schema"] = 2
        return value
