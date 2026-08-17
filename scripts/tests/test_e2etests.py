"""Integrity checks for the versioned end-to-end AI Coding corpus."""

from __future__ import annotations

from pathlib import Path
import hashlib
import subprocess
import sys
import unittest


PROJECT_ROOT = Path(__file__).resolve().parents[2]
E2E_ROOT = PROJECT_ROOT / "e2etests"


class EndToEndCorpusTests(unittest.TestCase):
    def test_corpus_integrity(self) -> None:
        result = subprocess.run(
            [sys.executable, str(E2E_ROOT / "validate.py")],
            cwd=PROJECT_ROOT,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
            encoding="utf-8",
            check=False,
        )
        self.assertEqual(result.returncode, 0, result.stdout)
        self.assertIn("PASS tasks=62", result.stdout)

    def test_repository_task_mirror_when_available(self) -> None:
        source = PROJECT_ROOT.parents[1] / ".task"
        if not source.is_dir():
            self.skipTest("standalone project checkout has no repository-root .task")

        def inventory(root: Path) -> dict[str, str]:
            return {
                path.relative_to(root).as_posix(): hashlib.sha256(path.read_bytes()).hexdigest()
                for path in root.rglob("*")
                if path.is_file()
            }

        self.assertEqual(inventory(source), inventory(E2E_ROOT))


if __name__ == "__main__":
    unittest.main()
