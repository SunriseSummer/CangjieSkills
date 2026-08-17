#!/usr/bin/env python3
"""Offline unit and integration tests for the multi-version stdx installer."""

from __future__ import annotations

import argparse
import json
import os
import sys
import tempfile
import tomllib
import unittest
import urllib.request
import zipfile
from io import BytesIO
from pathlib import Path
from unittest.mock import patch

SCRIPT_DIR = Path(__file__).resolve().parent
DEV_ROOT = SCRIPT_DIR.parents[1]
sys.dont_write_bytecode = True
sys.path.insert(0, str(DEV_ROOT / "scripts"))

import setup_stdx
from stdx_setup.cli import run
from stdx_setup.models import Toolchain
from stdx_setup.policy import RELEASES, asset_name, asset_url, parse_cjc_output
from stdx_setup.system import FileLock, default_install_root


def fake_release(path: Path, platform: str, dual_backend: bool = False) -> None:
    prefix = f"{platform.replace('-', '_')}_cjnative/" if dual_backend else "payload/"
    with zipfile.ZipFile(path, "w") as bundle:
        bundle.writestr(prefix + "dynamic/stdx/libstdx.demo.dll", b"dynamic")
        bundle.writestr(prefix + "dynamic/stdx/stdx.demo.cjo", b"metadata")
        bundle.writestr(prefix + "static/stdx/libstdx.demo.a", b"static")
        bundle.writestr(prefix + "static/stdx/stdx.demo.cjo", b"metadata")
        if dual_backend:
            bundle.writestr(f"{platform.replace('-', '_')}_llvm/dynamic/stdx/libstdx.demo.dll", b"llvm")


def arguments(project: Path, destination: Path, archive: Path, **overrides: object) -> argparse.Namespace:
    values = {
        "project": project,
        "destination": destination,
        "platform": None,
        "linkage": "dynamic",
        "archive": archive,
        "cache_dir": None,
        "offline": True,
        "no_configure": False,
        "force": False,
        "dry_run": False,
        "json": False,
    }
    values.update(overrides)
    return argparse.Namespace(**values)


class EntrypointTests(unittest.TestCase):
    def test_bytecode_guard_precedes_package_imports(self) -> None:
        source = (DEV_ROOT / "scripts" / "setup_stdx.py").read_text(encoding="utf-8")
        self.assertLess(
            source.index("sys.dont_write_bytecode = True"),
            source.index("from stdx_setup.archive import"),
        )


class VersionPolicyTests(unittest.TestCase):
    def test_cjc_ranges_select_requested_stdx_releases(self) -> None:
        cases = {
            "0.53.18": "1.0.4.1",
            "1.0.0": "1.0.4.1",
            "1.0.4": "1.0.4.1",
            "1.0.5-beta.1": "1.0.4.1",
            "1.0.5": "1.0.5.1",
            "1.1.0": "1.1.3.1",
            "1.1.99": "1.1.3.1",
            "1.2.0-beta.02": "1.2.0-beta.02.1",
            "1.2.8": "1.2.0-beta.02.1",
        }
        for cjc, stdx in cases.items():
            with self.subTest(cjc=cjc):
                self.assertEqual(setup_stdx.release_for_cjc(cjc).version, stdx)

    def test_unspecified_future_versions_fail_closed(self) -> None:
        for version in ("1.0.6", "1.3.0", "2.0.0", "dev", "1.0.5garbage", "1.0"):
            with self.subTest(version=version), self.assertRaises(setup_stdx.SetupError):
                setup_stdx.release_for_cjc(version)

    def test_official_asset_contract_and_version_platform_matrix(self) -> None:
        release = RELEASES["1.2.0-beta.02.1"]
        self.assertEqual(
            asset_url(release, "windows-x64"),
            "https://gitcode.com/Cangjie/cangjie_stdx/releases/download/v1.2.0-beta.02.1/"
            "cangjie-stdx-windows-x64-1.2.0-beta.02.1.zip",
        )
        self.assertEqual(asset_name(RELEASES["1.0.4.1"], "mac-aarch64"), "cangjie-stdx-mac-aarch64-1.0.4.1.zip")
        with self.assertRaisesRegex(setup_stdx.SetupError, "no official mac-x64 ZIP"):
            asset_name(RELEASES["1.0.5.1"], "mac-x64")

    def test_toolchain_output_drives_version_and_platform(self) -> None:
        value = parse_cjc_output("Cangjie Compiler: 1.1.7 (cjnative)\nTarget: aarch64-apple-darwin\n")
        self.assertEqual((value.release.version, value.platform), ("1.1.3.1", "mac-aarch64"))


class ManifestTests(unittest.TestCase):
    def test_merge_is_idempotent_preserves_other_paths_and_replaces_old_stdx(self) -> None:
        original = """[package]
cjc-version = "1.0.5"
name = "demo"
version = "0.1.0"
output-type = "executable"

[target.x86_64-w64-mingw32.bin-dependencies]
path-option = ["C:/vendor", "C:/project/.cangjie/stdx/cangjie-stdx-windows-x64-1.0.4.1/dynamic/stdx"]
"""
        desired = Path("C:/Users/test/.cangjie/stdx/cangjie-stdx-windows-x64-1.0.5.1/dynamic/stdx")
        updated, changed = setup_stdx.merge_manifest_text(original, "x86_64-w64-mingw32", desired)
        self.assertTrue(changed)
        paths = tomllib.loads(updated)["target"]["x86_64-w64-mingw32"]["bin-dependencies"]["path-option"]
        self.assertEqual(paths, ["C:/vendor", str(desired.resolve())])
        again, changed_again = setup_stdx.merge_manifest_text(updated, "x86_64-w64-mingw32", desired)
        self.assertFalse(changed_again)
        self.assertEqual(again, updated)

    def test_invalid_path_option_fails_without_rewriting(self) -> None:
        text = "[target.x86_64-w64-mingw32.bin-dependencies]\npath-option = 42\n"
        with self.assertRaisesRegex(setup_stdx.SetupError, "array of strings"):
            setup_stdx.merge_manifest_text(text, "x86_64-w64-mingw32", Path("C:/stdx"))


class ArchiveTests(unittest.TestCase):
    def test_safe_extract_selects_cjnative_and_both_linkages(self) -> None:
        with tempfile.TemporaryDirectory(prefix="stdx-archive-") as temporary:
            root = Path(temporary); archive = root / "release.zip"
            fake_release(archive, "windows-x64", dual_backend=True)
            final = root / "install/cangjie-stdx-windows-x64-1.0.5.1"
            setup_stdx.extract_archive(archive, final.parent, final, force=False)
            self.assertEqual((final / "dynamic/stdx/libstdx.demo.dll").read_bytes(), b"dynamic")
            self.assertTrue(setup_stdx.locate_binary_root(final, "static").is_dir())

    def test_incomplete_install_is_replaced(self) -> None:
        with tempfile.TemporaryDirectory(prefix="stdx-stale-") as temporary:
            root = Path(temporary); archive = root / "release.zip"; fake_release(archive, "windows-x64")
            final = root / "install/cangjie-stdx-windows-x64-1.0.5.1"
            stale = final / "dynamic/stdx"; stale.mkdir(parents=True); (stale / "libstdx.demo.dll").write_bytes(b"partial")
            setup_stdx.extract_archive(archive, final.parent, final, force=False)
            self.assertTrue((final / "dynamic/stdx/stdx.demo.cjo").is_file())

    def test_path_traversal_symlink_and_special_files_are_rejected(self) -> None:
        with tempfile.TemporaryDirectory(prefix="stdx-malicious-") as temporary:
            root = Path(temporary)
            for name, configure in {
                "traversal.zip": lambda info: None,
                "symlink.zip": lambda info: setattr(info, "external_attr", (0o120777 << 16)),
                "fifo.zip": lambda info: setattr(info, "external_attr", (0o010644 << 16)),
            }.items():
                archive = root / name
                info = zipfile.ZipInfo("../escape" if name == "traversal.zip" else "payload/item")
                configure(info)
                with zipfile.ZipFile(archive, "w") as bundle:
                    bundle.writestr(info, b"bad")
                with self.subTest(name=name), self.assertRaises(setup_stdx.SetupError):
                    setup_stdx.extract_archive(archive, root / "install", root / "install/final", False)

    def test_offline_cache_contract(self) -> None:
        with tempfile.TemporaryDirectory(prefix="stdx-cache-") as temporary:
            root = Path(temporary); cached = root / "cached.zip"; fake_release(cached, "windows-x64")
            self.assertEqual(setup_stdx.download("invalid", cached, False, offline=True), cached)
            with self.assertRaisesRegex(setup_stdx.SetupError, "archive is not cached"):
                setup_stdx.download("invalid", root / "missing.zip", False, offline=True)

    def test_invalid_online_cache_is_replaced_atomically(self) -> None:
        class Response(BytesIO):
            headers = {"Content-Length": "0"}

        with tempfile.TemporaryDirectory(prefix="stdx-cache-repair-") as temporary:
            root = Path(temporary); source = root / "source.zip"; cached = root / "cached.zip"
            fake_release(source, "windows-x64")
            payload = source.read_bytes()
            cached.write_bytes(b"broken")
            with patch.object(urllib.request, "urlopen", return_value=Response(payload)):
                self.assertEqual(setup_stdx.download("https://example.invalid/release.zip", cached, False), cached)
            self.assertEqual(cached.read_bytes(), payload)
            self.assertFalse(any(root.glob("*.part-*")))


class IntegrationTests(unittest.TestCase):
    def test_default_root_is_user_home_on_all_platforms(self) -> None:
        with tempfile.TemporaryDirectory(prefix="stdx-home-") as temporary, patch.object(Path, "home", return_value=Path(temporary)):
            self.assertEqual(default_install_root(), (Path(temporary) / ".cangjie/stdx").resolve())

    def test_offline_install_is_global_versioned_idempotent_and_traceable(self) -> None:
        with tempfile.TemporaryDirectory(prefix="stdx-integration-") as temporary:
            root = Path(temporary); project = root / "project"; project.mkdir()
            manifest = project / "cjpm.toml"
            manifest.write_text('[package]\ncjc-version = "1.0.5"\nname = "demo"\nversion = "0.1.0"\noutput-type = "executable"\n', encoding="utf-8")
            archive = root / "release.zip"; fake_release(archive, "windows-x64")
            destination = root / "home/.cangjie/stdx"
            toolchain = Toolchain("1.0.5", "x86_64-w64-mingw32", "windows-x64", RELEASES["1.0.5.1"])
            first = run(arguments(project, destination, archive), toolchain)
            second = run(arguments(project, destination, archive), toolchain)
            self.assertTrue(first["configured"])
            self.assertFalse(second["configured"])
            self.assertEqual(first["binary_root"], second["binary_root"])
            self.assertIn(str(destination.resolve()), first["binary_root"])
            record = Path(first["install_record"])
            payload = json.loads(record.read_text(encoding="utf-8"))
            self.assertEqual(payload["stdx_version"], "1.0.5.1")
            self.assertEqual(len(payload["archive_sha256"]), 64)
            self.assertNotIn("manifest", payload)
            self.assertNotIn("configured", payload)
            self.assertTrue(manifest.with_name("cjpm.toml.stdx.bak").is_file())

    def test_reusing_installation_does_not_relabel_it_with_another_archive(self) -> None:
        with tempfile.TemporaryDirectory(prefix="stdx-record-") as temporary:
            root = Path(temporary); project = root / "project"; project.mkdir()
            (project / "cjpm.toml").write_text(
                '[package]\ncjc-version = "1.0.5"\nname = "demo"\nversion = "0.1.0"\noutput-type = "executable"\n',
                encoding="utf-8",
            )
            first_archive = root / "first.zip"; second_archive = root / "second.zip"
            fake_release(first_archive, "windows-x64")
            fake_release(second_archive, "windows-x64")
            with zipfile.ZipFile(second_archive, "a") as bundle:
                bundle.writestr("payload/extra.txt", b"different valid archive")
            destination = root / "home/.cangjie/stdx"
            toolchain = Toolchain("1.0.5", "x86_64-w64-mingw32", "windows-x64", RELEASES["1.0.5.1"])
            first = run(arguments(project, destination, first_archive), toolchain)
            record = Path(first["install_record"]); original = record.read_bytes()
            second = run(arguments(project, destination, second_archive), toolchain)
            self.assertNotEqual(first["archive_sha256"], second["archive_sha256"])
            self.assertEqual(first["archive_sha256"], second["installed_archive_sha256"])
            self.assertTrue(second["installation_reused"])
            self.assertEqual(record.read_bytes(), original)

    def test_invalid_installation_record_requires_forced_repair(self) -> None:
        with tempfile.TemporaryDirectory(prefix="stdx-record-repair-") as temporary:
            root = Path(temporary); project = root / "project"; project.mkdir()
            (project / "cjpm.toml").write_text(
                '[package]\ncjc-version = "1.0.5"\nname = "demo"\nversion = "0.1.0"\noutput-type = "executable"\n',
                encoding="utf-8",
            )
            archive = root / "release.zip"; fake_release(archive, "windows-x64")
            destination = root / "home/.cangjie/stdx"
            toolchain = Toolchain("1.0.5", "x86_64-w64-mingw32", "windows-x64", RELEASES["1.0.5.1"])
            first = run(arguments(project, destination, archive), toolchain)
            Path(first["install_record"]).write_text("not-json", encoding="utf-8")
            with self.assertRaisesRegex(setup_stdx.SetupError, "invalid installation record"):
                run(arguments(project, destination, archive), toolchain)
            repaired = run(arguments(project, destination, archive, force=True), toolchain)
            self.assertEqual(repaired["archive_sha256"], setup_stdx.sha256_file(archive))

    def test_global_lock_is_exclusive(self) -> None:
        with tempfile.TemporaryDirectory(prefix="stdx-lock-") as temporary:
            path = Path(temporary) / "setup.lock"
            with FileLock(path, timeout=0.2):
                with self.assertRaisesRegex(setup_stdx.SetupError, "timed out"):
                    with FileLock(path, timeout=0.2):
                        pass


if __name__ == "__main__":
    unittest.main(verbosity=2)
