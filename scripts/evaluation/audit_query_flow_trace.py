#!/usr/bin/env python3
"""Audit a Claude Code trace for the cangjie-coding zero-enumeration workflow."""

from __future__ import annotations

import argparse
import json
import re
from pathlib import Path
from typing import Any


def json_lines(path: Path) -> list[dict[str, Any]]:
    raw = path.read_bytes()
    encoding = "utf-16" if raw.startswith((b"\xff\xfe", b"\xfe\xff")) else "utf-8-sig"
    rows = []
    for line in raw.decode(encoding, errors="replace").splitlines():
        try:
            value = json.loads(line)
        except json.JSONDecodeError:
            continue
        if isinstance(value, dict):
            rows.append(value)
    return rows


def tool_uses(events: list[dict[str, Any]]) -> list[dict[str, Any]]:
    return [
        block
        for event in events if event.get("type") == "assistant"
        for block in event.get("message", {}).get("content", [])
        if isinstance(block, dict) and block.get("type") == "tool_use"
    ]


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("trace", type=Path)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--require-native-skill", action="store_true")
    args = parser.parse_args()

    events = json_lines(args.trace)
    uses = tool_uses(events)
    init = next(
        (event for event in events if event.get("type") == "system" and event.get("subtype") == "init"),
        {},
    )
    commands = [
        str(use.get("input", {}).get("command", ""))
        for use in uses if use.get("name") in {"PowerShell", "Bash"}
    ]
    search_commands = [command for command in commands if "search_docs.py" in command.casefold()]
    forbidden_commands = []
    for command in commands:
        normalized = command.replace("\\", "/").casefold()
        touches_knowledge = any(marker in normalized for marker in (
            ".claude/skills", "cangjie-coding", "references", "_source",
        ))
        recursive_inventory = bool(
            re.search(r"(?i)get-childitem[^\n;|]*-recurse|-recurse[^\n;|]*get-childitem", command)
            or re.search(r"(?i)\brg\s+--files\b", command)
            or re.search(r"(?i)\bfind\s+[^\n;|]*(?:skills|references|cangjie-coding)", command)
        )
        if touches_knowledge and recursive_inventory:
            forbidden_commands.append(command)
    forbidden_globs = [
        use.get("input", {})
        for use in uses
        if use.get("name") == "Glob"
        and any(marker in json.dumps(use.get("input", {}), ensure_ascii=False).replace("\\", "/").casefold()
                for marker in (".claude/skills", "cangjie-coding", "references"))
    ]
    oversized_results = 0
    for event in events:
        if event.get("type") != "user":
            continue
        for block in event.get("message", {}).get("content", []):
            if isinstance(block, dict) and block.get("type") == "tool_result":
                oversized_results += "<persisted-output>" in str(block.get("content", ""))

    native_skills = list(init.get("skills") or [])
    result = {
        "native_skill_loaded": "cangjie-coding" in native_skills,
        "search_docs_calls": len(search_commands),
        "forbidden_recursive_inventory_calls": len(forbidden_commands) + len(forbidden_globs),
        "oversized_tool_results": oversized_results,
        "total_tool_calls": len(uses),
        "skill_tool_calls": sum(use.get("name") == "Skill" for use in uses),
        "read_tool_calls": sum(use.get("name") == "Read" for use in uses),
        "commands": commands,
        "forbidden_commands": forbidden_commands,
        "forbidden_globs": forbidden_globs,
    }
    rendered = json.dumps(result, ensure_ascii=False, indent=2) + "\n"
    if args.output:
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    passed = (
        result["search_docs_calls"] >= 1
        and result["forbidden_recursive_inventory_calls"] == 0
        and result["oversized_tool_results"] == 0
        and (result["native_skill_loaded"] or not args.require_native_skill)
    )
    return 0 if passed else 1


if __name__ == "__main__":
    raise SystemExit(main())
