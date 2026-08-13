#!/usr/bin/env python3
"""Validate the progressive-disclosure structure, links and API traceability."""

from __future__ import annotations

import argparse
import gzip
import html
import json
import os
import re
import shlex
import sys
from collections import Counter
from pathlib import Path, PurePosixPath
from urllib.parse import unquote

sys.path.insert(0, str(Path(__file__).resolve().parent))
from markdown_rules import escape_inline_code_pipes_in_tables


if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")


DEV_ROOT = Path(__file__).resolve().parents[2]
SKILL_ROOT = DEV_ROOT / ".agents" / "skills" / "cangjie-coding"
REFERENCES = DEV_ROOT / "references"
SEARCH_CONTENT_INDEX = REFERENCES / "search-content.json.gz"
DEVELOPMENT_ONLY_PAGES = {"testing.md"}
sys.dont_write_bytecode = True
sys.path.insert(0, str(SKILL_ROOT / "scripts"))
import search_docs
META_RE = re.compile(r"^<!--\s+cj-doc\s+(.+?)\s+-->$")
FENCE_RE = re.compile(r"^```([^`]*)$", re.MULTILINE)
LINK_TARGET_RE = re.compile(r"(?<!\\)\[(?:`[^`\n]*`|[^\]\n])*?(?<!\\)\]\(([^)\n]+)\)")
NON_LEAF_KINDS = {"index", "api-package", "api-type", "api-member-index", "guide-index", "guide-topic", "example-category"}
LOW_INFORMATION_SUMMARY_RE = re.compile(
    r"^(?:进入子页查看|说明.+的语法与约束|涵盖.+|列出相关 API 签名与用途|给出.+|.+（(?:命令或配置说明|规则正文|用法正文|示例正文)）)[。.]?$"
)
REDUNDANT_API_DECL_RE = re.compile(
    r"\[`(?:public\s+)?(?:class|interface|struct|enum)\s+|\[`public\s+(?:func|prop|let|var|const)\s+"
)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Validate the layered Cangjie knowledge tree.")
    parser.add_argument("--json", type=Path, help="Write validation report")
    return parser.parse_args()


def load_records() -> list[dict]:
    records: list[dict] = []
    records.extend(json.loads((REFERENCES / "api" / "manifest.json").read_text(encoding="utf-8")))
    records.extend(json.loads((REFERENCES / "guide-manifest.json").read_text(encoding="utf-8")))
    records.append(
        {"id": "references", "kind": "index", "level": 1, "parent": "skill", "path": "index.md"}
    )
    return records


def parse_meta(page: Path) -> dict[str, str]:
    first = page.read_text(encoding="utf-8-sig", errors="replace").splitlines()[0]
    match = META_RE.match(first)
    if not match:
        raise ValueError("first line must be a cj-doc metadata comment")
    attrs: dict[str, str] = {}
    for item in shlex.split(html.unescape(match.group(1))):
        if "=" not in item:
            raise ValueError(f"invalid metadata attribute: {item!r}")
        key, value = item.split("=", 1)
        if key in attrs:
            raise ValueError(f"duplicate metadata attribute: {key}")
        attrs[key] = value
    return attrs


def local_targets(page: Path, text: str) -> list[Path]:
    targets: list[Path] = []
    visible: list[str] = []
    in_fence = False
    for line in text.splitlines():
        if re.match(r"^\s*```", line):
            in_fence = not in_fence
            continue
        if not in_fence:
            visible.append(re.sub(r"`[^`]*`", "", line))
    for match in LINK_TARGET_RE.finditer("\n".join(visible)):
        target = match.group(1).strip().strip("<>")
        if not target or target.startswith(("#", "http://", "https://", "mailto:")):
            continue
        file_part = unquote(target.split("#", 1)[0])
        targets.append((page.parent / file_part).resolve())
    return targets


def visible_lines(text: str) -> list[str]:
    """Return prose lines, excluding fenced code while preserving inline code."""
    result: list[str] = []
    fence: str | None = None
    for line in text.splitlines():
        match = re.match(r"^\s*(```+|~~~+)", line)
        if match:
            marker = match.group(1)[0]
            fence = marker if fence is None else (None if fence == marker else fence)
            continue
        if fence is None:
            result.append(line)
    return result


def unclosed_fence_marker(text: str) -> str | None:
    """Return the opening fence marker when a Markdown fence is not closed."""
    fence: str | None = None
    for line in text.splitlines():
        match = re.match(r"^\s*(`{3,}|~{3,})", line)
        if not match:
            continue
        marker = match.group(1)
        if fence is None:
            fence = marker
        elif marker[0] == fence[0] and len(marker) >= len(fence):
            fence = None
    return fence


def has_explanatory_language_prose(text: str) -> bool:
    """Distinguish explanations from headings, navigation and provenance boilerplate."""
    ignored_prefixes = (
        "<!--", "#", "|", "---", "← ", "→ ", "证据源：", "验证证据：",
        "粒度：", "文档 ID：", "源章节：",
    )
    for line in visible_lines(text):
        stripped = line.strip()
        if not stripped or stripped.startswith(ignored_prefixes):
            continue
        if re.fullmatch(r"\[[^]]+\]\([^)]*\)", stripped):
            continue
        return True
    return False


def main() -> int:
    args = parse_args()
    errors: list[str] = []
    warnings: list[str] = []
    records = load_records()
    if (REFERENCES / "_source").exists():
        errors.append("references/_source must not exist; active Markdown is authoritative")

    indexed_pages: dict[str, str] = {}
    try:
        search_payload = json.loads(gzip.decompress(SEARCH_CONTENT_INDEX.read_bytes()).decode("utf-8"))
        if search_payload.get("format") == 1 and isinstance(search_payload.get("pages"), dict):
            indexed_pages = search_payload["pages"]
        indexed_paths = set(indexed_pages)
        expected_paths = {str(record.get("path", "")) for record in records}
        if indexed_paths != expected_paths:
            errors.append(
                "search content index paths differ from manifests; run scripts/maintenance/build_search_index.py"
            )
    except (OSError, UnicodeDecodeError, json.JSONDecodeError, AttributeError) as exc:
        errors.append(f"cannot read search content index: {exc}")
    by_id: dict[str, dict] = {}
    by_path: dict[Path, dict] = {}

    for record in records:
        doc_id = record["id"]
        page = (REFERENCES / record["path"]).resolve()
        if doc_id in by_id:
            errors.append(f"duplicate id: {doc_id}")
        else:
            by_id[doc_id] = record
        if page in by_path:
            errors.append(f"duplicate page path: {record['path']}")
        else:
            by_path[page] = record
        if not page.is_file():
            errors.append(f"missing page: {record['path']}")

    legacy_guides = REFERENCES / "guides"
    if legacy_guides.exists():
        errors.append("legacy references/guides tree still exists; application examples must use references/examples")
    example_root = by_id.get("examples")
    if not example_root:
        errors.append("application example root is missing")
    else:
        example_children = [record for record in records if record.get("parent") == "examples"]
        for category in example_children:
            if category.get("kind") != "example-category":
                errors.append(f"examples root has non-category child: {category['id']}")
            leaves = [record for record in records if record.get("parent") == category["id"]]
            if not leaves:
                errors.append(f"empty application example category: {category['id']}")
            for leaf in leaves:
                if leaf.get("kind") != "example-leaf":
                    errors.append(f"application category has non-leaf child: {leaf['id']}")
                leaf_page = REFERENCES / str(leaf.get("path", ""))
                if leaf_page.is_file():
                    leaf_text = leaf_page.read_text(encoding="utf-8-sig", errors="replace")
                    if not re.search(r"\bcjtest=(?:run|project)\b", leaf_text):
                        errors.append(f"application example is not runnable: {leaf['id']}")
                    lines = leaf_text.splitlines()
                    in_fence = False
                    for index, line in enumerate(lines):
                        if not line.strip().startswith("```"):
                            continue
                        if not in_fence:
                            previous = next(
                                (item.strip() for item in reversed(lines[:index]) if item.strip()),
                                "",
                            )
                            if not previous or previous.startswith(
                                ("```", "#", "<!--", "|", "- ", "* ", "+ ")
                            ):
                                errors.append(
                                    f"application example code block lacks context: "
                                    f"{leaf['id']}:{index + 1}"
                                )
                        in_fence = not in_fence

    max_lines: list[tuple[int, str]] = []
    linked_children: Counter[str] = Counter()
    parent_ids = {str(record.get("parent", "")) for record in records}
    link_count = 0
    for record in records:
        page = (REFERENCES / record["path"]).resolve()
        if not page.is_file():
            continue
        text = page.read_text(encoding="utf-8-sig", errors="replace")
        expected_search_text = search_docs.prepare_search_content(text)
        if indexed_pages.get(record["path"]) != expected_search_text:
            errors.append(
                f"{record['path']}: stale search content; run scripts/maintenance/build_search_index.py"
            )
        line_count = len(text.splitlines())
        max_lines.append((line_count, record["path"]))
        try:
            meta = parse_meta(page)
        except ValueError as exc:
            errors.append(f"{record['path']}: {exc}")
            meta = {}
        for key in ("id", "kind", "parent"):
            if meta.get(key) != str(record.get(key, "")):
                errors.append(f"{record['path']}: metadata {key}={meta.get(key)!r}, manifest={record.get(key)!r}")
        if meta.get("level") != str(record.get("level")):
            errors.append(f"{record['path']}: metadata level={meta.get('level')!r}, manifest={record.get('level')!r}")
        if "source" in meta:
            errors.append(f"{record['path']}: legacy source metadata remains")

        parent_id = record.get("parent")
        if parent_id != "skill":
            parent = by_id.get(parent_id)
            if not parent:
                errors.append(f"{record['path']}: unknown parent {parent_id}")
            elif int(record.get("level", 0)) != int(parent.get("level", 0)) + 1:
                errors.append(
                    f"{record['path']}: level {record.get('level')} must equal parent "
                    f"{parent_id} level {parent.get('level')} + 1"
                )

        if "\ufffd" in text:
            errors.append(f"{record['path']}: contains Unicode replacement character")
        if any(line.lstrip().startswith("证据源：") for line in text.splitlines()):
            errors.append(f"{record['path']}: visible provenance footer is not part of the reading path")
        if marker := unclosed_fence_marker(text):
            errors.append(f"{record['path']}: unclosed Markdown fence {marker!r}")
        summary = str(record.get("summary", "")).strip()
        if summary.count("`") % 2:
            errors.append(f"{record['path']}: summary contains unclosed inline code: {summary}")
        if summary.endswith("…"):
            errors.append(f"{record['path']}: manifest summary is truncated")
        if LOW_INFORMATION_SUMMARY_RE.fullmatch(summary):
            errors.append(f"{record['path']}: low-information summary: {summary}")
        if re.fullmatch(r"`[^`]+`\s*演示(?:集合操作|字符串处理)。", summary):
            errors.append(f"{record['path']}: summary names an example without explaining the operations")
        if str(record.get("id", "")).startswith("language."):
            if summary.startswith("示例入口"):
                errors.append(f"{record['path']}: summary describes a code token instead of the feature")
            if summary in {"—", "-", "--"} or summary.endswith(("：", ":")):
                errors.append(f"{record['path']}: incomplete language summary: {summary!r}")
            if len(summary) < 12:
                errors.append(f"{record['path']}: language summary is too terse: {summary!r}")
            if record.get("kind") == "guide-leaf" and "```cangjie" in text and not has_explanatory_language_prose(text):
                errors.append(f"{record['path']}: code example lacks an explanatory introduction")
        prose_lines = visible_lines(text)
        for number, line in enumerate(text.splitlines(), 1):
            if line.lstrip().startswith("|") and escape_inline_code_pipes_in_tables(line) != line:
                errors.append(
                    f"{record['path']}:{number}: table contains an unescaped pipe inside inline code"
                )
        if any("_source/" in line.replace("\\", "/") for line in prose_lines):
            errors.append(f"{record['path']}: removed _source path remains in active content")
        if record["kind"] in {"api-package", "api-type", "api-member-index"}:
            for line in prose_lines:
                if line.startswith("|") and REDUNDANT_API_DECL_RE.search(line):
                    errors.append(f"{record['path']}: API overview repeats public/type declaration keywords")
                if line.startswith("|") and len(line) > 500:
                    errors.append(f"{record['path']}: API overview row exceeds 500 characters")
        if record["kind"] == "api-package":
            package_id = str(record["id"])
            if not re.fullmatch(r"(?:std|stdx)(?:\.[A-Za-z_][A-Za-z0-9_]*)+", package_id):
                errors.append(f"{record['path']}: invalid importable package id: {package_id}")
            if f"包路径：`{package_id}`" not in text:
                errors.append(f"{record['path']}: missing exact package path hint")
        if record["kind"].startswith("api-") and ("operator-item" in record["path"] or record["id"].endswith(".item")):
            errors.append(f"{record['path']}: lossy API slug uses item/operator-item")
        if record["kind"].startswith("api-"):
            if "legacy-api-" in text:
                errors.append(f"{record['path']}: inherited API example leaked into the active tree")
            for fence in FENCE_RE.finditer(text):
                info = fence.group(1).strip()
                if info.startswith("cangjie") and "cjtest=" not in info and "role=signature" not in info:
                    errors.append(f"{record['path']}: unclassified API Cangjie fence")
                    break
        if record["kind"] == "api-member" and "role=signature" not in text:
            errors.append(f"{record['path']}: API member leaf lacks an exact signature")
        normalized_path = record["path"].replace("\\", "/")
        if any(f"/{folder}/" in normalized_path for folder in ("classes", "interfaces", "structs", "enums")):
            parent_record = by_id.get(str(record.get("parent", "")))
            if record["kind"] == "api-member" and parent_record and parent_record.get("kind") == "api-package":
                errors.append(f"{record['path']}: nominal type page is classified as api-member")
        if "/macros/" in normalized_path and record["kind"] == "api-type":
            errors.append(f"{record['path']}: macro page is classified as api-type")

        targets = local_targets(page, text)
        link_count += len(targets)
        page_children: set[str] = set()
        for target in targets:
            if not target.exists():
                errors.append(f"{record['path']}: broken link -> {target}")
            child = by_path.get(target)
            if child and child.get("parent") == record["id"]:
                page_children.add(child["id"])
        for child_id in page_children:
            linked_children[child_id] += 1

        is_non_leaf = record["kind"] in NON_LEAF_KINDS or record["id"] in parent_ids
        if is_non_leaf:
            for fence in FENCE_RE.finditer(text):
                if fence.group(1).strip().split(None, 1)[0:1] == ["cangjie"]:
                    errors.append(f"{record['path']}: non-leaf page contains a Cangjie fence")
                    break
        if is_non_leaf and line_count > 500:
            errors.append(f"{record['path']}: overview/index exceeds 500 lines ({line_count})")
        elif not is_non_leaf and line_count > 500:
            warnings.append(f"{record['path']}: leaf exceeds 500 lines ({line_count})")

    for record in records:
        if record.get("parent") == "skill":
            continue
        if linked_children[record["id"]] != 1:
            errors.append(f"{record['path']}: parent links to this child {linked_children[record['id']]} time(s), expected 1")

    macro_attr = REFERENCES / "language" / "macro" / "3-宏实现" / "3-2-属性宏.md"
    macro_power = REFERENCES / "language" / "macro" / "6-典型示例代码" / "6-1-快速幂-编译时代码生成.md"
    if macro_attr.is_file() and "@Foo[attrContent](inputContent)" not in macro_attr.read_text(encoding="utf-8-sig"):
        errors.append(f"{macro_attr.relative_to(REFERENCES)}: macro attribute syntax was rewritten")
    if macro_power.is_file() and "@power[10](n)" not in macro_power.read_text(encoding="utf-8-sig"):
        errors.append(f"{macro_power.relative_to(REFERENCES)}: macro invocation syntax was rewritten")

    coverage = json.loads((REFERENCES / "api" / "coverage.json").read_text(encoding="utf-8"))
    # Recommended 1.0.5 surface after removing deprecated packages and declarations.
    if coverage.get("packages") != 53:
        errors.append(f"API coverage package count changed: {coverage.get('packages')} != 53")
    if coverage.get("entities") != 1100:
        errors.append(f"API coverage entity count changed: {coverage.get('entities')} != 1100")
    if coverage.get("ignored_h2"):
        errors.append(f"API coverage has ignored headings: {len(coverage['ignored_h2'])}")
    api_manifest_count = len(json.loads((REFERENCES / "api" / "manifest.json").read_text(encoding="utf-8")))
    if coverage.get("generated_pages") != api_manifest_count:
        errors.append(
            f"API coverage generated page count differs from manifest: "
            f"{coverage.get('generated_pages')} != {api_manifest_count}"
        )

    active_pages = [
        path for path in REFERENCES.rglob("*.md")
        if path.relative_to(REFERENCES).as_posix() not in DEVELOPMENT_ONLY_PAGES
    ]
    obsolete_marker = re.compile(r"deprecated|已废弃|已弃用|未来版本即将废弃", re.IGNORECASE)
    stale_references = (
        "std.runtime.GC(",
        "Console.stdout",
        "DateTime 的 func toString(DateTimeFormat)",
    )
    for page in active_pages:
        text = page.read_text(encoding="utf-8-sig")
        if obsolete_marker.search(text):
            errors.append(f"{page.relative_to(REFERENCES)}: deprecated API leaked into active tree")
        for stale in stale_references:
            if stale in text:
                errors.append(
                    f"{page.relative_to(REFERENCES)}: stale API reference leaked into active tree: {stale}"
                )

    concurrent_map = REFERENCES / "api/std/collection-concurrent/classes/concurrenthashmap/index.md"
    if concurrent_map.is_file():
        concurrent_text = concurrent_map.read_text(encoding="utf-8-sig")
        for removed in ("put(key: K", "putIfAbsent(key: K"):
            if removed in concurrent_text:
                errors.append(f"{concurrent_map.relative_to(REFERENCES)}: removed API remains: {removed}")
    for removed_path in (
        REFERENCES / "api/std/console",
        REFERENCES / "api/std/objectpool",
        REFERENCES / "api/std/posix",
    ):
        if removed_path.exists():
            errors.append(f"deprecated-only package remains active: {removed_path.relative_to(REFERENCES)}")

    manifested = set(by_path)
    for page in active_pages:
        if page.resolve() not in manifested:
            errors.append(f"active Markdown page missing from manifest: {page.relative_to(REFERENCES)}")
    for page in REFERENCES.rglob("README.md"):
        errors.append(f"active tree must use index.md, not README.md: {page.relative_to(REFERENCES)}")

    kinds = Counter(record["kind"] for record in records)
    max_lines.sort(reverse=True)
    report = {
        "records": len(records),
        "kinds": dict(sorted(kinds.items())),
        "api_coverage": coverage,
        "largest_pages": [{"lines": lines, "path": path} for lines, path in max_lines[:20]],
        "warnings": warnings,
        "errors": errors,
    }
    if args.json:
        args.json.parent.mkdir(parents=True, exist_ok=True)
        args.json.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8", newline="\n")
    print(f"structure: records={len(records)} links_checked={link_count} warnings={len(warnings)} errors={len(errors)}")
    if warnings:
        for warning in warnings[:10]:
            print(f"WARNING {warning}")
    if errors:
        for error in errors[:50]:
            print(f"ERROR {error}")
        if len(errors) > 50:
            print(f"... {len(errors) - 50} more errors")
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
