#!/usr/bin/env python3
"""Train a tiny optional boosted-tree document ranker and export C++ arrays.

The first-round 66-query evaluation is now DEVELOPMENT DATA. This script never
reads the new hidden second-round evaluation. A fixed 32-tree configuration is
tested with topic-grouped cross-validation before the final model is fitted to
all development labels. Cross-validation measures candidate ranking, not the
runtime's end-to-end answerability gate or calibrated relevance probability.

Offline requirements used for the committed model: numpy==2.3.5 and
scikit-learn==1.8.0. Native inference has no dependency
on either package, Python, a model server, or a JSON parser.
"""
from __future__ import annotations

import argparse
from collections import defaultdict
import hashlib
import json
import math
from pathlib import Path
import subprocess
import sys

import numpy as np
import sklearn
from sklearn.ensemble import GradientBoostingRegressor
from sklearn.model_selection import GroupKFold

sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(Path(__file__).resolve().parent))
from build_router import FEATURE_NAMES, atomic_write

TREE_FEATURE_NAMES = [*FEATURE_NAMES, "hybrid_base_score"]

MODEL = ROOT / "native/doc_router/model/tree_ranker.json"
HEADER = ROOT / "native/doc_router/tree_ranker.hpp"
SEED = ROOT / "native/doc_router/model/training_queries.json"
DEVELOPMENT = ROOT / "scripts/tests/data/router-queries.json"
CONFIG = {
    "n_estimators": 32,
    "max_depth": 3,
    "min_samples_leaf": 12,
    "learning_rate": 0.08,
    "loss": "squared_error",
    "random_state": 1729,
}


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical(value: object) -> bytes:
    return json.dumps(value, ensure_ascii=False, sort_keys=True, separators=(",", ":")).encode("utf-8")


def source_name(path: Path) -> str:
    return str(path.relative_to(ROOT)) if path.is_relative_to(ROOT) else path.name


def topic(paths: list[str], query: str) -> str:
    """Group sibling API receivers and guide/example topics across query wording."""
    for path in paths:
        parts = path.split("/")
        for category in ("classes", "structs", "enums", "interfaces"):
            if category in parts and parts.index(category) + 1 < len(parts):
                return parts[parts.index(category) + 1]
        if "collections" in parts and parts.index("collections") + 1 < len(parts):
            name = parts[parts.index("collections") + 1]
            if not name.endswith(".md"):
                return name
    if paths:
        parts = paths[0].split("/")
        if len(parts) > 3 and parts[1] in {"language", "tools", "examples"}:
            # Keep functions/closures, C FFI, project-build etc in one fold.
            name = parts[2]
            return {"functions": "function", "abstractions": "generic", "project-build": "cjpm"}.get(name, name)
        return "/".join(parts[1:5])
    # Negatives share one group, rather than leaking similar OOD wording across folds.
    return "out-of-domain"


def labels(seed: Path, development: Path) -> tuple[list[dict], list[dict]]:
    rows: dict[str, dict] = {}
    sources = []
    for path in (seed, development):
        payload = json.loads(path.read_text(encoding="utf-8"))
        sources.append({"path": source_name(path), "sha256": digest(path)})
        for row in payload["queries"]:
            query = row["query"]
            relevant = row.get("relevant_paths", row.get("relevant", []))
            target = rows.setdefault(query, {"query": query, "relevant": set(), "sources": []})
            target["relevant"].update(relevant)
            target["sources"].append(source_name(path))
    output = []
    for row in rows.values():
        row["relevant"] = sorted(row["relevant"])
        for path in row["relevant"]:
            if not path.startswith("references/") or not (ROOT / path).is_file():
                raise ValueError(f"invalid development relevance path: {path}")
        row["group"] = topic(row["relevant"], row["query"])
        output.append(row)
    return output, sources


def extract(binary: Path, index: Path, rows: list[dict], count: int, cache: Path) -> tuple[list[dict], dict]:
    identity = {
        "native_source_sha256": digest(ROOT / "native/doc_router/main.cpp"),
        "index_sha256": digest(index),
        "labels_sha256": hashlib.sha256(canonical(rows)).hexdigest(),
        "candidates_per_query": count, "strategy": "hybrid",
        "feature_schema": "hybrid-13-v2-stack",
    }
    # Recompiling the generated header changes executable bytes without changing
    # hybrid feature extraction. Keep the binary hash in the local cache only,
    # otherwise model -> header -> binary -> model would form a circular hash.
    cache_identity = {**identity, "binary_sha256": digest(binary)}
    if cache.is_file():
        cached = json.loads(cache.read_text(encoding="utf-8"))
        if cached.get("identity") == cache_identity:
            return cached["rows"], cached["fingerprint"]
    extracted = []
    for label in rows:
        command = [str(binary.resolve()), "--index", str(index.resolve()), "--strategy", "hybrid",
                   "--query", label["query"], "--top-k", str(count), "--dump-features"]
        for path in label["relevant"]:
            command.extend(["--candidate-path", path])
        result = subprocess.run(command, capture_output=True, text=True, encoding="utf-8", timeout=30, check=True)
        payload = json.loads(result.stdout)
        if payload.get("feature_names") != FEATURE_NAMES:
            raise ValueError("native feature order differs from the trained header contract")
        found = set()
        hits = []
        for position, hit in enumerate(payload["queries"][0].get("results", [])):
            vector = hit["features"]
            if len(vector) != len(FEATURE_NAMES) or not all(math.isfinite(float(x)) for x in vector):
                raise ValueError("invalid native features")
            found.add(hit["path"])
            # A forced positive can be appended after top-k or have zero lexical
            # evidence. It may train the classifier but must not inflate CV recall.
            hits.append({"path": hit["path"], "features": [*vector, hit["score"]], "baseline_score": hit["score"],
                         "natural_candidate": position < count and vector[0] > 0,
                         "relevant": hit["path"] in label["relevant"]})
        if not set(label["relevant"]).issubset(found):
            raise ValueError("native feature dump omitted forced positive labels")
        extracted.append({**label, "hits": hits})
    fingerprint = {**identity, "feature_dump_sha256": hashlib.sha256(canonical(extracted)).hexdigest()}
    atomic_write(cache, json.dumps({"identity": cache_identity, "fingerprint": fingerprint, "rows": extracted}, ensure_ascii=False).encode("utf-8"))
    return extracted, fingerprint


def matrix(rows: list[dict]) -> tuple[np.ndarray, np.ndarray, np.ndarray]:
    vectors, targets, weights = [], [], []
    for row in rows:
        positives = sum(hit["relevant"] for hit in row["hits"])
        negatives = len(row["hits"]) - positives
        for hit in row["hits"]:
            vectors.append(hit["features"])
            targets.append(float(hit["relevant"]))
            # Each query contributes equal total positive/negative mass; a large
            # API candidate list cannot drown out a short natural-language query.
            if positives and negatives:
                weights.append(0.5 / (positives if hit["relevant"] else negatives))
            else:
                weights.append(1.0 / max(1, len(row["hits"])))
    if not vectors:
        raise ValueError("empty development candidate features")
    return np.asarray(vectors, dtype=np.float32), np.asarray(targets), np.asarray(weights)


def ranking_metrics(rows: list[dict], scorer) -> dict:
    queries = hits1 = hits5 = recalled = 0
    rr = 0.0
    for row in rows:
        if not row["relevant"]:
            continue
        queries += 1
        hits = [hit for hit in row["hits"] if hit["natural_candidate"]]
        if any(hit["relevant"] for hit in hits):
            recalled += 1
        if not hits:
            continue
        scores = scorer(hits)
        ordered = sorted(zip(hits, scores), key=lambda item: (-float(item[1]), item[0]["path"]))
        rank = next((i for i, (hit, _) in enumerate(ordered, 1) if hit["relevant"]), None)
        hits1 += rank == 1
        hits5 += rank is not None and rank <= 5
        rr += 1.0 / rank if rank is not None and rank <= 5 else 0.0
    return {"positive_queries": queries, "candidate_recall": recalled / max(1, queries),
            "hit_at_1": hits1 / max(1, queries), "hit_at_5": hits5 / max(1, queries), "mrr_at_5": rr / max(1, queries)}


def estimator() -> GradientBoostingRegressor:
    return GradientBoostingRegressor(**CONFIG)


def fit(rows: list[dict], fingerprint: dict, sources: list[dict]) -> dict:
    groups = np.asarray([row["group"] for row in rows])
    folds = []
    predictions: dict[str, list[float]] = {}
    # Query/topic groups, rather than candidate rows, define the held-out fold.
    splitter = GroupKFold(n_splits=min(4, len(set(groups))))
    for train, valid in splitter.split(rows, groups=groups):
        train_rows = [rows[i] for i in train]
        valid_rows = [rows[i] for i in valid]
        x, y, w = matrix(train_rows)
        model = estimator().fit(x, y, sample_weight=w)
        for row in valid_rows:
            if row["hits"]:
                predictions[row["query"]] = model.predict(np.asarray([h["features"] for h in row["hits"]], dtype=np.float32)).tolist()
            else:
                predictions[row["query"]] = []
        folds.append({"training_queries": len(train_rows), "validation_queries": len(valid_rows),
                      "validation_groups": sorted(set(groups[valid])),
                      "ranking": ranking_metrics(valid_rows, lambda hs: model.predict(np.asarray([h["features"] for h in hs], dtype=np.float32)))})
    # Associate prediction values by candidate path to avoid accidental order drift.
    path_scores = {row["query"]: {hit["path"]: score for hit, score in zip(row["hits"], predictions[row["query"]])} for row in rows}
    out_of_fold = []
    for row in rows:
        copy = {**row, "hits": [{**hit, "oof": path_scores[row["query"]][hit["path"]]} for hit in row["hits"]]}
        out_of_fold.append(copy)
    pure_cv = ranking_metrics(out_of_fold, lambda hs: [h["oof"] for h in hs])
    base_metrics = ranking_metrics(rows, lambda hs: [h["baseline_score"] for h in hs])
    # Retain the complete baseline. A fixed small grid includes zero, so CV can
    # reject the learned correction entirely instead of forcing complexity.
    stack_cv = [{"alpha": alpha, "ranking": ranking_metrics(out_of_fold,
                lambda hs, alpha=alpha: [h["baseline_score"] + alpha*h["oof"] for h in hs])}
                for alpha in (0.0, 1.0, 2.0, 4.0)]
    selected = max(stack_cv, key=lambda item: (item["ranking"]["mrr_at_5"], item["ranking"]["hit_at_5"],
                                               item["ranking"]["hit_at_1"], -item["alpha"]))
    x, y, w = matrix(rows)
    model = estimator().fit(x, y, sample_weight=w)
    trees = []
    for fitted in model.estimators_[:, 0]:
        tree = fitted.tree_
        trees.append([{"feature": int(tree.feature[i]), "threshold": float(tree.threshold[i]),
                       "left": int(tree.children_left[i]), "right": int(tree.children_right[i]),
                       "value": float(tree.value[i, 0, 0])} for i in range(tree.node_count)])
    payload = {
        "format": 1, "type": "gradient-boosted-relevance-correction-stack", "feature_names": TREE_FEATURE_NAMES,
        "description": "Experimental baseline-preserving relevance correction, trained pointwise; score=hybrid_base+alpha*tree_prediction. Scores are not calibrated probabilities. Topic-grouped CV selects alpha, never new hidden evaluation.",
        "bias": float(model.init_.constant_[0, 0]), "learning_rate": CONFIG["learning_rate"], "trees": trees,
        "stack_alpha": selected["alpha"],
        "training": {"sources": sources, "feature_extractor": fingerprint,
                     "development_queries": len(rows), "positive_queries": sum(bool(r["relevant"]) for r in rows),
                     "queries_with_candidates": sum(bool(r["hits"]) for r in rows),
                     "negative_queries_with_candidates": sum(bool(r["hits"]) and not r["relevant"] for r in rows),
                     "candidate_rows": len(y), "topic_groups": len(set(groups)), "config": CONFIG,
                     "numpy_version": np.__version__, "sklearn_version": sklearn.__version__,
                     "candidate_baseline": base_metrics, "out_of_fold_pure_tree": pure_cv,
                     "out_of_fold_stacked": selected["ranking"], "stack_grid": stack_cv, "folds": folds,
                     "limitations": ["Old first-round evaluation is development data, not new held-out evidence.",
                                     "The correction alpha is selected on out-of-fold scores; its selected CV score is not an independent final test.",
                                     "Unlisted but useful document alternatives can become false negative labels.",
                                     "CV measures top-candidate ranking before runtime gating, not end-to-end retrieval or OOD calibration.",
                                     "Forced positive rows are included for training but excluded from candidate recall/ranking when not naturally recalled."]}}
    payload["model_sha256"] = hashlib.sha256(canonical(payload)).hexdigest()
    # Check the serializable representation numerically before emitting C++.
    predicted = np.asarray([predict(payload, vector) for vector in x])
    if np.max(np.abs(predicted - model.predict(x))) > 1e-10:
        raise ValueError("exported tree traversal disagrees with scikit-learn")
    return payload


def predict(model: dict, vector) -> float:
    output = model["bias"]
    for tree in model["trees"]:
        index = 0
        while tree[index]["feature"] >= 0:
            node = tree[index]
            index = node["left"] if np.float32(vector[node["feature"]]) <= node["threshold"] else node["right"]
        output += model["learning_rate"] * tree[index]["value"]
    return output


def header(model: dict) -> bytes:
    lines = ["// Generated by scripts/maintenance/train_router_v2.py. Do not edit coefficients by hand.",
             "#pragma once", "#include <array>", "#include <cstddef>",
             "namespace cj_router_tree {", "inline constexpr bool available = true;",
             'inline constexpr const char* feature_schema = "hybrid-13-v2-stack";',
             f'inline constexpr const char* model_sha256 = "{model["model_sha256"]}";',
             "struct Node { int feature, left, right; double threshold, value; };", "inline constexpr Node nodes[] = {"]
    offset = 0
    roots = []
    for tree in model["trees"]:
        roots.append(offset)
        for node in tree:
            left = node["left"] + offset if node["left"] >= 0 else -1
            right = node["right"] + offset if node["right"] >= 0 else -1
            lines.append("    {%d,%d,%d,%.17g,%.17g}," % (node["feature"], left, right, node["threshold"], node["value"]))
        offset += len(tree)
    lines.extend(["};", "inline constexpr std::size_t roots[] = {" + ",".join(map(str, roots)) + "};",
                  "inline constexpr bool valid_nodes() {",
                  "    constexpr std::size_t count = sizeof(nodes)/sizeof(nodes[0]);",
                  "    constexpr std::size_t tree_count = sizeof(roots)/sizeof(roots[0]);",
                  "    for (std::size_t t=0; t<tree_count; ++t) {",
                  "        std::size_t begin=roots[t], end=t+1<tree_count?roots[t+1]:count;",
                  "        if (begin>=end || end>count) return false;",
                  "        for (std::size_t i=begin; i<end; ++i) {",
                  "            const Node& n=nodes[i];",
                  "            if (n.feature<0) { if(n.feature!=-2 || n.left!=-1 || n.right!=-1) return false; }",
                  "            else if(n.feature>=13 || n.left<=static_cast<int>(i) || n.right<=static_cast<int>(i) ||",
                  "                    n.left>=static_cast<int>(end) || n.right>=static_cast<int>(end)) return false;",
                  "        }",
                  "    }",
                  "    return true;",
                  "}",
                  "static_assert(valid_nodes(), \"invalid compiled tree model\");",
                  "inline double prediction(const std::array<double,12>& raw_features, double base_score) {",
                  "    std::array<double,13> features{};",
                  "    for(std::size_t i=0;i<12;++i)features[i]=raw_features[i];",
                  "    features[12]=base_score;",
                  "    double result = %.17g;" % model["bias"],
                  "    for (std::size_t root : roots) {", "        std::size_t i = root;",
                  "        while (nodes[i].feature >= 0) {", "            const Node& n = nodes[i];",
                  "            i = static_cast<float>(features[static_cast<std::size_t>(n.feature)]) <= n.threshold ? n.left : n.right;",
                  "        }", "        result += %.17g * nodes[i].value;" % model["learning_rate"],
                  "    }", "    return result;", "}",
                  "inline double score(const std::array<double,12>& features, double base_score) {",
                  "    return base_score + %.17g * prediction(features,base_score);" % model["stack_alpha"],
                  "}", "} // namespace cj_router_tree", ""])
    return "\n".join(lines).encode("utf-8")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--binary", type=Path, default=ROOT / "build/doc_router/cj-doc-router")
    parser.add_argument("--index", type=Path, default=ROOT / "build/doc_router/router.idx")
    parser.add_argument("--seed", type=Path, default=SEED)
    parser.add_argument("--development", type=Path, default=DEVELOPMENT)
    parser.add_argument("--candidates", type=int, default=96)
    parser.add_argument("--cache", type=Path, default=ROOT / "build/doc_router/tree-features.json")
    parser.add_argument("--output", type=Path, default=MODEL)
    parser.add_argument("--header", type=Path, default=HEADER)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    if not 5 <= args.candidates <= 1000:
        parser.error("--candidates must be 5..1000")
    raw, sources = labels(args.seed.resolve(), args.development.resolve())
    rows, fingerprint = extract(args.binary, args.index, raw, args.candidates, args.cache)
    model = fit(rows, fingerprint, sources)
    encoded = json.dumps(model, ensure_ascii=False, indent=2).encode("utf-8") + b"\n"
    code = header(model)
    if args.check:
        if not args.output.is_file() or args.output.read_bytes() != encoded or not args.header.is_file() or args.header.read_bytes() != code:
            raise ValueError("tree model/header is stale for current feature extractor or development data")
        print("verified optional boosted-tree ranker and C++ header")
    else:
        atomic_write(args.output, encoded)
        atomic_write(args.header, code)
        print(f"trained {len(model['trees'])} trees/{sum(map(len, model['trees']))} nodes from {len(rows)} development queries")
        print(json.dumps(model["training"]["candidate_baseline"], ensure_ascii=False))
        print(json.dumps(model["training"]["out_of_fold_pure_tree"], ensure_ascii=False))
        print(json.dumps({"stack_alpha": model["stack_alpha"], "cv": model["training"]["out_of_fold_stacked"]}, ensure_ascii=False))
        print(f"wrote {args.output} ({len(encoded)} bytes) and {args.header} ({len(code)} bytes); recompile native runtime")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (OSError, ValueError, subprocess.SubprocessError) as error:
        print(f"error: {error}", file=sys.stderr)
        raise SystemExit(2)
