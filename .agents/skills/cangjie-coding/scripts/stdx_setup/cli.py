"""Command-line orchestration for global stdx installation."""

from __future__ import annotations

import argparse
import json
import os
import sys
import tempfile
from pathlib import Path
from typing import Any

from .archive import download, extract_archive, installation_complete, locate_binary_root, validate_zip
from .errors import SetupError
from .manifest import configure_manifest, resolve_project
from .models import SetupPlan, Toolchain
from .policy import SUPPORTED_PLATFORMS, asset_name, asset_url, ensure_platform, release_page
from .system import FileLock, default_install_root, inspect_toolchain, lock_name, sha256_file


def _configure_streams() -> None:
    for stream in (sys.stdout, sys.stderr):
        if hasattr(stream, "reconfigure"):
            stream.reconfigure(encoding="utf-8", errors="replace")


def parse_args(argv: list[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Install the stdx release matching cjc and configure a cjpm project."
    )
    parser.add_argument("--project", type=Path, default=Path.cwd(), help="cjpm project directory or cjpm.toml")
    parser.add_argument("--destination", type=Path, help="global installation root (default: ~/.cangjie/stdx)")
    parser.add_argument("--platform", choices=sorted(SUPPORTED_PLATFORMS), help="confirm the release platform derived from cjc -v")
    parser.add_argument("--linkage", choices=("dynamic", "static"), default="dynamic", help="binary family to configure")
    parser.add_argument("--archive", type=Path, help="use a local official release ZIP")
    parser.add_argument("--cache-dir", type=Path, help="release archive cache (default: <destination>/.cache)")
    parser.add_argument("--offline", action="store_true", help="forbid network access; require --archive or cached ZIP")
    parser.add_argument("--no-configure", action="store_true", help="install only; do not edit cjpm.toml")
    parser.add_argument("--force", action="store_true", help="redownload and re-extract the selected release")
    parser.add_argument("--dry-run", action="store_true", help="show the resolved plan without downloading or writing")
    parser.add_argument("--json", action="store_true", help="emit the final result as JSON")
    return parser.parse_args(argv)


def _resolve_plan(args: argparse.Namespace, toolchain: Toolchain) -> tuple[SetupPlan, str]:
    _project_root, manifest = resolve_project(args.project, args.no_configure)
    platform = args.platform or toolchain.platform
    if platform != toolchain.platform:
        raise SetupError(
            f"--platform {platform} does not match cjc target {toolchain.target} ({toolchain.platform})"
        )
    ensure_platform(toolchain.release, platform)
    destination = (args.destination or default_install_root()).expanduser().resolve()
    cache_dir = (args.cache_dir or destination / ".cache").expanduser().resolve()
    filename = asset_name(toolchain.release, platform)
    return SetupPlan(
        toolchain=toolchain,
        linkage=args.linkage,
        release_page=release_page(toolchain.release),
        asset_url=asset_url(toolchain.release, platform),
        destination=destination,
        cache_dir=cache_dir,
        installation=destination / filename.removesuffix(".zip"),
        manifest=manifest,
        dry_run=args.dry_run,
    ), filename


def _write_json_atomic(path: Path, value: dict[str, Any]) -> None:
    encoded = (json.dumps(value, ensure_ascii=False, indent=2) + "\n").encode("utf-8")
    if path.is_file() and path.read_bytes() == encoded:
        return
    path.parent.mkdir(parents=True, exist_ok=True)
    descriptor, temporary_name = tempfile.mkstemp(prefix=path.name + ".", suffix=".tmp", dir=path.parent)
    temporary = Path(temporary_name)
    try:
        with os.fdopen(descriptor, "wb") as stream:
            stream.write(encoded)
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(temporary, path)
    finally:
        temporary.unlink(missing_ok=True)


def _emit(value: dict[str, Any], as_json: bool) -> None:
    if as_json:
        print(json.dumps(value, ensure_ascii=False, indent=2))
        return
    if value.get("dry_run"):
        for key, item in value.items():
            print(f"{key}: {item}")
        return
    print(f"stdx {value['stdx_version']}: {value['binary_root']}")
    if value.get("manifest"):
        state = "updated" if value.get("configured") else "already configured"
        print(f"cjpm.toml: {state} ({value['manifest']})")


def run(args: argparse.Namespace, toolchain: Toolchain | None = None) -> dict[str, Any]:
    active = toolchain or inspect_toolchain()
    plan, filename = _resolve_plan(args, active)
    result = plan.as_dict()
    if args.dry_run:
        return result

    plan.destination.mkdir(parents=True, exist_ok=True)
    lock_path = plan.destination / ".locks" / lock_name(str(plan.installation))
    with FileLock(lock_path):
        if args.archive:
            archive = args.archive.expanduser().resolve()
            validate_zip(archive)
        else:
            archive = plan.cache_dir / filename
            cache_lock = plan.cache_dir / ".locks" / lock_name(str(archive.resolve()))
            with FileLock(cache_lock):
                archive = download(plan.asset_url, archive, args.force, args.offline)
        reused = plan.installation.is_dir() and installation_complete(plan.installation) and not args.force
        installation = extract_archive(archive, plan.destination, plan.installation, args.force)
        binary_root = locate_binary_root(installation, plan.linkage)
        archive_sha256 = sha256_file(archive)
        record = plan.installation / "install.json"
        if not reused or not record.is_file():
            installed_archive_sha256 = archive_sha256
            _write_json_atomic(record, {
                "schema": 2,
                "stdx_version": active.release.version,
                "platform": active.platform,
                "release_page": plan.release_page,
                "asset_url": plan.asset_url,
                "installation": str(plan.installation),
                "archive_sha256": installed_archive_sha256,
            })
        else:
            try:
                installed_archive_sha256 = json.loads(record.read_text(encoding="utf-8"))["archive_sha256"]
            except (OSError, UnicodeError, json.JSONDecodeError, KeyError, TypeError) as exc:
                raise SetupError(f"invalid installation record; rerun with --force: {record}: {exc}") from exc

    configured = False
    if not args.no_configure:
        assert plan.manifest is not None
        manifest_lock = plan.destination / ".locks" / lock_name(str(plan.manifest.resolve()))
        with FileLock(manifest_lock):
            configured = configure_manifest(plan.manifest, active.target, binary_root)
    result.update(
        archive=str(archive),
        archive_sha256=archive_sha256,
        installed_archive_sha256=installed_archive_sha256,
        installation_reused=reused,
        binary_root=str(binary_root),
        configured=configured,
    )
    result["install_record"] = str(record)
    return result


def main(argv: list[str] | None = None) -> int:
    _configure_streams()
    args = parse_args(argv)
    try:
        result = run(args)
        _emit(result, args.json)
        if args.linkage == "static" and not args.dry_run:
            print("warning: crypto/net static linkage may require platform OpenSSL/system link options", file=sys.stderr)
        return 0
    except SetupError as exc:
        print(f"setup_stdx: {exc}", file=sys.stderr)
        return 1
