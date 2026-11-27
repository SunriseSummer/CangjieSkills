"""Integration checks for the optional native router (requires a C++17 compiler).

These are protocol/data-integrity regressions. Retrieval quality is measured by
scripts/evaluation/evaluate_router.py using a separate, frozen relevance set.
"""
from __future__ import annotations

import json
import shutil
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
BUILDER = ROOT / 'scripts/maintenance/build_router.py'


@unittest.skipUnless(shutil.which('g++') or shutil.which('clang++'), 'native router requires a C++17 compiler')
class NativeRouterTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.temporary = tempfile.TemporaryDirectory(prefix='cj-native-router-test-')
        cls.output = Path(cls.temporary.name)
        built = subprocess.run([sys.executable, str(BUILDER), '--output-dir', str(cls.output)], cwd=ROOT, text=True, encoding='utf-8', capture_output=True, timeout=180)
        if built.returncode:
            cls.temporary.cleanup()
            raise RuntimeError(f'native test build failed:\n{built.stdout}\n{built.stderr}')
        cls.binary = cls.output / 'cj-doc-router'
        cls.index = cls.output / 'router.idx'
        records = []
        for manifest in (ROOT / 'references').rglob('*manifest*.json'):
            records.extend(json.loads(manifest.read_text(encoding='utf-8')))
        cls.records = {'references/' + row['path']: row for row in records}

    @classmethod
    def tearDownClass(cls) -> None:
        cls.temporary.cleanup()

    def run_router(self, *args: str, index: Path | None = None, stdin: str | None = None) -> subprocess.CompletedProcess:
        return subprocess.run([str(self.binary), '--index', str(index or self.index), *args], input=stdin, text=True, encoding='utf-8', capture_output=True, timeout=30)

    def query(self, text: str, *args: str) -> dict:
        result = self.run_router('--query', text, *args)
        self.assertEqual(result.returncode, 0, result.stderr)
        group = json.loads(result.stdout)['queries'][0]
        self.assertEqual(group['query'], text)
        return group

    def test_exact_receiver_member_has_existing_contract(self) -> None:
        expected = 'references/api/std/collection/classes/arraylist/reverse.md'
        group = self.query('ArrayList.reverse', '--top-k', '5')
        self.assertIn(expected, group['paths'])
        self.assertEqual(len(group['paths']), len(set(group['paths'])))
        for path in group['paths']:
            self.assertTrue(path.startswith('references/'), path)
            self.assertTrue((ROOT / path).is_file(), path)

    def test_batch_preserves_query_order_and_is_deterministic(self) -> None:
        command = ('--query', 'HashMap get', '--query', '闭包', '--query', 'SHA256 reset', '--top-k', '3')
        first = self.run_router(*command)
        second = self.run_router(*command)
        self.assertEqual(first.returncode, 0, first.stderr)
        self.assertEqual(second.returncode, 0, second.stderr)
        a, b = json.loads(first.stdout), json.loads(second.stdout)
        self.assertEqual(a, b)
        self.assertEqual([r['query'] for r in a['queries']], ['HashMap get', '闭包', 'SHA256 reset'])
        self.assertTrue(all(len(r['paths']) <= 3 for r in a['queries']))

    def test_unicode_question_produces_real_document_paths(self) -> None:
        group = self.query('怎样使用闭包捕获变量', '--top-k', '5')
        self.assertTrue(group['paths'])
        for path in group['paths']:
            self.assertTrue((ROOT / path).is_file(), path)
        self.assertTrue(any('闭包' in path or '/functions/' in path for path in group['paths']))

    def test_unknown_and_empty_queries_abstain(self) -> None:
        for text in ('', '   ', 'zqxwunknownsymbol712935'):
            with self.subTest(query=text):
                group = self.query(text)
                self.assertEqual(group['paths'], [])
                self.assertEqual(group['status'], 'no_match')

    def test_domain_filter_is_respected(self) -> None:
        for domain in ('language', 'std', 'stdx', 'tools', 'examples'):
            with self.subTest(domain=domain):
                group = self.query('String JSON 文件 read UTF-8', '--domain', domain, '--top-k', '5')
                for path in group['paths']:
                    if domain == 'examples':
                        self.assertTrue(path.startswith('references/examples/'), (domain, path))
                    else:
                        record = self.records[path]
                        declared = record.get('domain')
                        inferred = next((name for prefix, name in [('references/language/', 'language'), ('references/tools/', 'tools'), ('references/api/std/', 'std'), ('references/api/stdx/', 'stdx')] if path.startswith(prefix)), 'examples' if path.startswith('references/examples/') else 'all')
                        actual = declared if declared and declared != 'all' else inferred
                        self.assertEqual(actual, domain, (domain, path))

    def test_invalid_options_are_errors(self) -> None:
        for options in [('--top-k', '0'), ('--top-k', '-1'), ('--top-k', 'abc'), ('--domain', 'invalid-domain')]:
            with self.subTest(options=options):
                result = self.run_router('--query', 'ArrayList reverse', *options)
                self.assertNotEqual(result.returncode, 0)
                self.assertTrue(result.stderr.strip())

    def test_explain_retains_identical_ranking(self) -> None:
        compact = self.query('String.toAsciiLower', '--top-k', '3')
        explained = self.query('String.toAsciiLower', '--top-k', '3', '--explain')
        self.assertEqual(compact['paths'], explained['paths'])
        self.assertEqual([r['path'] for r in explained['results']], explained['paths'])
        self.assertTrue(all('score' in row for row in explained['results']))

    def test_stdin_supports_repeated_hot_queries(self) -> None:
        lines = ['ArrayList.reverse', '闭包', 'String.toAsciiLower']
        result = self.run_router('--stdin', '--top-k', '2', stdin='\n'.join(lines) + '\n')
        self.assertEqual(result.returncode, 0, result.stderr)
        output = [json.loads(line)['queries'][0] for line in result.stdout.splitlines()]
        self.assertEqual([r['query'] for r in output], lines)
        self.assertTrue(all(len(r['paths']) <= 2 for r in output))

    def test_default_ranker_and_explicit_flags(self) -> None:
        default = self.query('ArrayList.reverse', '--top-k', '3')
        lexical = self.query('ArrayList.reverse', '--top-k', '3', '--bm25-only')
        learned = self.query('ArrayList.reverse', '--top-k', '3', '--learned-ranker')
        self.assertEqual(default['paths'], lexical['paths'])
        self.assertTrue(learned['paths'])
        result = self.run_router('--query', 'ArrayList.reverse', '--bm25-only', '--learned-ranker')
        self.assertNotEqual(result.returncode, 0)

    def test_json_escapes_query_control_characters(self) -> None:
        text = 'String "quote"\tnewline\n反斜杠\\'
        result = self.run_router('--query', text, '--explain')
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(json.loads(result.stdout)['queries'][0]['query'], text)

    def test_corrupt_truncated_and_missing_indexes_fail_cleanly(self) -> None:
        raw = self.index.read_bytes()
        for index, broken in enumerate((b'', raw[:12], b'INVALID!' + raw[8:], raw[:len(raw) // 2])):
            path = self.output / f'corrupt-{index}.idx'
            path.write_bytes(broken)
            with self.subTest(case=index):
                result = self.run_router('--query', 'ArrayList', index=path)
                self.assertNotEqual(result.returncode, 0)
                self.assertTrue(result.stderr.strip())
        result = self.run_router('--query', 'ArrayList', index=self.output / 'missing.idx')
        self.assertNotEqual(result.returncode, 0)

    def test_build_is_reproducible_and_check_rejects_stale_index(self) -> None:
        command = [sys.executable, str(BUILDER), '--output-dir', str(self.output), '--check']
        result = subprocess.run(command, cwd=ROOT, text=True, capture_output=True, timeout=60)
        self.assertEqual(result.returncode, 0, result.stderr)
        with tempfile.TemporaryDirectory(prefix='cj-router-rebuild-') as temporary:
            result = subprocess.run([sys.executable, str(BUILDER), '--output-dir', temporary, '--no-compile'], cwd=ROOT, text=True, capture_output=True, timeout=60)
            self.assertEqual(result.returncode, 0, result.stderr)
            rebuilt = Path(temporary) / 'router.idx'
            self.assertEqual(self.index.read_bytes(), rebuilt.read_bytes())
            rebuilt.write_bytes(rebuilt.read_bytes()[:-1])
            result = subprocess.run([sys.executable, str(BUILDER), '--output-dir', temporary, '--check'], cwd=ROOT, text=True, capture_output=True, timeout=60)
            self.assertNotEqual(result.returncode, 0)


if __name__ == '__main__':
    unittest.main()
