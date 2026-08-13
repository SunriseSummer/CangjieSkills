"""Idempotent, syntax-checked cjpm.toml path-option updates."""

from __future__ import annotations

import json
import os
import re
import shutil
import tempfile
import tomllib
from pathlib import Path

from .errors import SetupError


def resolve_project(value: Path, no_configure: bool) -> tuple[Path, Path | None]:
    path = value.expanduser().resolve()
    if path.is_file():
        if path.name != "cjpm.toml":
            raise SetupError(f"--project file must be cjpm.toml: {path}")
        return path.parent, path
    if not path.is_dir():
        raise SetupError(f"project directory does not exist: {path}")
    manifest = path / "cjpm.toml"
    if not no_configure and not manifest.is_file():
        raise SetupError(f"cjpm.toml not found under project: {path}")
    return path, manifest if manifest.is_file() else None


def _path_key(value: str) -> str:
    path = Path(value).expanduser()
    try:
        normalized = str(path.resolve())
    except OSError:
        normalized = str(path)
    return os.path.normcase(os.path.normpath(normalized))


def _render_paths(values: list[str], indent: str = "    ") -> str:
    encoded = ", ".join(json.dumps(value, ensure_ascii=False) for value in values)
    return f"{indent}path-option = [{encoded}]"


def _is_stdx_release_path(value: str) -> bool:
    path = Path(value).expanduser()
    parts = path.parts
    return (
        len(parts) >= 3
        and path.name == "stdx"
        and path.parent.name in {"dynamic", "static"}
        and re.fullmatch(r"cangjie-stdx-.+-.+", path.parent.parent.name) is not None
    )


def merge_manifest_text(text: str, target: str, binary_root: Path) -> tuple[str, bool]:
    try:
        parsed = tomllib.loads(text)
    except tomllib.TOMLDecodeError as exc:
        raise SetupError(f"cannot configure invalid cjpm.toml: {exc}") from exc
    existing = parsed.get("target", {}).get(target, {}).get("bin-dependencies", {}).get("path-option", [])
    if existing is None:
        existing = []
    if not isinstance(existing, list) or not all(isinstance(value, str) for value in existing):
        raise SetupError(f"target.{target}.bin-dependencies.path-option must be an array of strings")
    desired = str(binary_root.resolve())
    # A target must see exactly one official stdx release. Preserve unrelated
    # binary dependencies while migrating installer-managed project-local or
    # global paths from an older version/linkage.
    values = [value for value in existing if not _is_stdx_release_path(value)]
    if _path_key(desired) not in {_path_key(value) for value in values}:
        values.append(desired)

    lines = text.splitlines()
    section = re.compile(rf"^\s*\[target\.{re.escape(target)}\.bin-dependencies\]\s*(?:#.*)?$")
    table = re.compile(r"^\s*\[")
    start = next((index for index, line in enumerate(lines) if section.match(line)), None)
    if start is None:
        if lines and lines[-1].strip():
            lines.append("")
        lines.extend([f"[target.{target}.bin-dependencies]", _render_paths(values)])
    else:
        end = next((index for index in range(start + 1, len(lines)) if table.match(lines[index])), len(lines))
        assignment = next(
            (index for index in range(start + 1, end) if re.match(r"^\s*path-option\s*=", lines[index])), None
        )
        if assignment is None:
            lines.insert(end, _render_paths(values))
        else:
            indent = re.match(r"^(\s*)", lines[assignment]).group(1)
            assignment_end = assignment + 1
            balance = lines[assignment].count("[") - lines[assignment].count("]")
            while balance > 0 and assignment_end < end:
                balance += lines[assignment_end].count("[") - lines[assignment_end].count("]")
                assignment_end += 1
            lines[assignment:assignment_end] = [_render_paths(values, indent)]
    updated = "\n".join(lines).rstrip() + "\n"
    try:
        tomllib.loads(updated)
    except tomllib.TOMLDecodeError as exc:
        raise SetupError(f"internal error: generated invalid cjpm.toml: {exc}") from exc
    return updated, updated != text.rstrip() + "\n"


def configure_manifest(manifest: Path, target: str, binary_root: Path, dry_run: bool = False) -> bool:
    original = manifest.read_text(encoding="utf-8-sig")
    updated, changed = merge_manifest_text(original, target, binary_root)
    if not changed or dry_run:
        return changed
    backup = manifest.with_name("cjpm.toml.stdx.bak")
    if not backup.exists():
        shutil.copy2(manifest, backup)
    descriptor, temporary_name = tempfile.mkstemp(prefix=".cjpm.toml.", dir=manifest.parent)
    temporary = Path(temporary_name)
    try:
        with os.fdopen(descriptor, "w", encoding="utf-8", newline="\n") as stream:
            stream.write(updated)
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(temporary, manifest)
    finally:
        temporary.unlink(missing_ok=True)
    return True
