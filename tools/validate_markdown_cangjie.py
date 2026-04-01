#!/usr/bin/env python3
"""Validate marked Cangjie code blocks in Markdown files.

Supported markers immediately before a ```cangjie fence:
  <!-- verify -->        compile as static library
  <!-- run -->           compile as executable and run it
  <!-- compile.error --> compilation must fail
"""

from __future__ import annotations

import argparse
import pathlib
import re
import shutil
import subprocess
import sys
import tempfile


BLOCK_RE = re.compile(
    r"<!--\s*(run|verify|compile\.error)\b[^>]*-->\s*```cangjie\n(.*?)\n```",
    re.S,
)


def resolve_cjc(explicit: str | None) -> str:
    if explicit:
        return explicit
    for candidate in (
        shutil.which("cjc"),
        str(pathlib.Path("/tmp/cangjie/bin/cjc")),
    ):
        if candidate and pathlib.Path(candidate).exists():
            return candidate
    raise SystemExit("Unable to find `cjc`. Pass --cjc or add it to PATH.")


def ensure_package(code: str, package_name: str) -> str:
    if re.search(r"^\s*package\s+[A-Za-z_][A-Za-z0-9_.]*", code, re.M):
        return code
    return f"package {package_name}\n\n{code}"


def validate_block(cjc: str, markdown: pathlib.Path, mode: str, code: str, block_index: int, line: int) -> None:
    package_name = f"mdcheck_{markdown.stem}_{block_index}"
    source = ensure_package(code, package_name)

    with tempfile.TemporaryDirectory(prefix="cj-md-") as td:
        td_path = pathlib.Path(td)
        src_path = td_path / "main.cj"
        src_path.write_text(source, encoding="utf-8")

        if mode == "run":
            out_path = td_path / "program"
            command = [cjc, str(src_path), "-o", str(out_path)]
        else:
            out_path = td_path / "libcheck.a"
            command = [cjc, "--output-type=staticlib", "-Woff", "unused", "-o", str(out_path), str(src_path)]

        result = subprocess.run(command, capture_output=True, text=True)

        if mode == "compile.error":
            if result.returncode == 0:
                raise AssertionError(
                    f"{markdown}:{line}: expected compilation failure, but block compiled successfully"
                )
            return

        if result.returncode != 0:
            message = result.stderr.strip() or result.stdout.strip()
            raise AssertionError(f"{markdown}:{line}: compilation failed\n{message}")

        if mode == "run":
            run_result = subprocess.run([str(out_path)], capture_output=True, text=True)
            if run_result.returncode != 0:
                message = run_result.stderr.strip() or run_result.stdout.strip()
                raise AssertionError(f"{markdown}:{line}: program exited with {run_result.returncode}\n{message}")


def iter_blocks(markdown: pathlib.Path):
    text = markdown.read_text(encoding="utf-8")
    for block_index, match in enumerate(BLOCK_RE.finditer(text), 1):
        mode = match.group(1)
        code = match.group(2)
        line = text.count("\n", 0, match.start()) + 1
        yield block_index, mode, code, line


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("markdown_files", nargs="+", help="Markdown files to validate")
    parser.add_argument("--cjc", help="Path to cjc executable")
    args = parser.parse_args()

    cjc = resolve_cjc(args.cjc)
    failures: list[str] = []
    validated = 0

    for raw_path in args.markdown_files:
        markdown = pathlib.Path(raw_path).resolve()
        blocks = list(iter_blocks(markdown))
        if not blocks:
            print(f"SKIP  {markdown} (no marked blocks)")
            continue

        for block_index, mode, code, line in blocks:
            try:
                validate_block(cjc, markdown, mode, code, block_index, line)
            except AssertionError as exc:
                failures.append(str(exc))
                print(f"FAIL  {markdown}:{line} [{mode}]")
            else:
                validated += 1
                print(f"PASS  {markdown}:{line} [{mode}]")

    print(f"\nValidated blocks: {validated}")
    if failures:
        print(f"Failures: {len(failures)}", file=sys.stderr)
        for failure in failures:
            print(f"\n{failure}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
