#!/usr/bin/env python3
"""Guard the compact, progressive-disclosure Skill entrypoint contract."""

from __future__ import annotations

import re
import unittest
from pathlib import Path


DEV_ROOT = Path(__file__).resolve().parents[2]
SKILL_ROOT = DEV_ROOT / ".agents" / "skills" / "cangjie-coding"
SKILL_PATH = SKILL_ROOT / "SKILL.md"
DEV_SKILL_PATH = DEV_ROOT / "SKILL.md"


class SkillEntrypointTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.skill = SKILL_PATH.read_text(encoding="utf-8-sig")

    def test_frontmatter_is_concise_and_routes_to_on_demand_knowledge(self) -> None:
        frontmatter = self.skill.split("---", 2)[1]
        self.assertIn("渐进披露", frontmatter)
        self.assertIn("按需查询", frontmatter)
        self.assertNotIn("SQLite", frontmatter)

    def test_development_and_release_entrypoints_are_identical(self) -> None:
        self.assertEqual(DEV_SKILL_PATH.read_bytes(), SKILL_PATH.read_bytes())

    def test_openai_specific_interface_metadata_is_not_published(self) -> None:
        self.assertFalse((DEV_ROOT / "agents").exists())
        self.assertFalse((SKILL_ROOT / "agents").exists())

    def test_bootstrap_guard_precedes_workflow(self) -> None:
        guard = self.skill.index("## 必须遵守")
        workflow = self.skill.index("## 工作流")
        self.assertLess(guard, workflow)
        bootstrap = self.skill[guard:workflow]
        for required in (
            "当前已加载的 `SKILL.md` 所在目录",
            "<skill-root>/scripts/search_docs.py",
            "第一次知识访问",
            "一个脚本进程中的批量查询",
            "每个独立符号或意图各写一个 `--query`",
            "不要绕过脚本直接读取知识库文件",
        ):
            with self.subTest(required=required):
                self.assertIn(required, bootstrap)

    def test_normal_workflow_never_recommends_recursive_inventory(self) -> None:
        command_blocks = re.findall(r"```(?:text|powershell|bash)?\n(.*?)```", self.skill, re.S)
        commands = "\n".join(command_blocks)
        self.assertNotRegex(commands, r"(?i)Get-ChildItem\b[^\n]*-Recurse")
        self.assertNotRegex(commands, r"(?i)\bfind\s+[^\n]*(?:references|skills)")
        self.assertNotRegex(commands, r"(?i)\brg\s+--files\b")

    def test_database_is_an_internal_implementation_detail(self) -> None:
        bootstrap = self.skill[
            self.skill.index("## 必须遵守") : self.skill.index("## 工作流")
        ]
        self.assertIn("不要绕过脚本直接读取知识库文件", bootstrap)
        self.assertNotIn("SQLite", self.skill)
        self.assertNotIn("](references/index.md)", self.skill)

    def test_workflow_stays_generic_and_compact(self) -> None:
        workflow = self.skill[self.skill.index("## 工作流") : self.skill.index("## 检索")]
        for required in (
            "只有 `p!:`",
            "最小可编译切片",
            "setup_stdx.py",
            "逐文件运行 `cjfmt -f <file>`",
            "不要格式化不可修改测试",
        ):
            with self.subTest(required=required):
                self.assertIn(required, workflow)
        for scenario_patch in ("Float64.parse", "-Woff unused", "clang -Wall", "直接启动构建产物"):
            with self.subTest(scenario_patch=scenario_patch):
                self.assertNotIn(scenario_patch, workflow)
        self.assertLessEqual(len(self.skill), 5000)


if __name__ == "__main__":
    unittest.main(verbosity=2)
