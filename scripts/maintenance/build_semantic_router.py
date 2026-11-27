#!/usr/bin/env python3
"""Build the optional INT8 BGE semantic index; only --download accesses network."""
from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import sys
import tempfile
import time
import urllib.request

sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "scripts"))
sys.path.insert(0, str(Path(__file__).resolve().parent))
from semantic_router import Encoder, LOCK, sha256
from build_knowledge_db import load_records, record_domain


def canonical(value):
    return json.dumps(value, ensure_ascii=False, sort_keys=True, separators=(",", ":")).encode("utf-8")


def collect(source_root: Path):
    records = sorted(load_records(source_root), key=lambda record: record["path"])
    by_id = {record["id"]: record for record in records}
    documents, texts = [], []
    fingerprint = hashlib.sha256(b"bge-metadata-v2;summary600;signature200;guidebody1000;parent-title;max-tokens256\0")
    fingerprint.update(LOCK.read_bytes())
    for record in records:
        path = source_root / record["path"]
        if not path.resolve().is_relative_to(source_root.resolve()):
            raise ValueError("document path escapes source root")
        body = path.read_bytes()
        fingerprint.update(canonical(record)); fingerprint.update(b"\0"); fingerprint.update(body)
        parent = by_id.get(record.get("parent"), {})
        title = record["title"]
        heading = title if title == parent.get("title") else parent.get("title", "") + " / " + title
        signatures = " ".join(record.get("signatures") or [record.get("signature", "")])
        text = heading + "\n" + record.get("summary", "")[:600] + "\n" + signatures[:200]
        if not record["path"].startswith("api/"):
            prose = re.sub(r"<!--.*?-->", "", body.decode("utf-8-sig"), flags=re.DOTALL)
            prose = re.sub(r"\[([^\]]+)\]\([^)]*\)", r"\1", prose)
            text += "\n" + prose[:1000]
        texts.append(text)
        documents.append({"id": record["id"], "path": "references/" + record["path"], "title": title, "domain": record_domain(record), "kind": record["kind"]})
    if len({record["path"] for record in documents}) != len(documents):
        raise ValueError("duplicate semantic source paths")
    return documents, texts, fingerprint.hexdigest()


def download_model(model_dir: Path, lock: dict):
    model_dir.mkdir(parents=True, exist_ok=True)
    for item in lock["files"]:
        path = model_dir / item["local"]
        if path.is_file() and path.stat().st_size == item["bytes"] and sha256(path) == item["sha256"]:
            continue
        url = f"https://huggingface.co/{lock['onnx_repository']}/resolve/{lock['revision']}/{item['remote']}"
        fd, name = tempfile.mkstemp(prefix=path.name, suffix=".tmp", dir=model_dir)
        temporary = Path(name)
        try:
            with os.fdopen(fd, "wb") as output, urllib.request.urlopen(url, timeout=60) as response:
                total = 0
                while chunk := response.read(1024 * 1024):
                    total += len(chunk)
                    if total > item["bytes"]:
                        raise ValueError("download exceeds locked size")
                    output.write(chunk)
            if temporary.stat().st_size != item["bytes"] or sha256(temporary) != item["sha256"]:
                raise ValueError("download checksum/length differs from model lock")
            os.replace(temporary, path)
            print(f"downloaded verified {path.name}: {item['bytes']} bytes", flush=True)
        finally:
            temporary.unlink(missing_ok=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output-dir", type=Path, default=ROOT / "build/semantic-router")
    parser.add_argument("--source-root", type=Path, default=ROOT / "references")
    parser.add_argument("--download", action="store_true", help="Explicitly download checksum-pinned optional model files")
    parser.add_argument("--check", action="store_true", help="Check source/model/vector fingerprints without encoding or writing")
    parser.add_argument("--threads", type=int, default=4)
    parser.add_argument("--batch-size", type=int, default=16)
    args = parser.parse_args()
    if not 1 <= args.threads <= 16 or not 1 <= args.batch_size <= 128:
        parser.error("threads 1..16 and batch-size 1..128 required")
    if args.check and args.download:
        parser.error("--check cannot download")
    lock = json.loads(LOCK.read_text(encoding="utf-8"))
    model_dir = args.output_dir / "model"
    if args.download:
        download_model(model_dir, lock)
    documents, texts, fingerprint = collect(args.source_root)
    target = args.output_dir / "vectors.npy"
    meta_path = args.output_dir / "semantic-meta.json"
    if args.check:
        meta = json.loads(meta_path.read_text(encoding="utf-8"))
        if meta.get("corpus_hash") != fingerprint or meta.get("model_lock_sha256") != sha256(LOCK) or meta.get("documents") != documents or meta.get("vectors_sha256") != sha256(target):
            raise ValueError("semantic index missing or stale; rebuild explicitly")
        for item in lock["files"]:
            if sha256(model_dir / item["local"]) != item["sha256"]:
                raise ValueError("semantic model changed")
        print(f"verified {len(documents)} semantic documents and pinned model")
        return 0
    import numpy as np
    encoder = Encoder(model_dir, lock, args.threads)
    start = time.perf_counter()
    vectors = np.empty((len(documents), lock["dimensions"]), dtype=np.float32)
    # Length sorting avoids wasting attention on padding long/short metadata.
    order = sorted(range(len(texts)), key=lambda i: (len(texts[i]), i))
    for offset in range(0, len(order), args.batch_size):
        ids = order[offset:offset + args.batch_size]
        vectors[ids] = encoder.encode([texts[i] for i in ids])
        if offset % (args.batch_size * 25) == 0:
            print(f"encoded {min(offset + len(ids), len(texts))}/{len(texts)}", flush=True)
    args.output_dir.mkdir(parents=True, exist_ok=True)
    fd, name = tempfile.mkstemp(prefix="vectors-", suffix=".npy", dir=args.output_dir)
    temporary = Path(name)
    try:
        with os.fdopen(fd, "wb") as output:
            np.save(output, vectors, allow_pickle=False)
        os.replace(temporary, target)
    finally:
        temporary.unlink(missing_ok=True)
    meta = {"format": 1, "knowledge_baseline": "cangjie-1.0.5", "corpus_hash": fingerprint, "model_lock_sha256": sha256(LOCK), "vectors_sha256": sha256(target), "vector_bytes": target.stat().st_size, "pooling": lock["pooling"], "max_tokens": lock["max_tokens"], "documents": documents}
    meta_path.write_text(json.dumps(meta, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(f"built {len(documents)} x {lock['dimensions']} semantic vectors, {target.stat().st_size} bytes, {time.perf_counter()-start:.2f} sec")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (ImportError, OSError, ValueError) as error:
        print(f"error: {error}", file=sys.stderr)
        raise SystemExit(2)
