#!/usr/bin/env python3
"""Focused regression tests for capability-aware example execution."""

from __future__ import annotations

import tempfile
import unittest
import sys
from pathlib import Path
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "validation"))
import test_examples as runner


class ExampleRunnerRegressionTests(unittest.TestCase):
    def test_compiler_warning_count_ignores_ansi_and_expected_failures(self) -> None:
        warning = runner.Result(
            "warning", "compile", "PASS", "example.md", 1,
            exit_code=0,
            stderr="warning\x1b[0m: first\nwarning: second\n2 warnings generated\n",
        )
        expected_failure = runner.Result(
            "negative", "compile", "PASS", "example.md", 1,
            exit_code=1,
            stderr="warning: diagnostic preceding expected error\n",
        )
        self.assertEqual(runner.compiler_warning_count(warning), 2)
        self.assertEqual(runner.compiler_warning_count(expected_failure), 0)

    def test_project_metadata_restricts_direct_launcher(self) -> None:
        invalid = runner.Block(
            Path("example.md"), 1, "toml", "",
            {"cjtest": "project", "id": "bad", "file": "cjpm.toml", "command": "build", "launcher": "direct"},
        )
        errors = runner.validate([invalid])
        self.assertEqual(len(errors), 1)
        self.assertIn("requires command=run", errors[0].reason)

    def test_direct_project_launcher_builds_then_runs_binary_without_shell(self) -> None:
        block = runner.Block(
            Path("example.md"), 1, "toml", "",
            {"command": "run", "launcher": "direct", "args": '"two words" tail'},
        )
        built = runner.CommandResult(["cjpm", "build"], 0, "", "", False, 3)
        executed = runner.CommandResult(["main"], 7, "", "expected", False, 2)
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            (root / "cjpm.toml").write_text(
                '[package]\nname = "direct_test"\nversion = "0.1.0"\n', encoding="utf-8"
            )
            executable = root / "target" / "release" / "bin" / (
                "main.exe" if runner.os.name == "nt" else "main"
            )
            executable.parent.mkdir(parents=True)
            executable.write_text("", encoding="utf-8")
            with patch.object(runner, "run_command", side_effect=[built, executed]) as call:
                actual = runner.run_project_command(root, block, 10.0)
        self.assertIs(actual, executed)
        self.assertEqual(call.call_args_list[0].args, (["cjpm", "build"], root, 10.0))
        direct_command = call.call_args_list[1].args[0]
        self.assertEqual(direct_command[1:], ["two words", "tail"])
        self.assertEqual(call.call_args_list[1].args[1:], (root, 10.0))
        self.assertIn("env", call.call_args_list[1].kwargs)

    def test_stdx_capability_runs_setup_against_materialized_project(self) -> None:
        block = runner.Block(Path("example.md"), 1, "cangjie", "", {"requires": "stdx"})
        completed = runner.CommandResult(["setup"], 0, "", "", False, 1)
        with tempfile.TemporaryDirectory() as temporary, patch.object(runner, "run_command", return_value=completed) as call:
            root = Path(temporary)
            runner.configure_project_capabilities(root, block)
        command, cwd, timeout = call.call_args.args
        self.assertEqual(command[0], runner.sys.executable)
        self.assertIn("setup_stdx.py", command[1])
        self.assertEqual(command[command.index("--project") + 1], str(root))
        self.assertEqual(cwd, root)
        self.assertEqual(timeout, 240.0)

    def test_unrelated_capability_does_not_invoke_setup(self) -> None:
        block = runner.Block(Path("example.md"), 1, "cangjie", "", {"requires": "network"})
        with tempfile.TemporaryDirectory() as temporary, patch.object(runner, "run_command") as call:
            runner.configure_project_capabilities(Path(temporary), block)
        call.assert_not_called()

    def test_native_c_capability_builds_fixed_native_source(self) -> None:
        block = runner.Block(Path("example.md"), 1, "toml", "", {"requires": "native-c"})
        completed = runner.CommandResult(["clang"], 0, "", "", False, 1)
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            source = root / "native" / "native.c"
            source.parent.mkdir(parents=True)
            source.write_text("int value(void) { return 1; }", encoding="utf-8")
            with (
                patch.object(runner.shutil, "which", return_value="clang"),
                patch.object(runner.os, "name", "posix"),
                patch.object(runner.sys, "platform", "linux"),
                patch.object(runner, "run_command", return_value=completed) as call,
            ):
                runner.configure_project_capabilities(root, block)
        command, cwd, timeout = call.call_args.args
        self.assertEqual(command[0], "clang")
        self.assertIn("-fPIC", command)
        self.assertIn("-Wall", command)
        self.assertIn("-Wextra", command)
        self.assertIn("-Werror", command)
        self.assertIn(str(source), command)
        self.assertTrue(command[-1].endswith("libnative.so"))
        self.assertEqual(cwd, root)
        self.assertEqual(timeout, 120.0)

    def test_native_c_capability_requires_conventional_source_path(self) -> None:
        block = runner.Block(Path("example.md"), 1, "toml", "", {"requires": "native-c"})
        with tempfile.TemporaryDirectory() as temporary:
            with self.assertRaisesRegex(ValueError, "native/native.c"):
                runner.configure_project_capabilities(Path(temporary), block)


if __name__ == "__main__":
    unittest.main()
