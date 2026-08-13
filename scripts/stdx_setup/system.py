"""Cross-platform filesystem, locking, and toolchain primitives."""

from __future__ import annotations

import hashlib
import os
import subprocess
import time
from contextlib import AbstractContextManager
from pathlib import Path
from types import TracebackType

from .errors import SetupError
from .models import Toolchain
from .policy import parse_cjc_output


def default_install_root() -> Path:
    try:
        home = Path.home()
    except (RuntimeError, OSError) as exc:
        raise SetupError(f"cannot resolve the current user's home directory: {exc}") from exc
    return (home / ".cangjie" / "stdx").resolve()


def inspect_toolchain() -> Toolchain:
    try:
        process = subprocess.run(
            ["cjc", "-v"], capture_output=True, text=True, encoding="utf-8",
            errors="replace", timeout=15, check=False,
        )
    except (OSError, subprocess.TimeoutExpired) as exc:
        raise SetupError(f"cannot execute `cjc -v`: {exc}") from exc
    if process.returncode != 0:
        detail = (process.stderr or process.stdout).strip()
        raise SetupError(f"`cjc -v` failed: {detail}")
    return parse_cjc_output(process.stdout + "\n" + process.stderr)


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def lock_name(value: str) -> str:
    return hashlib.sha256(value.encode("utf-8")).hexdigest()[:24] + ".lock"


class FileLock(AbstractContextManager["FileLock"]):
    """Small advisory lock using only the Python standard library."""

    def __init__(self, path: Path, timeout: float = 120.0) -> None:
        self.path = path
        self.timeout = timeout
        self._stream = None

    def __enter__(self) -> "FileLock":
        self.path.parent.mkdir(parents=True, exist_ok=True)
        self._stream = self.path.open("a+b")
        self._stream.seek(0, os.SEEK_END)
        if self._stream.tell() == 0:
            self._stream.write(b"\0")
            self._stream.flush()
        deadline = time.monotonic() + self.timeout
        while True:
            try:
                self._acquire()
                return self
            except OSError as exc:
                if time.monotonic() >= deadline:
                    self._stream.close()
                    self._stream = None
                    raise SetupError(f"timed out waiting for setup lock {self.path}: {exc}") from exc
                time.sleep(0.1)

    def _acquire(self) -> None:
        assert self._stream is not None
        self._stream.seek(0)
        if os.name == "nt":
            import msvcrt
            msvcrt.locking(self._stream.fileno(), msvcrt.LK_NBLCK, 1)
        else:
            import fcntl
            fcntl.flock(self._stream.fileno(), fcntl.LOCK_EX | fcntl.LOCK_NB)

    def __exit__(
        self,
        exc_type: type[BaseException] | None,
        exc: BaseException | None,
        traceback: TracebackType | None,
    ) -> None:
        if self._stream is None:
            return
        try:
            self._stream.seek(0)
            if os.name == "nt":
                import msvcrt
                msvcrt.locking(self._stream.fileno(), msvcrt.LK_UNLCK, 1)
            else:
                import fcntl
                fcntl.flock(self._stream.fileno(), fcntl.LOCK_UN)
        finally:
            self._stream.close()
            self._stream = None
