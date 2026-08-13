#!/usr/bin/env python3
"""Focused tests for capability routing in the executable-example harness."""

from __future__ import annotations

import unittest
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "validation"))
import test_examples


def block(language: str, content: str, **attrs: str) -> test_examples.Block:
    return test_examples.Block(Path("example.md"), 1, language, content, attrs)


class ExampleHarnessTests(unittest.TestCase):
    def test_single_file_stdx_import_is_inferred_and_permission_gated(self) -> None:
        example = block(
            "cangjie", "package demo\nimport stdx.encoding.json.*\nmain(): Unit {}",
            cjtest="run", id="demo",
        )
        self.assertEqual(test_examples.inferred_requirements(example), {"stdx"})
        self.assertEqual(
            test_examples.environment_skip(example, set()),
            "capability not allowed: stdx",
        )
        self.assertEqual(test_examples.environment_skip(example, {"stdx"}), "")

    def test_multi_file_project_infers_stdx_from_cangjie_file(self) -> None:
        project = block("toml", "[package]\nname='demo'", cjtest="project", id="demo")
        source = block("cangjie", "import stdx.crypto.digest.*", cjtest="file", project="demo")
        self.assertEqual(test_examples.inferred_requirements(project, [source]), {"stdx"})

    def test_standard_library_import_does_not_require_stdx_setup(self) -> None:
        example = block("cangjie", "import std.collection.*", cjtest="run", id="demo")
        self.assertEqual(test_examples.inferred_requirements(example), set())


if __name__ == "__main__":
    unittest.main()
