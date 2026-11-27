#!/usr/bin/env python3
"""Fit the native router's 12-feature pairwise linear ranker on development labels.

Training uses only the explicit --data file, never retrieval evaluation fixtures.
The native process extracts the same features used at runtime. Hard negatives
are mined by BM25, independent of current model coefficients; an L2 prior keeps
this small supervised experiment conservative. No neural model is implied.
"""
from __future__ import annotations
import argparse
import hashlib
import json
import math
from pathlib import Path
import subprocess
import sys

sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(Path(__file__).resolve().parent))
from build_router import FEATURE_NAMES, MODEL_ROOT, OUTPUT_ROOT, atomic_write

PRIOR = [1.0, 3.0, 2.0, 3.0, 2.0, 1.0, 8.0, 0.3, -2.0, 4.0, 1.0, 1.0]


def loss_gradient(weights, pairs, regularization):
    loss, gradient = 0.0, [0.0] * len(weights)
    for difference in pairs:
        margin = sum(w*x for w, x in zip(weights, difference))
        # Numerically stable log(1+exp(-margin)) and logistic derivative.
        loss += max(0.0, -margin) + math.log1p(math.exp(-abs(margin)))
        probability = 1.0 / (1.0 + math.exp(max(-60.0, min(60.0, margin))))
        for j, value in enumerate(difference): gradient[j] -= probability * value
    count = max(1, len(pairs))
    loss /= count
    for j in range(len(weights)):
        delta = weights[j] - PRIOR[j]
        loss += .5 * regularization * delta * delta
        gradient[j] = gradient[j] / count + regularization * delta
    return loss, gradient


def fit(executable: Path, index: Path, data: Path, negatives: int):
    raw = data.read_bytes()
    payload = json.loads(raw)
    if payload.get("format") != 1 or not payload.get("queries"):
        raise ValueError("training data requires format=1 and nonempty queries")
    pairs, missed, query_count = [], [], 0
    for label in payload["queries"]:
        query = label["query"]
        relevant = set(label["relevant_paths"])
        if not relevant: raise ValueError(f"training query has no positive paths: {query}")
        for path in relevant:
            if not (ROOT / path).is_file() or not path.startswith("references/"):
                raise ValueError(f"training label path does not exist: {path}")
        command = [str(executable.resolve()), "--index", str(index.resolve()), "--query", query, "--top-k", str(negatives), "--explain", "--dump-features", "--bm25-only"]
        for path in sorted(relevant): command.extend(["--candidate-path", path])
        process = subprocess.run(command, capture_output=True, text=True, encoding="utf-8", check=True)
        result = json.loads(process.stdout)["queries"][0]
        candidates = result.get("results", [])
        positives = [hit["features"] for hit in candidates if hit["path"] in relevant]
        wrong = [hit["features"] for hit in candidates if hit["path"] not in relevant]
        if len(positives) != len(relevant):
            missed.append(query); continue
        for vector in positives + wrong:
            if len(vector) != len(FEATURE_NAMES) or not all(math.isfinite(x) for x in vector):
                raise ValueError("native feature vector has wrong order/size or nonfinite values")
        query_count += 1
        pairs.extend([[a-b for a,b in zip(positive, negative)] for positive in positives for negative in wrong])
    if missed: raise ValueError("native dump omitted positive labels: " + "; ".join(missed))
    if not pairs: raise ValueError("no trainable positive-negative pairs")
    weights = PRIOR.copy()
    regularization, epochs, learning_rate = .03, 400, .25
    initial_loss, _ = loss_gradient(weights, pairs, regularization)
    for _ in range(epochs):
        _, gradient = loss_gradient(weights, pairs, regularization)
        weights = [w-learning_rate*g for w,g in zip(weights, gradient)]
    final_loss, _ = loss_gradient(weights, pairs, regularization)
    return {"format": 1, "type": "pairwise-linear", "description": "Twelve-feature linear ranker fitted offline with pairwise logistic loss and an L2 anchor to interpretable initial coefficients. Bilingual aliases and abstention remain explicit rules, not learned semantic representations.", "feature_names": FEATURE_NAMES, "weights": [round(x, 8) for x in weights], "training": {"data": str(data.relative_to(ROOT)) if data.is_relative_to(ROOT) else data.name, "data_sha256": hashlib.sha256(raw).hexdigest(), "queries": query_count, "pairs": len(pairs), "negative_mining": "native BM25 top-k plus forced positive labels", "negatives_per_query": negatives, "epochs": epochs, "learning_rate": learning_rate, "l2_anchor": regularization, "prior_weights": PRIOR, "initial_loss": round(initial_loss, 8), "final_loss": round(final_loss, 8)}}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--data", type=Path, default=MODEL_ROOT / "training_queries.json")
    parser.add_argument("--binary", type=Path, default=OUTPUT_ROOT / "cj-doc-router")
    parser.add_argument("--index", type=Path, default=OUTPUT_ROOT / "router.idx")
    parser.add_argument("--output", type=Path, default=MODEL_ROOT / "ranker.json")
    parser.add_argument("--negatives", type=int, default=64)
    parser.add_argument("--check", action="store_true", help="Recompute and compare trained coefficients/metadata without writing")
    args = parser.parse_args()
    if not 1 <= args.negatives <= 1000: raise ValueError("--negatives must be 1..1000")
    model = fit(args.binary, args.index, args.data.resolve(), args.negatives)
    encoded = json.dumps(model, ensure_ascii=False, indent=2).encode("utf-8") + b"\n"
    if args.check:
        if not args.output.is_file() or args.output.read_bytes() != encoded:
            raise ValueError("ranker is missing or stale; run scripts/maintenance/train_router.py then rebuild the router index")
        print("verified offline-trained ranker")
    else:
        atomic_write(args.output, encoded)
        print(f"trained {args.output}: {model['training']['queries']} queries, {model['training']['pairs']} pairs, loss {model['training']['initial_loss']} -> {model['training']['final_loss']}")
        print("Rebuild index: python scripts/maintenance/build_router.py")
    return 0


if __name__ == "__main__":
    try: raise SystemExit(main())
    except (OSError, ValueError, subprocess.CalledProcessError) as exc:
        print(f"error: {exc}", file=sys.stderr); raise SystemExit(2)
