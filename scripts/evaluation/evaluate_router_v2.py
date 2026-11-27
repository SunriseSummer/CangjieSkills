#!/usr/bin/env python3
"""Compare frozen CPU retrieval candidates on development and a new query holdout.

This evaluator never trains, changes retrieval rules, or downloads model assets.
The first-round dataset is explicitly development/regression data. The second
round is independently agent-authored and audited synthetic query holdout, not
human-annotated traffic or document-holdout evaluation.
"""
from __future__ import annotations

import argparse
import json
import os
from pathlib import Path
import platform
import selectors
import statistics
import subprocess
import sys
import tempfile
import time
from datetime import datetime, timezone

sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(Path(__file__).resolve().parent))
from evaluate_router import (baseline_paths, digest, load_labels,
                             native_paths, percentile, score)


# Linux preserves a child's initial pre-exec RSS high-water mark. A long-lived
# evaluator with parsed labels/results can therefore inflate a tiny native
# child's wait4 peak. Launch from a fresh, minimal stdlib helper instead. Only
# the target's own timer/CPU/RSS is returned; helper startup is excluded.
PROBE = r'''
import json,os,subprocess,sys,time
command=json.loads(sys.argv[1])
stdout_path,stderr_path,usage_path=sys.argv[2:]
usage={}
started=time.perf_counter()
with open(stdout_path,'w',encoding='utf-8') as stdout, open(stderr_path,'w',encoding='utf-8') as stderr:
    process=subprocess.Popen(command,stdout=stdout,stderr=stderr)
    if hasattr(os,'wait4'):
        deadline=started+180
        while True:
            waited,status,stats=os.wait4(process.pid,os.WNOHANG)
            if waited:
                process.returncode=os.waitstatus_to_exitcode(status)
                usage={'max_rss_kib':stats.ru_maxrss,'user_seconds':round(stats.ru_utime,6),'system_seconds':round(stats.ru_stime,6)}
                break
            if time.perf_counter()>=deadline:
                process.kill()
                _,status,_=os.wait4(process.pid,0)
                process.returncode=os.waitstatus_to_exitcode(status)
                raise RuntimeError('target timed out after 180 seconds')
            time.sleep(.001)
    else:
        process.wait(timeout=180)
usage['wall_ms']=round((time.perf_counter()-started)*1000,3)
usage['returncode']=process.returncode
with open(usage_path,'w',encoding='utf-8') as stream:
    json.dump(usage,stream)
'''


def measured(command: list[str]) -> tuple[object, dict]:
    with tempfile.TemporaryDirectory(prefix='cj-router-isolated-probe-') as directory:
        stdout, stderr, stats = [Path(directory)/name for name in ('stdout.json', 'stderr.txt', 'usage.json')]
        helper = subprocess.run([sys.executable, '-c', PROBE, json.dumps(command), str(stdout), str(stderr), str(stats)],
                                cwd=ROOT, capture_output=True, text=True, timeout=190)
        if helper.returncode:
            raise RuntimeError('measurement helper failed: '+helper.stderr[-2000:])
        usage = json.loads(stats.read_text())
        if usage.pop('returncode'):
            raise RuntimeError('target failed: '+stderr.read_text(encoding='utf-8')[-3000:])
        return json.loads(stdout.read_text(encoding='utf-8')), usage


def arguments() -> argparse.Namespace:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--dataset', type=Path, default=ROOT / 'scripts/tests/data/router-queries-v2.json')
    p.add_argument('--dev-dataset', type=Path, default=ROOT / 'scripts/tests/data/router-queries.json')
    p.add_argument('--binary', type=Path, default=ROOT / 'build/doc_router/cj-doc-router')
    p.add_argument('--index', type=Path, default=ROOT / 'build/doc_router/router.idx')
    p.add_argument('--v1-binary', type=Path, default=ROOT / 'build/doc_router-v1/cj-doc-router')
    p.add_argument('--v1-index', type=Path, default=ROOT / 'build/doc_router-v1/router.idx')
    p.add_argument('--semantic-index', type=Path, help='Include an already built optional CPU semantic index')
    p.add_argument('--include-ungated-dense', action='store_true', help='Add fixed dense --min-similarity 0 diagnostic, separating ranking from refusal')
    p.add_argument('--include-tree', action='store_true', help='Include native --strategy tree')
    p.add_argument('--only-dev', action='store_true', help='Use old development queries without reading the new holdout')
    p.add_argument('--only', help='Comma-separated variant names, for diagnostic runs')
    p.add_argument('--top-k', type=int, default=5)
    p.add_argument('--timing-repeats', type=int, default=3)
    p.add_argument('--skip-latency', action='store_true')
    p.add_argument('--output', type=Path, default=ROOT / 'reports/router-evaluation-v2.json')
    p.add_argument('--refresh-memory', type=Path, help='Refresh isolated RSS profiles in an existing frozen report; preserve wall timings and quality')
    a = p.parse_args()
    if not 1 <= a.top_k <= 30:
        p.error('--top-k must be 1..30')
    if not 1 <= a.timing_repeats <= 20:
        p.error('--timing-repeats must be 1..20')
    for key in ('dataset', 'dev_dataset', 'binary', 'index', 'v1_binary', 'v1_index', 'output'):
        setattr(a, key, getattr(a, key).resolve())
    if a.semantic_index:
        a.semantic_index = a.semantic_index.resolve()
    return a


def variant_specs(a: argparse.Namespace) -> dict[str, dict]:
    """Every specification is a command prefix; queries are structured argv."""
    native = [str(a.binary), '--index', str(a.index), '--top-k', str(a.top_k)]
    if a.v1_binary.is_file() and a.v1_index.is_file():
        previous = [str(a.v1_binary), '--index', str(a.v1_index), '--top-k', str(a.top_k)]
        v1_description = 'Unmodified first-round binary and index, archived before v2 edits.'
    else:
        previous = [*native, '--strategy', 'v1']
        v1_description = 'Compatibility strategy v1; archived binary unavailable. Check old-set equivalence separately.'
    specs = {
        'python': {'command': [sys.executable, str(ROOT / 'scripts/search_docs.py'), '--max-results', str(a.top_k), '--json'],
                   'adapter': 'python', 'stdin': False,
                   'description': 'Original unchanged Python CLI, including rich signatures/snippets/metadata.'},
        'native_v1': {'command': previous, 'adapter': 'native', 'stdin': True, 'description': v1_description},
        'native_v2': {'command': [*native, '--strategy', 'hybrid'], 'adapter': 'native', 'stdin': True,
                      'description': 'Second-round native lexical/structural hybrid.'},
    }
    if a.include_tree:
        specs['native_tree'] = {'command': [*native, '--strategy', 'tree'], 'adapter': 'native', 'stdin': True,
                                'description': 'Optional frozen CPU tree ranker on the shared native candidates.'}
    if a.semantic_index:
        base = [sys.executable, str(ROOT / 'scripts/semantic_router.py'), '--index', str(a.semantic_index), '--top-k', str(a.top_k)]
        for mode in ('dense', 'hybrid'):
            specs['semantic_' + mode] = {'command': [*base, '--mode', mode], 'adapter': 'native', 'stdin': True,
                                         'description': f'Optional offline CPU semantic route, mode={mode}.'}
        if a.include_ungated_dense:
            specs['semantic_dense_unfiltered'] = {'command': [*base, '--mode', 'dense', '--min-similarity', '0'],
                                                   'adapter': 'native', 'stdin': True,
                                                   'description': 'Fixed ungated semantic ranking diagnostic; no threshold tuning on the holdout.'}
    if a.only:
        names = a.only.split(',')
        unknown = set(names) - set(specs)
        if unknown:
            raise ValueError('unknown/unavailable variant(s): ' + ', '.join(sorted(unknown)))
        specs = {name: specs[name] for name in names}
    return specs


def adapt(spec: dict, payload: object, labels: list[dict]) -> list[list[str]]:
    return baseline_paths(payload, labels) if spec['adapter'] == 'python' else native_paths(payload, labels)


def scored(labels: list[dict], output: list[list[str]], k: int) -> dict:
    result = score(labels, output, k)
    positives = result['positive_queries']
    n = positives['queries']
    positives['hits_at_1'] = sum(row['first_relevant_rank'] == 1 for row in result['details'] if row['category'] != 'negative')
    positives[f'hits_at_{k}'] = sum(row['first_relevant_rank'] is not None for row in result['details'] if row['category'] != 'negative')
    positives[f'no_relevant_hit_at_{k}'] = n - positives[f'hits_at_{k}']
    negatives = result['negative_queries']
    negatives['false_positives'] = negatives['queries'] - negatives['correct_abstentions']
    groups = sorted({row.get('negative_kind', 'unspecified') for row in labels if row['category'] == 'negative'})
    negatives['subgroups'] = {}
    for group in groups:
        indexes = [i for i, row in enumerate(labels) if row['category'] == 'negative' and row.get('negative_kind', 'unspecified') == group]
        rejected = sum(not output[i] for i in indexes)
        negatives['subgroups'][group] = {'queries': len(indexes), 'correct_abstentions': rejected,
                                       'false_positives': len(indexes)-rejected,
                                       'abstention_accuracy': round(rejected / len(indexes), 6)}
    return result


def usage_summary(samples: list[dict]) -> dict:
    out = {'samples': samples, 'median_wall_ms': round(statistics.median(r['wall_ms'] for r in samples), 3)}
    if all('max_rss_kib' in r for r in samples):
        out['median_peak_rss_kib'] = statistics.median(r['max_rss_kib'] for r in samples)
    return out


def evaluate_dataset(path: Path, specs: dict[str, dict], a: argparse.Namespace, scope: str) -> tuple[dict, list[dict]]:
    meta, labels = load_labels(path)
    result = {'scope': scope, 'dataset': str(path.relative_to(ROOT)) if path.is_relative_to(ROOT) else str(path),
              'dataset_sha256': digest(path), 'purpose': meta.get('purpose'), 'query_count': len(labels), 'variants': {}}
    for name, spec in specs.items():
        command = list(spec['command'])
        for row in labels:
            command.extend(['--query', row['query']])
        samples = []
        reference = None
        for _ in range(a.timing_repeats):
            payload, usage = measured(command)
            paths = adapt(spec, payload, labels)
            if reference is not None and paths != reference:
                raise ValueError('non-deterministic outputs: ' + name)
            reference = paths
            samples.append(usage)
        evaluated = scored(labels, reference, a.top_k)
        evaluated['cold_batch'] = usage_summary(samples)
        result['variants'][name] = evaluated
        print(f'evaluated {scope}: {name} ({len(labels)} queries)', file=sys.stderr, flush=True)
    if 'native_v1' in result['variants']:
        reference = result['variants']['native_v1']['details']
        result['paired_changes_vs_native_v1'] = {}
        for name, variant in result['variants'].items():
            changes = {}
            for cutoff in (1, a.top_k):
                wins = losses = ties = 0
                for previous, current in zip(reference, variant['details']):
                    if previous['category'] == 'negative':
                        continue
                    old_rank, new_rank = previous['first_relevant_rank'], current['first_relevant_rank']
                    old_hit = old_rank is not None and old_rank <= cutoff
                    new_hit = new_rank is not None and new_rank <= cutoff
                    wins += new_hit and not old_hit
                    losses += old_hit and not new_hit
                    ties += new_hit == old_hit
                changes[f'hit_at_{cutoff}'] = {'gained_queries': wins, 'lost_queries': losses, 'unchanged_queries': ties}
            result['paired_changes_vs_native_v1'][name] = changes
    return result, labels


def warm_measurement(spec: dict, labels: list[dict]) -> dict:
    positive = [row for row in labels if row['category'] != 'negative']
    process = subprocess.Popen([*spec['command'], '--stdin'], cwd=ROOT, text=True, encoding='utf-8',
                               stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, bufsize=1)
    ready = selectors.DefaultSelector()
    ready.register(process.stdout, selectors.EVENT_READ)
    samples = []
    try:
        for index, row in enumerate([positive[0], *positive]):
            started = time.perf_counter()
            process.stdin.write(row['query'] + '\n')
            process.stdin.flush()
            if not ready.select(timeout=60):
                raise RuntimeError('warm query timed out: ' + spec['command'][0])
            line = process.stdout.readline()
            if not line:
                raise RuntimeError('warm process closed: ' + process.stderr.read()[-2000:])
            adapt(spec, json.loads(line), [row])
            if index:
                samples.append((time.perf_counter()-started)*1000)
        process.stdin.close()
        process.wait(timeout=20)
        if process.returncode:
            raise RuntimeError('warm process failed: ' + process.stderr.read()[-2000:])
    finally:
        ready.close()
        if process.poll() is None:
            process.kill()
            process.wait()
    return {'query_count': len(samples), 'warmup_requests': 1,
            'median_ms': round(statistics.median(samples), 3), 'p95_ms': round(percentile(samples, .95), 3),
            'max_ms': round(max(samples), 3),
            'includes': 'One request after index/model load, pipe/JSON overhead included; initial request excluded.'}


def latency(specs: dict[str, dict], labels: list[dict], repeats: int) -> dict:
    first = next(row for row in labels if row['category'] != 'negative')
    result = {'cold_sample_id': first['id'], 'variants': {}}
    for name, spec in specs.items():
        samples = []
        for _ in range(repeats):
            _, usage = measured([*spec['command'], '--query', first['query']])
            samples.append(usage)
        item = {'cold_single': usage_summary(samples)}
        if spec['stdin']:
            item['warm_single'] = warm_measurement(spec, labels)
        result['variants'][name] = item
    return result


def artifact_hashes(a: argparse.Namespace, specs: dict) -> dict:
    paths = {'native_binary': a.binary, 'native_index': a.index,
             'python_entrypoint': ROOT / 'scripts/search_docs.py',
             'v1_binary': a.v1_binary, 'v1_index': a.v1_index}
    for name in ('ranker.json', 'routing_aliases.json'):
        paths[name] = ROOT / 'native/doc_router/model' / name
    if a.include_tree:
        paths['tree_ranker.hpp'] = ROOT / 'native/doc_router/tree_ranker.hpp'
        for path in (ROOT / 'native/doc_router/model').glob('*tree*'):
            if path.is_file():
                paths[path.name] = path
    if a.semantic_index:
        paths['semantic_model_lock'] = ROOT / 'native/doc_router/semantic/model-lock.json'
        # Only fingerprint reproducible runtime inputs, not local development
        # score dumps or cached evaluation vectors in the same build directory.
        lock = json.loads(paths['semantic_model_lock'].read_text(encoding='utf-8'))
        resources = ['semantic-meta.json', 'vectors.npy']
        resources.extend('model/' + item['local'] for item in lock['files'])
        for relative in resources:
            paths['semantic/' + relative] = a.semantic_index / relative
        paths['semantic_entrypoint'] = ROOT / 'scripts/semantic_router.py'
    return {name: {'sha256': digest(path), 'bytes': path.stat().st_size}
            for name, path in paths.items() if path.is_file()}


def refresh_memory(path: Path) -> int:
    report = json.loads(path.read_text(encoding='utf-8'))
    specs = report['variant_specs']
    for dataset in report['datasets'].values():
        _, labels = load_labels(ROOT/dataset['dataset'])
        for name, result in dataset['variants'].items():
            command = list(specs[name]['command'])
            for row in labels:
                command.extend(['--query', row['query']])
            payload, usage = measured(command)
            actual = adapt(specs[name], payload, labels)
            if actual != [row['paths'] for row in result['details']]:
                raise ValueError('output changed while refreshing memory: '+name)
            batch = result['cold_batch']
            batch.pop('median_peak_rss_kib', None)
            for sample in batch['samples']:
                sample.pop('max_rss_kib', None)
            batch['isolated_memory_profile'] = usage
            print(f'profiled batch RSS: {dataset["scope"]}/{name}', file=sys.stderr, flush=True)
    holdout = report['datasets'].get('holdout', report['datasets']['development'])
    _, labels = load_labels(ROOT/holdout['dataset'])
    first = next(row for row in labels if row['category'] != 'negative')
    for name, result in report.get('latency', {}).get('variants', {}).items():
        samples = []
        for _ in range(report['methodology']['timing_repeats']):
            _, usage = measured([*specs[name]['command'], '--query', first['query']])
            samples.append(usage)
        cold = result['cold_single']
        cold.pop('median_peak_rss_kib', None)
        for sample in cold['samples']:
            sample.pop('max_rss_kib', None)
        cold['isolated_memory_profile'] = usage_summary(samples)
    report['methodology']['memory_scope'] = 'Per-target wait4 RSS from a fresh minimal stdlib helper. This avoids fork-inherited RSS inflation from the large evaluator. Original normal-process wall timings are preserved; separate isolated memory profiles are recorded. Not aggregate process-tree RSS; semantic hybrid also retains a native lexical child.'
    report['memory_profiles_refreshed_at_utc'] = datetime.now(timezone.utc).isoformat()
    path.write_text(json.dumps(report, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
    print('Refreshed isolated RSS profiles; all query outputs unchanged: '+str(path))
    return 0


def main() -> int:
    a = arguments()
    # Compare single-threaded CPU configurations; inherited host BLAS defaults
    # otherwise create dozens of workers for a small matrix-vector product.
    os.environ['OPENBLAS_NUM_THREADS'] = '1'
    os.environ['OMP_NUM_THREADS'] = '1'
    if a.refresh_memory:
        return refresh_memory(a.refresh_memory.resolve())
    specs = variant_specs(a)
    report = {'schema': 2, 'created_at_utc': datetime.now(timezone.utc).isoformat(),
              'methodology': {
                  'query_origin': 'Independently agent-authored and independently audited synthetic queries; not human annotations or real-user traffic.',
                  'development_scope': 'The old66 query set was visible during v2 development and tuning; do not call it held out.',
                  'holdout_scope': 'New query wording and labels were withheld until all evaluated configurations froze. Indexed documents remain available normally.',
                  'label_semantics': 'Any listed direct-answer page is useful; alternatives are not exhaustive set recall.',
                  'metrics': 'Hit@1, Hit@k, MRR@k on positives; negative refusal and false positives separately; no calibrated relevance probability.',
                  'top_k': a.top_k, 'timing_repeats': a.timing_repeats,
                  'timing_scope': 'Cold means fresh process, not cleared filesystem cache. Native output is compact paths; Python includes richer metadata. Warm timings include pipe/JSON overhead.',
                  'memory_scope': 'Per-target wait4 ru_maxrss in KiB on Linux, launched from a minimal stdlib helper to avoid the evaluator fork-inherited RSS floor. Not cumulative RUSAGE_CHILDREN or simultaneous process-tree RSS. Semantic hybrid also keeps a native lexical child; its memory is additional.',
                  'selection': 'Metrics support comparison on this synthetic set; using them to choose a default is model selection, not a new unseen acceptance test.',
              },
              'environment': {'platform': platform.platform(), 'machine': platform.machine(), 'python': platform.python_version(),
                              'logical_cpus': os.cpu_count(), 'openblas_threads': 1, 'omp_threads': 1,
                              'semantic_ort_threads': 1},
              'variant_specs': specs, 'artifacts': artifact_hashes(a, specs), 'datasets': {}}
    development, dev_labels = evaluate_dataset(a.dev_dataset, specs, a, 'visible_development_regression')
    report['datasets']['development'] = development
    labels = dev_labels
    if not a.only_dev:
        holdout, labels = evaluate_dataset(a.dataset, specs, a, 'new_frozen_query_holdout')
        report['datasets']['holdout'] = holdout
    if not a.skip_latency:
        report['latency'] = latency(specs, labels, a.timing_repeats)
    a.output.parent.mkdir(parents=True, exist_ok=True)
    a.output.write_text(json.dumps(report, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
    summary = {key: {name: {'positive': row['positive_queries'], 'negative': row['negative_queries']}
                     for name, row in value['variants'].items()} for key, value in report['datasets'].items()}
    summary['report'] = str(a.output)
    print(json.dumps(summary, ensure_ascii=False, indent=2))
    if any(row['invalid_result_paths'] for dataset in report['datasets'].values() for row in dataset['variants'].values()):
        return 1
    return 0


if __name__ == '__main__':
    try:
        raise SystemExit(main())
    except (OSError, ValueError, RuntimeError, subprocess.SubprocessError) as exc:
        print('error: ' + str(exc), file=sys.stderr)
        raise SystemExit(2)
