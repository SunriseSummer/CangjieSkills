"""V2 compatibility and benchmark protocol tests, independent of holdout scores."""
from __future__ import annotations

import json
from pathlib import Path
import shutil
import struct
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / 'scripts/evaluation'))
import evaluate_router_v2 as evaluation


def legacy_fixture() -> bytes:
    """Write the published v1 wire contract without importing the v2 builder."""
    output = bytearray(b'CJROUT1\0')
    def number(value: int) -> None:
        output.extend(struct.pack('<I', value))
    def floating(value: float) -> None:
        output.extend(struct.pack('<f', value))
    def string(value: str) -> None:
        raw = value.encode('utf-8')
        number(len(raw))
        output.extend(raw)
    number(1)
    string('a'*64)
    records = [
        ('std.collection.class.arraylist.reverse', 'references/api/std/collection/classes/arraylist/reverse.md',
         'ArrayList.reverse', 'std', 'api-member', 'arraylist', 'reverse'),
        ('std.collection.class.hashmap.get', 'references/api/std/collection/classes/hashmap/get.md',
         'HashMap.get', 'std', 'api-member', 'hashmap', 'get'),
    ]
    number(len(records))
    for row in records:
        for value in row:
            string(value)
        number(10)
    number(4)
    for token, document in [('arraylist', 0), ('get', 1), ('hashmap', 1), ('reverse', 0)]:
        string(token)
        number(1)
        number(document)
        floating(5.0)
    number(0)  # Alias count.
    number(12)
    for weight in (1, 3, 2, 3, 2, 1, 8, .3, -2, 4, 1, 1):
        floating(weight)
    return bytes(output)


class EvaluationMetricTests(unittest.TestCase):
    @unittest.skipUnless(sys.platform.startswith('linux'), 'Linux wait4 RSS unit contract')
    def test_memory_probe_avoids_large_parent_rss_floor(self) -> None:
        padding = bytearray(48*1024*1024)
        payload, usage = evaluation.measured([sys.executable, '-c', 'import json; print(json.dumps(dict(ok=True)))'])
        self.assertEqual(payload, {'ok': True})
        self.assertLess(usage['max_rss_kib'], len(padding)//1024)

    def test_positive_and_negative_denominators_are_separate(self) -> None:
        a = 'references/api/std/collection/classes/arraylist/reverse.md'
        b = 'references/api/std/collection/classes/hashmap/get.md'
        labels = [
            {'id': 'p1', 'query': 'first', 'category': 'exact', 'relevant': [a]},
            {'id': 'p2', 'query': 'second', 'category': 'natural', 'relevant': [b]},
            {'id': 'n1', 'query': 'third', 'category': 'negative', 'negative_kind': 'out_of_domain', 'relevant': []},
            {'id': 'n2', 'query': 'fourth', 'category': 'negative', 'negative_kind': 'unsupported', 'relevant': []},
        ]
        result = evaluation.scored(labels, [[b, a], [], [], [a]], 5)
        self.assertEqual(result['positive_queries']['queries'], 2)
        self.assertEqual(result['positive_queries']['hit_at_1'], 0)
        self.assertEqual(result['positive_queries']['hit_at_5'], .5)
        self.assertEqual(result['positive_queries']['mrr_at_5'], .25)
        self.assertEqual(result['positive_queries']['abstentions'], 1)
        self.assertEqual(result['negative_queries']['false_positives'], 1)
        self.assertEqual(result['negative_queries']['abstention_accuracy'], .5)
        self.assertEqual(result['negative_queries']['subgroups']['unsupported']['false_positives'], 1)

    def test_only_dev_does_not_require_new_holdout(self) -> None:
        # CLI construction must not implicitly inspect the hidden dataset.
        args = type('Args', (), {
            'binary': ROOT/'build/doc_router/cj-doc-router', 'index': ROOT/'build/doc_router/router.idx',
            'v1_binary': Path('/does-not-exist/router'), 'v1_index': Path('/does-not-exist/index'),
            'semantic_index': None, 'top_k': 5, 'include_tree': False, 'only': 'native_v1',
        })()
        specs = evaluation.variant_specs(args)
        self.assertEqual(list(specs), ['native_v1'])
        self.assertIn('v1', specs['native_v1']['command'])

    def test_published_holdout_paths_and_query_ids_are_valid(self) -> None:
        path = ROOT/'scripts/tests/data/router-queries-v2.json'
        if not path.exists():
            self.skipTest('new holdout is withheld until candidate freeze')
        _, labels = evaluation.load_labels(path)
        old = {row['query'] for row in json.loads((ROOT/'scripts/tests/data/router-queries.json').read_text())['queries']}
        self.assertGreaterEqual(sum(row['category'] == 'negative' for row in labels), 20)
        self.assertFalse(old.intersection(row['query'] for row in labels))


@unittest.skipUnless(shutil.which('g++') or shutil.which('clang++'), 'C++17 compiler required')
class RouterV2CompatibilityTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.temp = tempfile.TemporaryDirectory(prefix='cj-router-v2-protocol-')
        cls.work = Path(cls.temp.name)
        cls.binary = cls.work/'cj-doc-router'
        compiler = shutil.which('g++') or shutil.which('clang++')
        result = subprocess.run([compiler, '-std=c++17', '-O1', str(ROOT/'native/doc_router/main.cpp'), '-o', str(cls.binary)],
                                cwd=ROOT, capture_output=True, text=True, timeout=120)
        if result.returncode:
            cls.temp.cleanup()
            raise RuntimeError(result.stderr)
        cls.index = cls.work/'legacy.idx'
        cls.index.write_bytes(legacy_fixture())

    @classmethod
    def tearDownClass(cls) -> None:
        cls.temp.cleanup()

    def run_router(self, *options: str, index: Path | None = None) -> subprocess.CompletedProcess:
        return subprocess.run([str(self.binary), '--index', str(index or self.index), *options], cwd=ROOT,
                              capture_output=True, text=True, encoding='utf-8', timeout=30)

    def test_reads_legacy_format_without_new_metadata(self) -> None:
        result = self.run_router('--query', 'ArrayList.reverse', '--strategy', 'v1')
        self.assertEqual(result.returncode, 0, result.stderr)
        group = json.loads(result.stdout)['queries'][0]
        self.assertEqual(group['paths'], ['references/api/std/collection/classes/arraylist/reverse.md'])

    def test_legacy_aliases_and_conflicting_strategies(self) -> None:
        previous = self.run_router('--query', 'HashMap.get', '--strategy', 'v1')
        alias = self.run_router('--query', 'HashMap.get', '--bm25-only')
        self.assertEqual(previous.returncode, 0, previous.stderr)
        self.assertEqual(json.loads(previous.stdout)['queries'], json.loads(alias.stdout)['queries'])
        for options in [('--strategy', 'hybrid', '--bm25-only'), ('--learned-ranker', '--strategy', 'hybrid'), ('--strategy', 'unknown')]:
            result = self.run_router('--query', 'HashMap.get', *options)
            self.assertNotEqual(result.returncode, 0, options)

    def test_truncated_v2_extension_is_rejected(self) -> None:
        base = bytearray(legacy_fixture())
        base[8:12] = struct.pack('<I', 2)
        for index, suffix in enumerate((b'', struct.pack('<I', 2), struct.pack('<I', 0xFFFFFFFF))):
            path = self.work/f'bad-extension-{index}.idx'
            path.write_bytes(base+suffix)
            result = self.run_router('--query', 'ArrayList', index=path)
            self.assertNotEqual(result.returncode, 0)
            self.assertTrue(result.stderr.strip())

    def test_v1_compatibility_outputs_equal_archived_binary_on_old_queries(self) -> None:
        archived = ROOT/'build/doc_router-v1/cj-doc-router'
        index = ROOT/'build/doc_router-v1/router.idx'
        if not archived.exists() or not index.exists():
            self.skipTest('archived first-round binary unavailable; legacy wire-format fixture remains tested')
        queries = json.loads((ROOT/'scripts/tests/data/router-queries.json').read_text())['queries']
        options = ['--index', str(index), '--top-k', '5']
        for row in queries:
            options.extend(['--query', row['query']])
        prior = subprocess.run([str(archived), *options], cwd=ROOT, capture_output=True, text=True, encoding='utf-8', timeout=30)
        current = subprocess.run([str(self.binary), *options, '--strategy', 'v1'], cwd=ROOT, capture_output=True, text=True, encoding='utf-8', timeout=30)
        self.assertEqual(prior.returncode, 0, prior.stderr)
        self.assertEqual(current.returncode, 0, current.stderr)
        a = json.loads(prior.stdout)['queries']
        b = json.loads(current.stdout)['queries']
        self.assertEqual([(r['query'], r['paths'], r['status']) for r in a], [(r['query'], r['paths'], r['status']) for r in b])


if __name__ == '__main__':
    unittest.main()
