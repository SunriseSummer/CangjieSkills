#!/usr/bin/env python3
"""Compare native document routing with the unchanged Python search entry point.

Relevance labels are an independent, manually authored synthetic holdout. They
are alternatives (one useful page is a hit), not exhaustive recall judgments.
This tool never trains a model or edits aliases, weights, labels, or source docs.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import platform
import selectors
import statistics
import subprocess
import sys
import tempfile
import time
from collections import defaultdict
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
DEFAULT_DATA = ROOT / 'scripts/tests/data/router-queries.json'


def arguments() -> argparse.Namespace:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--dataset', type=Path, default=DEFAULT_DATA)
    p.add_argument('--binary', type=Path, default=ROOT / 'build/doc_router/cj-doc-router')
    p.add_argument('--index', type=Path, default=ROOT / 'build/doc_router/router.idx')
    p.add_argument('--top-k', type=int, default=5)
    p.add_argument('--timing-repeats', type=int, default=3)
    p.add_argument('--skip-latency', action='store_true', help='Skip separate cold/warm-process measurements')
    p.add_argument('--compare-learned', '--ablation', dest='compare_learned', action='store_true', help='Compare the frozen experimental --learned-ranker with the recommended default BM25 ranking')
    p.add_argument('--output', type=Path, default=ROOT / 'reports/router-evaluation.json')
    a = p.parse_args()
    if not 1 <= a.top_k <= 30:
        p.error('--top-k must be 1..30')
    if not 1 <= a.timing_repeats <= 30:
        p.error('--timing-repeats must be 1..30')
    return a


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_labels(path: Path) -> tuple[dict, list[dict]]:
    payload = json.loads(path.read_text(encoding='utf-8'))
    labels = payload['queries']
    if not labels or len({r['id'] for r in labels}) != len(labels):
        raise ValueError('dataset IDs must be unique and nonempty')
    if len({r['query'] for r in labels}) != len(labels):
        raise ValueError('dataset queries must be unique')
    for row in labels:
        if not row['query'].strip():
            raise ValueError('relevance dataset must not include empty queries; test CLI validation separately')
        if row['category'] == 'negative' and row['relevant']:
            raise ValueError(f"negative query has positive labels: {row['id']}")
        if row['category'] != 'negative' and not row['relevant']:
            raise ValueError(f"positive query lacks labels: {row['id']}")
        for target in row['relevant']:
            if not target.startswith('references/') or not (ROOT / target).is_file():
                raise ValueError(f'invalid relevance path: {target}')
    return payload, labels


def measured(command: list[str]) -> tuple[object, dict]:
    """Measure one fresh child; wait4 returns that child's own CPU/RSS on Unix."""
    usage = {}
    with tempfile.TemporaryDirectory(prefix='cj-router-eval-') as temp:
        stdout_path, stderr_path = Path(temp) / 'stdout.json', Path(temp) / 'stderr.txt'
        started = time.perf_counter()
        with stdout_path.open('w', encoding='utf-8') as stdout, stderr_path.open('w', encoding='utf-8') as stderr:
            process = subprocess.Popen(command, cwd=ROOT, stdout=stdout, stderr=stderr)
            if hasattr(os, 'wait4'):
                deadline = started + 180
                while True:
                    waited, status, stats = os.wait4(process.pid, os.WNOHANG)
                    if waited:
                        process.returncode = os.waitstatus_to_exitcode(status)
                        usage = {
                            'max_rss_kib': stats.ru_maxrss,
                            'user_seconds': round(stats.ru_utime, 6),
                            'system_seconds': round(stats.ru_stime, 6),
                        }
                        break
                    if time.perf_counter() >= deadline:
                        process.kill()
                        _, status, _ = os.wait4(process.pid, 0)
                        process.returncode = os.waitstatus_to_exitcode(status)
                        raise RuntimeError(f'command timed out after 180 seconds: {command[0]}')
                    time.sleep(.001)
            else:
                process.wait(timeout=180)
        usage['wall_ms'] = round((time.perf_counter() - started) * 1000, 3)
        if process.returncode:
            raise RuntimeError(f'command failed ({process.returncode}): {command[0]}\n{stderr_path.read_text(encoding="utf-8")[-3000:]}')
        return json.loads(stdout_path.read_text(encoding='utf-8')), usage


def baseline_paths(payload: object, labels: list[dict]) -> list[list[str]]:
    groups = payload['queries'] if isinstance(payload, dict) else [{'query': labels[0]['query'], 'results': payload}]
    # Batch output intentionally omits repeated doc payloads, retaining only ID.
    by_id = {row['id']: row['path'] for group in groups for row in group['results'] if 'path' in row}
    output = []
    if len(groups) != len(labels):
        raise ValueError('baseline returned a different query count')
    for group, label in zip(groups, labels):
        if group['query'] != label['query']:
            raise ValueError('baseline reordered queries')
        paths = []
        for result in group['results']:
            path = result.get('path') or by_id.get(result['id'])
            if path is None:
                raise ValueError(f"baseline ID without path: {result['id']}")
            paths.append(path if path.startswith('references/') else 'references/' + path)
        output.append(paths)
    return output


def native_paths(payload: dict, labels: list[dict]) -> list[list[str]]:
    groups = payload['queries']
    if len(groups) != len(labels):
        raise ValueError('native returned a different query count')
    output = []
    for group, label in zip(groups, labels):
        if group['query'] != label['query']:
            raise ValueError('native reordered queries')
        output.append(group['paths'])
    return output


def score(labels: list[dict], output: list[list[str]], k: int) -> dict:
    per_category = defaultdict(list)
    details = []
    invalid_paths = []
    for label, paths in zip(labels, output):
        if len(set(paths)) != len(paths):
            raise ValueError(f"duplicate result paths: {label['id']}")
        for path in paths:
            if not path.startswith('references/') or not (ROOT / path).is_file():
                invalid_paths.append({'id': label['id'], 'path': path})
        relevant = set(label['relevant'])
        ranks = [i for i, path in enumerate(paths[:k], 1) if path in relevant]
        rank = ranks[0] if ranks else None
        row = {
            'id': label['id'], 'category': label['category'], 'query': label['query'],
            'first_relevant_rank': rank, 'paths': paths,
            'relevant': label['relevant'], 'abstained': not paths,
        }
        details.append(row)
        per_category[label['category']].append(row)
    positives = [r for r in details if r['category'] != 'negative']
    negatives = [r for r in details if r['category'] == 'negative']

    def aggregate(rows: list[dict]) -> dict:
        if not rows:
            return {'queries': 0}
        return {
            'queries': len(rows),
            'hit_at_1': round(sum(r['first_relevant_rank'] == 1 for r in rows) / len(rows), 6),
            f'hit_at_{k}': round(sum(r['first_relevant_rank'] is not None for r in rows) / len(rows), 6),
            f'mrr_at_{k}': round(sum(1 / r['first_relevant_rank'] if r['first_relevant_rank'] else 0 for r in rows) / len(rows), 6),
            'abstentions': sum(r['abstained'] for r in rows),
        }

    return {
        'positive_queries': aggregate(positives),
        'negative_queries': {
            'queries': len(negatives),
            'correct_abstentions': sum(r['abstained'] for r in negatives),
            'abstention_accuracy': round(sum(r['abstained'] for r in negatives) / len(negatives), 6) if negatives else None,
        },
        'categories': {cat: aggregate(rows) for cat, rows in per_category.items() if cat != 'negative'},
        'invalid_result_paths': invalid_paths,
        'details': details,
    }


def percentile(values: list[float], fraction: float) -> float:
    ordered = sorted(values)
    index = max(0, min(len(ordered) - 1, int(len(ordered) * fraction + 0.999999) - 1))
    return ordered[index]


def latency(a: argparse.Namespace, labels: list[dict]) -> dict:
    """Cold includes process start/index load; warm follows one completed request."""
    positive = [r for r in labels if r['category'] != 'negative']
    cold_native, cold_python = [], []
    sample = positive[0]
    for _ in range(a.timing_repeats):
        for name, command, target in [
            ('native', [str(a.binary), '--index', str(a.index), '--query', sample['query'], '--top-k', str(a.top_k)], cold_native),
            ('python', [sys.executable, str(ROOT / 'scripts/search_docs.py'), '--query', sample['query'], '--max-results', str(a.top_k), '--json'], cold_python),
        ]:
            _, usage = measured(command)
            target.append(usage)
    process = subprocess.Popen([str(a.binary), '--index', str(a.index), '--stdin', '--top-k', str(a.top_k)], cwd=ROOT, text=True, encoding='utf-8', stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, bufsize=1)
    samples = []
    ready = selectors.DefaultSelector()
    ready.register(process.stdout, selectors.EVENT_READ)
    try:
        for index, row in enumerate([positive[0], *positive]):
            started = time.perf_counter()
            process.stdin.write(row['query'] + '\n')
            process.stdin.flush()
            if not ready.select(timeout=30):
                raise RuntimeError('native stdin request timed out after 30 seconds')
            response = process.stdout.readline()
            elapsed = (time.perf_counter() - started) * 1000
            if not response:
                raise RuntimeError('native stdin process closed unexpectedly')
            native_paths(json.loads(response), [row])
            if index:
                samples.append(elapsed)
        process.stdin.close()
        process.wait(timeout=10)
        stderr = process.stderr.read()
        if process.returncode:
            raise RuntimeError(f'native stdin process failed: {stderr}')
    finally:
        ready.close()
        if process.poll() is None:
            process.kill()
            process.wait()
    return {
        'cold_single_query': {
            'query_id': sample['id'], 'includes': 'process startup + index/database load + query + JSON output',
            'native_samples': cold_native, 'python_samples': cold_python,
            'native_median_ms': round(statistics.median(r['wall_ms'] for r in cold_native), 3),
            'python_median_ms': round(statistics.median(r['wall_ms'] for r in cold_python), 3),
        },
        'warm_native_single_query': {
            'count': len(samples), 'warmup_requests': 1,
            'includes': 'one query after index load; Python client pipe/JSON overhead included; excludes initial request',
            'median_ms': round(statistics.median(samples), 3),
            'p95_ms': round(percentile(samples, .95), 3),
            'max_ms': round(max(samples), 3),
        },
    }


def main() -> int:
    a = arguments()
    a.binary = a.binary.resolve()
    a.index = a.index.resolve()
    a.dataset = a.dataset.resolve()
    data, labels = load_labels(a.dataset)
    native_command = [str(a.binary), '--index', str(a.index), '--top-k', str(a.top_k)]
    baseline_command = [sys.executable, str(ROOT / 'scripts/search_docs.py'), '--max-results', str(a.top_k), '--json']
    for row in labels:
        native_command.extend(['--query', row['query']])
        baseline_command.extend(['--query', row['query']])
    native_samples, python_samples = [], []
    native_output = baseline_output = None
    for _ in range(a.timing_repeats):
        raw, usage = measured(native_command)
        paths = native_paths(raw, labels)
        if native_output is not None and paths != native_output:
            raise ValueError('native results differ between repeated runs')
        native_output = paths
        native_samples.append(usage)
        raw, usage = measured(baseline_command)
        paths = baseline_paths(raw, labels)
        if baseline_output is not None and paths != baseline_output:
            raise ValueError('baseline results differ between repeated runs')
        baseline_output = paths
        python_samples.append(usage)
    native_result = score(labels, native_output, a.top_k)
    baseline_result = score(labels, baseline_output, a.top_k)
    report = {
        'schema': 1,
        'created_at_utc': datetime.now(timezone.utc).isoformat(),
        'methodology': {
            'dataset': str(a.dataset.relative_to(ROOT)) if a.dataset.is_relative_to(ROOT) else str(a.dataset),
            'dataset_sha256': digest(a.dataset), 'description': data.get('purpose'),
            'label_semantics': 'Any listed page is useful; labels are alternatives, not exhaustive set recall.',
            'scope': 'Independent manually authored synthetic query-holdout, not document-holdout or real user traffic. No training is performed here.',
            'output_contracts': 'Native returns compact paths; unchanged Python emits signatures/snippets and metadata. Timings compare end-to-end CLIs, not isolated scorers.',
            'memory': 'Per-child peak RSS from os.wait4 on Linux; no cumulative RUSAGE_CHILDREN maximum.',
            'top_k': a.top_k, 'negative_denominator_separate': True,
            'native_ranking': 'Recommended default: native BM25 with structural/alias recall; --bm25-only is an explicit alias.',
            'learned_ranking': 'Frozen experimental model, enabled only by --learned-ranker. Independent holdout favored BM25; used for algorithm selection, never weight/alias tuning.',
            'timing': 'Cold means a fresh process with index/database load, not a flushed OS filesystem cache. Batch latency is not per-query warm latency. CPU/RSS samples are per child.',
        },
        'environment': {'platform': platform.platform(), 'machine': platform.machine(), 'logical_cpus': os.cpu_count(), 'python': platform.python_version(), 'cpu_model': next((line.split(':',1)[1].strip() for line in Path('/proc/cpuinfo').read_text().splitlines() if line.startswith('model name')), '') if Path('/proc/cpuinfo').is_file() else platform.processor()},
        'artifacts': {
            'native_index_sha256': digest(a.index), 'native_binary_sha256': digest(a.binary),
            'baseline_entrypoint_sha256': digest(ROOT / 'scripts/search_docs.py'),
        },
        'native': native_result, 'python_baseline': baseline_result,
        'cold_batch': {
            'queries_per_process': len(labels),
            'native_samples': native_samples, 'python_samples': python_samples,
            'native_median_ms': round(statistics.median(r['wall_ms'] for r in native_samples), 3),
            'python_median_ms': round(statistics.median(r['wall_ms'] for r in python_samples), 3),
        },
    }
    if a.compare_learned:
        raw, usage = measured([*native_command, '--learned-ranker'])
        report['experimental_learned'] = score(labels, native_paths(raw, labels), a.top_k)
        report['experimental_learned']['cold_batch_usage'] = usage
    if not a.skip_latency:
        report['latency'] = latency(a, labels)
    a.output.parent.mkdir(parents=True, exist_ok=True)
    a.output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    summary = {key: {part: report[key][part] for part in ('positive_queries', 'negative_queries', 'categories')} for key in ('native', 'python_baseline')}
    if 'experimental_learned' in report:
        summary['experimental_learned'] = {part: report['experimental_learned'][part] for part in ('positive_queries', 'negative_queries', 'categories')}
    summary['cold_batch'] = report['cold_batch']
    if 'latency' in report:
        summary['latency'] = report['latency']
    summary['report'] = str(a.output)
    print(json.dumps(summary, ensure_ascii=False, indent=2))
    if native_result['invalid_result_paths'] or baseline_result['invalid_result_paths']:
        return 1
    return 0


if __name__ == '__main__':
    try:
        raise SystemExit(main())
    except (OSError, ValueError, RuntimeError, subprocess.SubprocessError) as exc:
        print(f'error: {exc}', file=sys.stderr)
        raise SystemExit(2)
