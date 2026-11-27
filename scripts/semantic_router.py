#!/usr/bin/env python3
"""Optional local INT8 BGE document retrieval; query execution never downloads.

The dependency-free C++ router remains the default project runtime. This is a
separate, explicitly installed semantic experiment using ONNX CPU inference.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys

sys.dont_write_bytecode = True
# ORT's API-only opt-out is too late for initialization events. Its official
# Privacy.md requires this environment opt-out BEFORE the library initializes.
if "onnxruntime" in sys.modules and os.environ.get("ORT_DISABLE_TELEMETRY", "").lower() not in {"1", "true", "yes", "on", "y"}:
    raise RuntimeError("ONNX Runtime was initialized before telemetry opt-out; use a fresh process")
os.environ["ORT_DISABLE_TELEMETRY"] = "1"
os.environ["HF_HUB_DISABLE_TELEMETRY"] = "1"
# Bound matrix-vector and tokenizer parallelism before importing optional deps.
os.environ.setdefault("OPENBLAS_NUM_THREADS", "1")
os.environ.setdefault("OMP_NUM_THREADS", "1")
os.environ.setdefault("TOKENIZERS_PARALLELISM", "false")
ROOT = Path(__file__).resolve().parents[1]
DEFAULT_INDEX = ROOT / "build/semantic-router"
LOCK = ROOT / "native/doc_router/semantic/model-lock.json"


def sha256(path: Path) -> str:
    with path.open("rb") as stream:
        digest = hashlib.file_digest(stream, "sha256")
    return digest.hexdigest()


class Encoder:
    def __init__(self, model_dir: Path, lock: dict, threads: int = 1):
        import numpy as np
        import onnxruntime as ort
        from tokenizers import Tokenizer
        # ONNX Runtime may otherwise emit telemetry even with local model files.
        # Querying and index encoding must not make background network requests.
        ort.disable_telemetry_events()
        self.np = np
        self.lock = lock
        for item in lock["files"]:
            path = model_dir / item["local"]
            if not path.is_file() or path.stat().st_size != item["bytes"] or sha256(path) != item["sha256"]:
                raise ValueError(f"model file missing or changed: {path}; rebuild explicitly")
        settings = ort.SessionOptions()
        settings.intra_op_num_threads = threads
        settings.inter_op_num_threads = 1
        settings.graph_optimization_level = ort.GraphOptimizationLevel.ORT_ENABLE_ALL
        self.session = ort.InferenceSession(str(model_dir / "model_int8.onnx"), settings, providers=["CPUExecutionProvider"])
        if self.session.get_providers() != ["CPUExecutionProvider"]:
            raise ValueError("semantic runtime must use the CPU provider")
        self.tokenizer = Tokenizer.from_file(str(model_dir / "tokenizer.json"))
        self.tokenizer.enable_truncation(max_length=lock["max_tokens"])
        self.tokenizer.enable_padding(pad_id=0, pad_token="[PAD]")

    def encode(self, texts: list[str], *, queries: bool = False):
        np = self.np
        if queries:
            texts = [self.lock["query_instruction"] + text for text in texts]
        batch = self.tokenizer.encode_batch(texts)
        feed = {
            "input_ids": np.asarray([item.ids for item in batch], dtype=np.int64),
            "attention_mask": np.asarray([item.attention_mask for item in batch], dtype=np.int64),
            "token_type_ids": np.asarray([item.type_ids for item in batch], dtype=np.int64),
        }
        # BGE uses the first token, not mean pooling. This follows the base card.
        hidden = self.session.run(["last_hidden_state"], feed)[0]
        vectors = hidden[:, 0].astype(np.float32)
        vectors /= np.maximum(np.linalg.norm(vectors, axis=1, keepdims=True), 1e-12)
        if not np.isfinite(vectors).all():
            raise ValueError("encoder returned non-finite vectors")
        return vectors


class NativeLane:
    def __init__(self, binary: Path, index: Path, strategy: str, domains: list[str]):
        command = [str(binary.resolve()), "--index", str(index.resolve()), "--stdin", "--top-k", "50", "--explain"]
        if strategy != "legacy":
            command.extend(["--strategy", strategy])
        else:
            command.append("--bm25-only")
        for domain in domains:
            command.extend(["--domain", domain])
        self.process = subprocess.Popen(command, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, encoding="utf-8", bufsize=1)

    def search(self, query: str) -> dict:
        process = self.process
        process.stdin.write(query.replace("\n", " ").replace("\r", " ") + "\n")
        process.stdin.flush()
        line = process.stdout.readline()
        if not line:
            raise RuntimeError("native lexical lane failed: " + process.stderr.read()[-1000:])
        return json.loads(line)["queries"][0]

    def close(self):
        process = self.process
        if process.poll() is None:
            process.stdin.close()
            try:
                process.wait(timeout=5)
            except subprocess.TimeoutExpired:
                process.kill()
                process.wait()


class SemanticRouter:
    def __init__(self, args):
        import numpy as np
        self.np = np
        self.args = args
        self.lock = json.loads(LOCK.read_text(encoding="utf-8"))
        self.meta = json.loads((args.index / "semantic-meta.json").read_text(encoding="utf-8"))
        if not isinstance(self.meta, dict) or self.meta.get("format") != 1 or self.meta.get("model_lock_sha256") != sha256(LOCK):
            raise ValueError("semantic index format/model lock differs; rebuild explicitly")
        self.documents = self.meta.get("documents")
        if not isinstance(self.documents, list) or not self.documents:
            raise ValueError("semantic documents must be a nonempty list")
        ids = set()
        for record in self.documents:
            if not isinstance(record, dict):
                raise ValueError("semantic document must be an object")
            path = record.get("path", "")
            if not isinstance(path, str) or not path.startswith("references/") or ".." in Path(path).parts or "\\" in path or any(ord(c) < 32 for c in path) or not path.endswith(".md") or not isinstance(record.get("id"), str) or not record["id"] or record["id"] in ids:
                raise ValueError("invalid or duplicate semantic document metadata")
            if not all(isinstance(record.get(key), str) for key in ("title", "domain", "kind")):
                raise ValueError("semantic document fields must be strings")
            ids.add(record["id"])
        self.by_path = {record["path"]: i for i, record in enumerate(self.documents)}
        if len(self.by_path) != len(self.documents):
            raise ValueError("duplicate semantic document paths")
        vectors_path = args.index / "vectors.npy"
        if sha256(vectors_path) != self.meta["vectors_sha256"]:
            raise ValueError("semantic vector checksum mismatch")
        self.vectors = np.load(vectors_path, mmap_mode="r", allow_pickle=False)
        if self.vectors.shape != (len(self.documents), self.lock["dimensions"]) or self.vectors.dtype != np.float32:
            raise ValueError("semantic vector shape/type mismatch")
        if not np.isfinite(self.vectors).all():
            raise ValueError("non-finite semantic index vector")
        self.encoder = Encoder(args.index / "model", self.lock, args.threads)
        self.native = None
        if args.mode == "hybrid":
            self.native = NativeLane(args.native_binary, args.native_index, args.native_strategy, args.domain)
        self.allowed = np.asarray([self.domain_allowed(record) for record in self.documents], dtype=bool)

    def domain_allowed(self, record: dict) -> bool:
        domains = {part for value in self.args.domain for part in value.split(",")}
        return not domains or record["domain"] in domains or ("examples" in domains and record["path"].startswith("references/examples/"))

    def exact(self, query: str) -> list[int]:
        selector = query.strip().lower().removesuffix("()")
        return [i for i, record in enumerate(self.documents) if self.allowed[i] and selector in {record["id"].lower(), record["path"].lower(), record["path"].removeprefix("references/").lower(), record["title"].lower()}]

    def search(self, query: str) -> dict:
        if len(query.encode("utf-8")) > 16384:
            raise ValueError("query exceeds 16384 UTF-8 bytes")
        if "\x00" in query:
            raise ValueError("query contains NUL")
        answer = {"query": query, "paths": [], "status": "no_match"}
        if not re.search(r"[A-Za-z0-9\u3400-\u9fff]", query):
            return answer
        exact = self.exact(query)
        if exact:
            selected = exact[:self.args.top_k]
            scores = {i: 1.0 for i in selected}
            similarities = scores
        else:
            vector = self.encoder.encode([query], queries=True)[0]
            similarities = self.vectors @ vector
            retrieval_scores = similarities.copy()
            retrieval_scores[~self.allowed] = -1
            # For Chinese conceptual questions use authored explanations as the
            # semantic lane. Thousands of near-duplicate API member summaries
            # otherwise drown out language rules. Explicit symbols stay native.
            has_han = bool(re.search(r"[\u3400-\u9fff]", query))
            if self.args.mode == "hybrid" and has_han:
                for i, record in enumerate(self.documents):
                    if record["path"].startswith("references/api/"):
                        retrieval_scores[i] = -1
            order = self.np.argsort(-retrieval_scores, kind="stable")[:50].tolist()
            order = [i for i in order if retrieval_scores[i] >= self.args.min_similarity]
            scores = {i: float(similarities[i]) for i in order}
            selected = order[:self.args.top_k]
            if self.native is not None:
                lane = self.native.search(query)
                lexical = [self.by_path[path] for path in lane["paths"] if path in self.by_path]
                # RRF combines ranks; cosine magnitudes are not calibrated relevance.
                dense_weight, lexical_weight = (.5, 1.0) if has_han else (.25, 1.0)
                fused = {}
                for rank, i in enumerate(order, 1):
                    fused[i] = dense_weight / (20 + rank)
                for rank, i in enumerate(lexical, 1):
                    fused[i] = fused.get(i, 0.0) + lexical_weight / (20 + rank)
                if not has_han and lexical:
                    # Preserve the native lane's explicit English/code anchor.
                    fused[lexical[0]] = fused.get(lexical[0], 0.0) + .02
                selected = sorted(fused, key=lambda i: (-fused[i], self.documents[i]["path"]))[:self.args.top_k]
                scores = fused
        answer["paths"] = [self.documents[i]["path"] for i in selected]
        if selected:
            answer["status"] = "ok"
        if self.args.explain:
            answer["results"] = [{"path": self.documents[i]["path"], "id": self.documents[i]["id"], "score": scores[i], "cosine": float(similarities[i])} for i in selected]
        return answer

    def close(self):
        if self.native:
            self.native.close()


def parse_args():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--index", type=Path, default=DEFAULT_INDEX)
    parser.add_argument("--query", action="append", default=[])
    parser.add_argument("--stdin", action="store_true")
    parser.add_argument("--top-k", type=int, default=5)
    parser.add_argument("--threads", type=int, default=1)
    parser.add_argument("--mode", choices=["dense", "hybrid"], default="hybrid")
    parser.add_argument("--min-similarity", type=float, default=.65, help="Per-candidate uncalibrated cosine evidence floor; not a relevance probability")
    parser.add_argument("--domain", action="append", default=[])
    parser.add_argument("--explain", action="store_true")
    parser.add_argument("--native-binary", type=Path, default=ROOT / "build/doc_router/cj-doc-router")
    parser.add_argument("--native-index", type=Path, default=ROOT / "build/doc_router/router.idx")
    parser.add_argument("--native-strategy", choices=["hybrid", "v1", "legacy"], default="hybrid")
    args = parser.parse_args()
    if not args.query and not args.stdin:
        parser.error("--query or --stdin is required")
    if not 1 <= args.top_k <= 30 or not 1 <= args.threads <= 16 or not 0 <= args.min_similarity <= 1:
        parser.error("top-k must be 1..30, threads 1..16, min-similarity 0..1")
    valid = {"language", "std", "stdx", "tools", "examples"}
    if any(domain not in valid for value in args.domain for domain in value.split(",")):
        parser.error("unknown --domain")
    return args


def main():
    args = parse_args()
    router = SemanticRouter(args)
    try:
        if args.query:
            print(json.dumps({"format": 1, "strategy": "bge-int8-" + args.mode, "queries": [router.search(query) for query in args.query]}, ensure_ascii=False))
        if args.stdin:
            for line in sys.stdin:
                print(json.dumps({"format": 1, "strategy": "bge-int8-" + args.mode, "queries": [router.search(line.rstrip("\r\n"))]}, ensure_ascii=False), flush=True)
    finally:
        router.close()
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (ImportError, OSError, ValueError, KeyError, TypeError, RuntimeError, subprocess.SubprocessError) as error:
        print(f"error: {error}", file=sys.stderr)
        raise SystemExit(2)
