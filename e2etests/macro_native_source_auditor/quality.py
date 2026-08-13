#!/usr/bin/env python3
"""Shared non-mutating formatting, lint, and test quality gates."""

from __future__ import annotations

import argparse
import csv
import hashlib
import os
from pathlib import Path
import shutil
import subprocess
import sys
import xml.etree.ElementTree as ET

MEMBERS = ("macros", "core", "app")
SUGGESTION_ALLOWLIST = {
    "G_ITF_02_prefer_implement_interfaces_at_type_definition",
    "G_OPR_01_avoid_operator_overloading_that_violates_conventions_02",
    "G_ERR_01_exceptions_process_02",
    "G_NAM_02_filename_standard_information",
    "G_NAM_05_immutable_global_variable_naming_information",
    "G_ITF_04_avoid_directly_using_interfaces_as_types_01",
    "G_VAR_02_min_scope",
}
BAD_DIAGNOSTICS = (
    "unknown start of token",
    "error:",
    " fail",
    "failed",
    "segmentation",
    "exception",
)


class Gate:
    def __init__(self) -> None:
        self.checks = 0
        self.failures: list[str] = []

    def check(self, condition: bool, label: str) -> None:
        self.checks += 1
        print(f"  {'ok  ' if condition else 'FAIL'}  {label}")
        if not condition:
            self.failures.append(label)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--project",
        type=Path,
        default=Path(os.environ.get("CANGJIE_TASK_ROOT", Path(__file__).resolve().parent)) / "oracle",
        help="auditor workspace root (default: ./oracle)",
    )
    parser.add_argument("--skip-tests", action="store_true")
    return parser.parse_args()


def run(command: list[str], cwd: Path, env: dict[str, str] | None = None) -> tuple[int, str]:
    result = subprocess.run(
        command,
        cwd=cwd,
        env=env,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
        encoding="utf-8",
        errors="replace",
        check=False,
    )
    return result.returncode, result.stdout


def cj_files(root: Path) -> list[Path]:
    return sorted((path.relative_to(root) for path in root.rglob("*.cj")), key=str)


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def same_text(left: Path, right: Path) -> bool:
    return left.read_text(encoding="utf-8").replace("\r\n", "\n") == right.read_text(
        encoding="utf-8"
    ).replace("\r\n", "\n")


def reset_reports(project: Path) -> Path:
    reports = (project / "reports").resolve()
    if reports.parent != project:
        raise RuntimeError(f"unsafe reports path: {reports}")
    if reports.exists():
        shutil.rmtree(reports)
    (reports / "formatted").mkdir(parents=True)
    (reports / "lint").mkdir(parents=True)
    return reports


def format_sources(project: Path, reports: Path, gate: Gate) -> list[str]:
    diagnostics: list[str] = []
    for member in MEMBERS:
        source = project / member / "src"
        code, output = run(
            ["cjfmt", "-d", f"{member}/src", "-o", f"reports/formatted/{member}"],
            project,
        )
        diagnostics.append(output)
        gate.check(code == 0, f"cjfmt exit 0 for {member}")
        formatted = reports / "formatted" / member / "src"
        inputs = cj_files(source)
        outputs = cj_files(formatted) if formatted.is_dir() else []
        gate.check(bool(inputs), f"cjfmt input set non-empty for {member} ({len(inputs)} file(s))")
        gate.check(inputs == outputs, f"cjfmt covered every input for {member}")
        gate.check(
            all((formatted / path).stat().st_size > 0 for path in outputs),
            f"cjfmt artifacts non-empty for {member}",
        )
        drift = [
            str(path)
            for path in inputs
            if not (formatted / path).is_file() or not same_text(source / path, formatted / path)
        ]
        suffix = f" (drift: {', '.join(drift)})" if drift else ""
        gate.check(not drift, f"sources already canonical for {member}{suffix}")
    return diagnostics


def lint_sources(project: Path, reports: Path, gate: Gate) -> tuple[list[str], int, int]:
    diagnostics: list[str] = []
    project_rows = toolchain_rows = 0
    expected_header = ["SourceFile", "Line", "Column", "Description", "DefectType", "DefectLevel"]
    for member in MEMBERS:
        relative = f"reports/lint/{member}.csv"
        csv_path = reports / "lint" / f"{member}.csv"
        code, output = run(["cjlint", "-f", f"{member}/src", "-r", "csv", "-o", relative], project)
        diagnostics.append(output)
        gate.check(code == 0, f"cjlint exit 0 for {member}")
        gate.check(csv_path.is_file(), f"cjlint CSV produced for {member}")
        if not csv_path.is_file():
            continue
        gate.check(csv_path.stat().st_size > 0, f"cjlint CSV non-empty for {member}")
        with csv_path.open(encoding="utf-8-sig", newline="") as stream:
            rows = list(csv.reader(stream))
        gate.check(bool(rows) and rows[0] == expected_header, f"cjlint CSV header valid for {member}")
        mandatory: list[str] = []
        unexpected: list[str] = []
        source_root = (project / member / "src").resolve()
        for row in rows[1:]:
            if len(row) < 6 or row == expected_header:
                continue
            try:
                reported = Path(row[0])
                resolved = reported.resolve() if reported.is_absolute() else (project / reported).resolve()
                is_project = resolved.is_relative_to(source_root)
            except (OSError, ValueError):
                is_project = False
            if not is_project:
                toolchain_rows += 1
                continue
            project_rows += 1
            level, defect = row[-1].strip(), row[-2]
            if level == "MANDATORY":
                mandatory.append(",".join(row))
            elif level == "SUGGESTIONS" and not any(rule in defect for rule in SUGGESTION_ALLOWLIST):
                unexpected.append(",".join(row))
        gate.check(not mandatory, f"cjlint MANDATORY defects = 0 for {member}")
        gate.check(not unexpected, f"cjlint SUGGESTIONS within allow-list for {member}")
    return diagnostics, project_rows, toolchain_rows


def test_project(project: Path, reports: Path, gate: Gate) -> None:
    env = os.environ.copy()
    env["PATH"] = str(project / "libs") + os.pathsep + env.get("PATH", "")
    code, _ = run(
        ["cjpm", "test", "--no-color", "--report-format", "xml", "--report-path", "reports/tests"],
        project,
        env,
    )
    gate.check(code == 0, "cjpm test exit 0")
    xml_files = list((reports / "tests").rglob("*.xml"))
    gate.check(bool(xml_files), f"cjpm test XML reports produced ({len(xml_files)} file(s))")
    total_cases = 0
    bad_suites: list[str] = []
    for path in xml_files:
        if path.stat().st_size == 0:
            bad_suites.append(f"{path.name}: empty")
            continue
        for suite in ET.parse(path).iter("testsuite"):
            total_cases += int(suite.get("tests", "0"))
            if int(suite.get("failures", "0")) or int(suite.get("errors", "0")):
                bad_suites.append(suite.get("name", path.name))
    gate.check(not bad_suites, "test XML reports zero failures/errors")
    gate.check(total_cases >= 28, f"test XML case count >= 28 (actual {total_cases})")


def main() -> int:
    args = parse_args()
    project = args.project.resolve()
    if not project.is_dir():
        raise FileNotFoundError(f"project directory not found: {project}")
    print(f"== quality gate: {project} ==")
    reports = reset_reports(project)
    gate = Gate()
    snapshot = {path: digest(path) for member in MEMBERS for path in (project / member / "src").rglob("*") if path.is_file()}
    gate.check(bool(snapshot), f"snapshot captured {len(snapshot)} source file(s)")
    fmt_diagnostics = format_sources(project, reports, gate)
    rewritten = [str(path) for path, before in snapshot.items() if not path.is_file() or digest(path) != before]
    gate.check(not rewritten, "cjfmt left src untouched")
    lint_diagnostics, project_rows, toolchain_rows = lint_sources(project, reports, gate)
    print(f"  note  lint rows: project={project_rows} toolchain={toolchain_rows}")
    for name, texts in (("cjfmt", fmt_diagnostics), ("cjlint", lint_diagnostics)):
        lowered = "\n".join(texts).lower()
        hits = [pattern for pattern in BAD_DIAGNOSTICS if pattern in lowered]
        gate.check(not hits, f"{name} diagnostics clean")
    gate.check("Formatting complete." in "\n".join(fmt_diagnostics), "cjfmt reported completion")
    if args.skip_tests:
        print("  skip  cjpm test stage (--skip-tests)")
    else:
        test_project(project, reports, gate)
    if gate.failures:
        print(f"QUALITY FAIL - {len(gate.failures)}/{gate.checks} assertion(s) failed")
        for failure in gate.failures:
            print(f"  - {failure}")
        return 1
    print(f"QUALITY PASS - {gate.checks} assertion(s)")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (OSError, RuntimeError, subprocess.SubprocessError) as exc:
        print(f"QUALITY ERROR: {exc}", file=sys.stderr)
        raise SystemExit(2)
