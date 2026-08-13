"""Cangjie-to-stdx compatibility and official release-asset policy."""

from __future__ import annotations

import re

from .errors import SetupError
from .models import Release, Toolchain

REPOSITORY = "https://gitcode.com/Cangjie/cangjie_stdx"
ALL_PLATFORMS = frozenset(
    {
        "android-aarch64",
        "android-arm32",
        "ios-aarch64",
        "ios-simulator-aarch64",
        "ios-simulator-x64",
        "linux-aarch64",
        "linux-x64",
        "mac-aarch64",
        "mac-x64",
        "ohos-aarch64",
        "ohos-x64",
        "windows-x64",
    }
)
EARLY_PLATFORMS = frozenset({"linux-aarch64", "linux-x64", "mac-aarch64", "windows-x64"})
MODERN_PLATFORMS = frozenset(
    {
        "android-aarch64",
        "ios-aarch64",
        "ios-simulator-aarch64",
        "ios-simulator-x64",
        "linux-aarch64",
        "linux-x64",
        "mac-aarch64",
        "mac-x64",
        "ohos-aarch64",
        "ohos-x64",
        "windows-x64",
    }
)
RELEASES = {
    "1.0.4.1": Release("1.0.4.1", EARLY_PLATFORMS),
    "1.0.5.1": Release("1.0.5.1", EARLY_PLATFORMS),
    "1.1.3.1": Release("1.1.3.1", MODERN_PLATFORMS),
    "1.2.0-beta.02.1": Release("1.2.0-beta.02.1", MODERN_PLATFORMS | {"android-arm32"}),
}
TARGET_TO_PLATFORM = {
    "x86_64-w64-mingw32": "windows-x64",
    "x86_64-unknown-linux-gnu": "linux-x64",
    "aarch64-unknown-linux-gnu": "linux-aarch64",
    "x86_64-apple-darwin": "mac-x64",
    "aarch64-apple-darwin": "mac-aarch64",
    "x86_64-linux-ohos": "ohos-x64",
    "aarch64-linux-ohos": "ohos-aarch64",
}
SUPPORTED_PLATFORMS = frozenset(TARGET_TO_PLATFORM.values())
_CJC_OUTPUT = re.compile(
    r"^Cangjie Compiler:\s*([^\s]+).*?^Target:\s*([^\s]+)", re.MULTILINE | re.DOTALL
)
_VERSION = re.compile(r"^(\d+)\.(\d+)\.(\d+)([-+][0-9A-Za-z.-]+)?$")


def release_for_cjc(version: str) -> Release:
    """Select the supported stdx line and reject unspecified toolchain gaps."""
    match = _VERSION.fullmatch(version)
    if not match:
        raise SetupError(f"unsupported cjc version format: {version!r}")
    core = tuple(int(match.group(index)) for index in range(1, 4))
    suffix = match.group(4) or ""
    if core < (1, 0, 5) or (core == (1, 0, 5) and suffix.startswith("-")):
        return RELEASES["1.0.4.1"]
    if core == (1, 0, 5) and not suffix.startswith("-"):
        return RELEASES["1.0.5.1"]
    if core[:2] == (1, 1):
        return RELEASES["1.1.3.1"]
    if core[:2] == (1, 2):
        return RELEASES["1.2.0-beta.02.1"]
    raise SetupError(
        f"no stdx compatibility policy for cjc {version}; supported ranges are "
        "<1.0.5, 1.0.5, 1.1.x, and 1.2.x"
    )


def platform_for_target(target: str) -> str:
    try:
        return TARGET_TO_PLATFORM[target]
    except KeyError as exc:
        supported = ", ".join(sorted(TARGET_TO_PLATFORM))
        raise SetupError(f"unsupported cjc target {target!r}; supported targets: {supported}") from exc


def parse_cjc_output(output: str) -> Toolchain:
    match = _CJC_OUTPUT.search(output)
    if not match:
        raise SetupError("cannot parse compiler version/target from `cjc -v`")
    version, target = match.groups()
    return Toolchain(version, target, platform_for_target(target), release_for_cjc(version))


def ensure_platform(release: Release, platform: str) -> None:
    if platform not in release.platforms:
        available = ", ".join(sorted(release.platforms))
        raise SetupError(
            f"stdx {release.version} has no official {platform} ZIP; available platforms: {available}"
        )


def asset_name(release: Release, platform: str) -> str:
    ensure_platform(release, platform)
    return f"cangjie-stdx-{platform}-{release.version}.zip"


def release_page(release: Release) -> str:
    return f"{REPOSITORY}/releases/v{release.version}"


def asset_url(release: Release, platform: str) -> str:
    return f"{REPOSITORY}/releases/download/v{release.version}/{asset_name(release, platform)}"
