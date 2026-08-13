#!/usr/bin/env python3
"""Cross-process stress tests for shared stdx caches and installations."""

from __future__ import annotations

import argparse
import json
import multiprocessing
import sys
import tempfile
import threading
import time
import tomllib
import unittest
import zipfile
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
DEV_ROOT = SCRIPT_DIR.parents[1]
sys.dont_write_bytecode = True
sys.path.insert(0, str(DEV_ROOT / "scripts"))

from stdx_setup.archive import download
from stdx_setup.cli import run
from stdx_setup.models import Toolchain
from stdx_setup.policy import release_for_cjc
from stdx_setup.system import FileLock, lock_name


def make_release(path: Path) -> None:
    with zipfile.ZipFile(path, "w") as bundle:
        bundle.writestr("payload/dynamic/stdx/libstdx.test.dll", b"dynamic")
        bundle.writestr("payload/dynamic/stdx/stdx.test.cjo", b"metadata")
        bundle.writestr("payload/static/stdx/libstdx.test.a", b"static")
        bundle.writestr("payload/static/stdx/stdx.test.cjo", b"metadata")


def make_project(path: Path) -> None:
    path.mkdir(parents=True)
    (path / "cjpm.toml").write_text(
        '[package]\ncjc-version = "1.0.5"\nname = "stress"\n'
        'version = "0.1.0"\noutput-type = "executable"\n',
        encoding="utf-8",
    )


def setup_worker(
    project: str, destination: str, archive: str, cjc_version: str,
    result_file: str, start: multiprocessing.synchronize.Event,
) -> None:
    start.wait(20)
    release = release_for_cjc(cjc_version)
    args = argparse.Namespace(
        project=Path(project), destination=Path(destination), platform=None,
        linkage="dynamic", archive=Path(archive), cache_dir=None, offline=True,
        no_configure=False, force=False, dry_run=False, json=False,
    )
    try:
        value = run(args, Toolchain(cjc_version, "x86_64-w64-mingw32", "windows-x64", release))
        outcome = {"ok": True, "result": value}
    except Exception as exc:  # pragma: no cover - reported to parent for diagnosis
        outcome = {"ok": False, "error": f"{type(exc).__name__}: {exc}"}
    Path(result_file).write_text(json.dumps(outcome), encoding="utf-8")


def download_worker(
    url: str, cache: str, result_file: str,
    start: multiprocessing.synchronize.Event,
) -> None:
    start.wait(20)
    path = Path(cache)
    try:
        with FileLock(path.parent / ".locks" / lock_name(str(path.resolve()))):
            download(url, path, force=False)
        outcome = {"ok": True}
    except Exception as exc:  # pragma: no cover - reported to parent for diagnosis
        outcome = {"ok": False, "error": f"{type(exc).__name__}: {exc}"}
    Path(result_file).write_text(json.dumps(outcome), encoding="utf-8")


class ConcurrencyTests(unittest.TestCase):
    workers = 8

    def _run_setup_group(
        self, root: Path, projects: list[Path], versions: list[str], archive: Path,
    ) -> list[dict[str, object]]:
        context = multiprocessing.get_context("spawn")
        start = context.Event()
        results = [root / f"result-{index}.json" for index in range(len(projects))]
        processes = [
            context.Process(
                target=setup_worker,
                args=(str(project), str(root / "stdx"), str(archive), version, str(result), start),
            )
            for project, version, result in zip(projects, versions, results)
        ]
        for process in processes:
            process.start()
        start.set()
        for process in processes:
            process.join(30)
            self.assertEqual(process.exitcode, 0)
        outcomes = [json.loads(path.read_text(encoding="utf-8")) for path in results]
        self.assertTrue(all(value["ok"] for value in outcomes), outcomes)
        return outcomes

    def _assert_no_transaction_debris(self, root: Path) -> None:
        patterns = ("*.part-*", ".stdx-extract-*", ".*.previous-*", ".cjpm.toml.*")
        debris = [path for pattern in patterns for path in root.rglob(pattern)]
        self.assertEqual(debris, [])

    def test_same_install_and_manifest_are_safe_under_parallel_setup(self) -> None:
        with tempfile.TemporaryDirectory(prefix="stdx-parallel-install-") as temporary:
            root = Path(temporary); archive = root / "release.zip"; make_release(archive)
            project = root / "project"; make_project(project)
            outcomes = self._run_setup_group(
                root, [project] * self.workers, ["1.0.5"] * self.workers, archive,
            )
            installs = {value["result"]["installation"] for value in outcomes}
            self.assertEqual(len(installs), 1)
            manifest = tomllib.loads((project / "cjpm.toml").read_text(encoding="utf-8"))
            paths = manifest["target"]["x86_64-w64-mingw32"]["bin-dependencies"]["path-option"]
            self.assertEqual(len(paths), 1)
            self.assertTrue((project / "cjpm.toml.stdx.bak").is_file())
            install_record = json.loads((Path(next(iter(installs))) / "install.json").read_text(encoding="utf-8"))
            self.assertNotIn("manifest", install_record)
            self._assert_no_transaction_debris(root)

    def test_multiple_versions_coexist_under_one_global_root(self) -> None:
        with tempfile.TemporaryDirectory(prefix="stdx-parallel-versions-") as temporary:
            root = Path(temporary); archive = root / "release.zip"; make_release(archive)
            versions = ["1.0.4", "1.0.5", "1.1.9", "1.2.3"] * 2
            projects = [root / f"project-{index}" for index in range(len(versions))]
            for project in projects:
                make_project(project)
            outcomes = self._run_setup_group(root, projects, versions, archive)
            installs = {Path(value["result"]["installation"]).name for value in outcomes}
            self.assertEqual(
                installs,
                {
                    "cangjie-stdx-windows-x64-1.0.4.1",
                    "cangjie-stdx-windows-x64-1.0.5.1",
                    "cangjie-stdx-windows-x64-1.1.3.1",
                    "cangjie-stdx-windows-x64-1.2.0-beta.02.1",
                },
            )
            self._assert_no_transaction_debris(root)

    def test_shared_cache_downloads_once_and_repairs_invalid_file(self) -> None:
        with tempfile.TemporaryDirectory(prefix="stdx-parallel-cache-") as temporary:
            root = Path(temporary); source = root / "source.zip"; make_release(source)
            payload = source.read_bytes(); cache = root / "cache/release.zip"
            cache.parent.mkdir(); cache.write_bytes(b"invalid")

            class Handler(BaseHTTPRequestHandler):
                requests = 0

                def do_GET(self) -> None:  # noqa: N802
                    type(self).requests += 1
                    time.sleep(0.1)
                    self.send_response(200)
                    self.send_header("Content-Length", str(len(payload)))
                    self.end_headers()
                    self.wfile.write(payload)

                def log_message(self, _format: str, *_args: object) -> None:
                    return

            server = ThreadingHTTPServer(("127.0.0.1", 0), Handler)
            thread = threading.Thread(target=server.serve_forever, daemon=True); thread.start()
            try:
                context = multiprocessing.get_context("spawn"); start = context.Event()
                results = [root / f"download-{index}.json" for index in range(self.workers)]
                url = f"http://127.0.0.1:{server.server_port}/release.zip"
                processes = [
                    context.Process(target=download_worker, args=(url, str(cache), str(result), start))
                    for result in results
                ]
                for process in processes:
                    process.start()
                start.set()
                for process in processes:
                    process.join(30); self.assertEqual(process.exitcode, 0)
                outcomes = [json.loads(path.read_text(encoding="utf-8")) for path in results]
                self.assertTrue(all(value["ok"] for value in outcomes), outcomes)
            finally:
                server.shutdown(); server.server_close(); thread.join(5)
            self.assertEqual(Handler.requests, 1)
            self.assertEqual(cache.read_bytes(), payload)
            self._assert_no_transaction_debris(root)


if __name__ == "__main__":
    multiprocessing.freeze_support()
    unittest.main(verbosity=2)
