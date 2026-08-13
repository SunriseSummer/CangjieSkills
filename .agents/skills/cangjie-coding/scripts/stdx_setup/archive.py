"""Release download, validation, safe extraction, and payload discovery."""

from __future__ import annotations

import os
import re
import shutil
import sys
import tempfile
import urllib.error
import urllib.request
import zipfile
from pathlib import Path, PurePosixPath

from .errors import SetupError

USER_AGENT = "cangjie-coding-stdx-setup/2"
_NATIVE_SUFFIXES = frozenset({".a", ".dll", ".dylib", ".so"})


def validate_zip(path: Path) -> None:
    if not path.is_file() or path.stat().st_size < 4 or not zipfile.is_zipfile(path):
        raise SetupError(f"not a valid ZIP archive: {path}")
    with path.open("rb") as stream:
        if stream.read(2) != b"PK":
            raise SetupError(f"ZIP magic mismatch: {path}")


def download(url: str, destination: Path, force: bool, offline: bool = False) -> Path:
    destination.parent.mkdir(parents=True, exist_ok=True)
    if destination.is_file() and not force:
        try:
            validate_zip(destination)
        except SetupError:
            if offline:
                raise
            print(f"Discarding invalid cached archive: {destination}", file=sys.stderr)
            destination.unlink()
        else:
            print(f"Using cached archive: {destination}", file=sys.stderr)
            return destination
    if offline:
        state = "--force requested a fresh archive" if destination.is_file() else "archive is not cached"
        raise SetupError(f"offline setup cannot download {url}: {state}; use --archive or populate {destination}")

    temporary = destination.with_name(destination.name + f".part-{os.getpid()}")
    temporary.unlink(missing_ok=True)
    request = urllib.request.Request(url, headers={"User-Agent": USER_AGENT, "Accept": "application/zip"})
    print(f"Downloading: {url}", file=sys.stderr)
    try:
        with urllib.request.urlopen(request, timeout=60) as response, temporary.open("wb") as output:
            total = int(response.headers.get("Content-Length", "0") or "0")
            received = 0
            while chunk := response.read(1024 * 1024):
                output.write(chunk)
                received += len(chunk)
                if total:
                    print(f"  {received}/{total} bytes", file=sys.stderr)
        validate_zip(temporary)
        os.replace(temporary, destination)
    except (OSError, urllib.error.URLError, zipfile.BadZipFile, SetupError) as exc:
        temporary.unlink(missing_ok=True)
        raise SetupError(f"download failed or returned an invalid ZIP: {exc}") from exc
    return destination


def _safe_member(name: str) -> PurePosixPath:
    normalized = name.replace("\\", "/")
    path = PurePosixPath(normalized)
    if path.is_absolute() or not path.parts or any(part in ("", ".", "..") for part in path.parts):
        raise SetupError(f"unsafe ZIP member path: {name!r}")
    if re.match(r"^[A-Za-z]:", normalized):
        raise SetupError(f"unsafe ZIP member drive path: {name!r}")
    return path


def _is_symlink(info: zipfile.ZipInfo) -> bool:
    return ((info.external_attr >> 16) & 0o170000) == 0o120000


def _is_special_file(info: zipfile.ZipInfo) -> bool:
    kind = (info.external_attr >> 16) & 0o170000
    return kind not in (0, 0o040000, 0o100000)


def _binary_root_complete(root: Path) -> bool:
    return root.is_dir() and any(root.glob("*.cjo")) and any(
        path.is_file() and path.suffix.casefold() in _NATIVE_SUFFIXES for path in root.iterdir()
    )


def installation_complete(installation: Path) -> bool:
    roots = (
        path for path in installation.rglob("stdx")
        if path.is_dir() and path.parent.name in {"dynamic", "static"}
    )
    return any(_binary_root_complete(path) for path in roots)


def _payload_root(temporary: Path) -> Path:
    children = [item for item in temporary.iterdir() if item.name != "__MACOSX"]
    cjnative = [item for item in children if item.is_dir() and item.name.casefold().endswith("_cjnative")]
    if len(cjnative) == 1:
        return cjnative[0]
    if len(children) == 1 and children[0].is_dir():
        return children[0]
    names = ", ".join(sorted(item.name for item in children))
    raise SetupError(f"cannot select one cjnative payload from release ZIP; top-level entries: {names}")


def extract_archive(archive: Path, destination: Path, final_dir: Path, force: bool) -> Path:
    validate_zip(archive)
    destination.mkdir(parents=True, exist_ok=True)
    if final_dir.resolve().parent != destination.resolve():
        raise SetupError(f"refusing to extract outside destination: {final_dir}")
    if final_dir.exists() and not force and installation_complete(final_dir):
        return final_dir

    with tempfile.TemporaryDirectory(prefix=".stdx-extract-", dir=destination) as temporary_name:
        temporary = Path(temporary_name).resolve()
        with zipfile.ZipFile(archive) as bundle:
            for info in bundle.infolist():
                relative = _safe_member(info.filename)
                if _is_symlink(info) or _is_special_file(info):
                    raise SetupError(f"special files are not allowed in release ZIP: {info.filename!r}")
                target = temporary.joinpath(*relative.parts).resolve()
                if target != temporary and temporary not in target.parents:
                    raise SetupError(f"ZIP member escapes extraction root: {info.filename!r}")
            bundle.extractall(temporary)
        selected = _payload_root(temporary)
        if not installation_complete(selected):
            raise SetupError(f"release ZIP does not contain a complete cjnative stdx payload: {archive}")
        previous = destination / f".{final_dir.name}.previous-{os.getpid()}"
        if previous.exists():
            shutil.rmtree(previous)
        if final_dir.exists():
            os.replace(final_dir, previous)
        try:
            os.replace(selected, final_dir)
        except OSError:
            if previous.exists() and not final_dir.exists():
                os.replace(previous, final_dir)
            raise
        else:
            shutil.rmtree(previous, ignore_errors=True)
    return final_dir


def locate_binary_root(installation: Path, linkage: str) -> Path:
    candidates = sorted(
        (path.resolve() for path in installation.rglob("stdx") if path.is_dir() and path.parent.name == linkage),
        key=lambda path: (len(path.parts), str(path)),
    )
    if not candidates:
        raise SetupError(f"cannot find {linkage}/stdx under extracted release: {installation}")
    if len(candidates) > 1 and len(candidates[0].parts) == len(candidates[1].parts):
        raise SetupError(f"multiple {linkage}/stdx directories found under: {installation}")
    if not _binary_root_complete(candidates[0]):
        raise SetupError(f"incomplete {linkage}/stdx payload under {installation}; rerun with --force")
    return candidates[0]
