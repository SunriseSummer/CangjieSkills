#!/usr/bin/env python3
"""Build the experimental, dependency-free native document router.

Python is used only at build/training time. The query process reads a bounded,
little-endian inverted index and does not read Markdown or execute Python.
"""
from __future__ import annotations

import argparse
from collections import Counter, defaultdict
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import struct
import subprocess
import sys
import tempfile

sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(Path(__file__).resolve().parent))
from build_knowledge_db import load_records, record_domain

MODEL_ROOT = ROOT / "native" / "doc_router" / "model"
OUTPUT_ROOT = ROOT / "build" / "doc_router"
MAGIC = b"CJROUT1\0"
FEATURE_NAMES = ["log_bm25", "raw_coverage", "title_coverage", "receiver_match", "member_match", "alias_coverage", "exact_selector", "is_leaf", "broad_root", "symbol_pair", "domain_match", "ascii_coverage"]
TOKEN_RE = re.compile(r"[A-Za-z_][A-Za-z0-9_]*|[0-9]+|[\u3400-\u9fff]+")
CAMEL_RE = re.compile(r"[A-Z]+(?=[A-Z][a-z]|\d|$)|[A-Z]?[a-z]+|\d+")


def tokens(value: str) -> list[str]:
    """Match the native ASCII identifier/camel + CJK bigram tokenizer."""
    result = []
    for match in TOKEN_RE.finditer(value):
        word = match.group()
        if "\u3400" <= word[0] <= "\u9fff":
            result.extend(word[i:i+2] for i in range(len(word)-1)) if len(word) > 1 else result.append(word)
        else:
            occurrence = {word.lower()}
            for component in word.split("_"):
                occurrence.update(item.lower() for item in CAMEL_RE.findall(component))
            result.extend(sorted(occurrence))
    return result


def canonical(value: object) -> bytes:
    return json.dumps(value, ensure_ascii=False, sort_keys=True, separators=(",", ":")).encode("utf-8")


def identity(record: dict) -> tuple[str, str]:
    title = re.sub(r"^\d+(?:\.\d+)*[.、]?\s*", "", record["title"]).replace("`", "")
    kind = record["kind"]
    receiver = member = ""
    if kind == "api-member":
        if "." in title.split("(", 1)[0]:
            receiver, member = title.split(".", 1)
            receiver = receiver.split("<", 1)[0]
            member = re.split(r"[<(\s]", member)[0]
        else:
            member = re.split(r"[<(\s]", title)[0]
    elif kind == "api-type":
        receiver = re.split(r"[<(:\s]", title)[0]
    elif record["path"].startswith("language/collections/"):
        parts = record["path"].split("/")
        if len(parts) > 2:
            receiver = parts[2]
    elif kind == "api-member-index":
        member = re.split(r"[<(\s]", title)[0]
    return receiver.lower(), member.lower()


def encode_index(source_root: Path, model_root: Path = MODEL_ROOT) -> tuple[bytes, dict]:
    records = sorted(load_records(source_root), key=lambda r: r["path"])
    aliases = json.loads((model_root / "routing_aliases.json").read_text(encoding="utf-8"))
    model = json.loads((model_root / "ranker.json").read_text(encoding="utf-8"))
    if aliases.get("format") != 1 or model.get("format") != 1 or model.get("feature_names") != FEATURE_NAMES:
        raise ValueError("unsupported alias/ranker schema or feature order")
    weights = model.get("weights", [])
    if len(weights) != len(FEATURE_NAMES) or any(not isinstance(x, (int, float)) or not __import__('math').isfinite(x) for x in weights):
        raise ValueError("ranker must have 12 finite feature weights")
    rules = aliases["rules"]
    digest = hashlib.sha256()
    digest.update(b"CJROUT1:index-v2;token-v1;body-chars=12000;metadata-field-v1\0")
    digest.update(canonical(aliases)); digest.update(canonical(model))
    postings: dict[str, list[tuple[int, float]]] = defaultdict(list)
    metadata_postings: dict[str, list[tuple[int, float]]] = defaultdict(list)
    documents = []
    document_metadata = []
    seen_ids, seen_paths = set(), set()
    total_length = 0
    total_metadata_length = 0
    for docid, record in enumerate(records):
        relative = record["path"]
        path = source_root / relative
        if Path(relative).is_absolute() or ".." in Path(relative).parts or not path.resolve().is_relative_to(source_root.resolve()):
            raise ValueError(f"unsafe source path: {relative}")
        if record["id"] in seen_ids or relative in seen_paths:
            raise ValueError(f"duplicate manifest record: {record['id']} / {relative}")
        seen_ids.add(record["id"]); seen_paths.add(relative)
        body = path.read_text(encoding="utf-8-sig")
        digest.update(canonical(record)); digest.update(b"\0"); digest.update(body.encode("utf-8")); digest.update(b"\0")
        # Headers describe exact API ownership; full body provides lower-weight recall.
        signature = " ".join(record.get("signatures") or [record.get("signature", "")])
        fields = [(record["id"], 3.0), (record["title"], 5.0), (signature, 3.0), (record.get("summary", ""), 2.0), (body[:12000], .3)]
        counts: dict[str, float] = defaultdict(float)
        for text, weight in fields:
            for token, count in Counter(tokens(text)).items():
                if len(token.encode("utf-8")) <= 256:
                    counts[token] += min(count, 8) * weight
        doclen = max(1, round(sum(counts.values())))
        total_length += doclen
        receiver, member = identity(record)
        documents.append((record["id"], "references/" + relative, record["title"], record_domain(record), record["kind"], receiver, member, doclen))
        for token, tf in counts.items():
            postings[token].append((docid, tf))
        # A separate short metadata lane avoids having the long body length
        # normalize away an exact heading/contract match. Inherited IDs and
        # paths deliberately stay out of this lane: they name ownership, not
        # necessarily the subject explained by this particular page.
        metadata_counts: dict[str, float] = defaultdict(float)
        metadata_fields = [(record["title"], 3.0), (signature, 1.5), (record.get("summary", ""), 1.0)]
        for text, weight in metadata_fields:
            for token, count in Counter(tokens(text)).items():
                if len(token.encode("utf-8")) <= 256:
                    metadata_counts[token] += min(count, 4) * weight
        metadata_length = max(1, round(sum(metadata_counts.values())))
        total_metadata_length += metadata_length
        document_metadata.append((str(record.get("summary", "")), str(record.get("parent", "")), metadata_length))
        for token, tf in metadata_counts.items():
            metadata_postings[token].append((docid, tf))
    output = bytearray(MAGIC)
    def u32(value): output.extend(struct.pack("<I", value))
    def f32(value): output.extend(struct.pack("<f", value))
    def string(value):
        encoded = value.encode("utf-8"); u32(len(encoded)); output.extend(encoded)
    u32(2); string(digest.hexdigest()); u32(len(documents))
    for document in documents:
        for value in document[:-1]: string(value)
        u32(document[-1])
    u32(len(postings))
    for term, posting in sorted(postings.items()):
        string(term); u32(len(posting))
        for docid, tf in posting: u32(docid); f32(tf)
    u32(len(rules))
    for rule in rules:
        string(rule["trigger"]); u32(len(rule["expansions"]))
        for value in rule["expansions"]: string(value)
    u32(len(weights))
    for value in weights: f32(value)
    metadata_offset = len(output)
    u32(len(document_metadata))
    for summary, parent, metadata_length in document_metadata:
        string(summary); string(parent); u32(metadata_length)
    u32(len(metadata_postings))
    for term, posting in sorted(metadata_postings.items()):
        string(term); u32(len(posting))
        for docid, tf in posting: u32(docid); f32(tf)
    metadata = {"format": 2, "knowledge_baseline": "cangjie-1.0.5", "corpus_hash": digest.hexdigest(), "documents": len(documents), "terms": len(postings), "postings": sum(map(len, postings.values())), "index_bytes": len(output), "average_weighted_document_length": round(total_length / len(documents), 3), "feature_names": FEATURE_NAMES, "weights": weights, "body_character_limit": 12000, "metadata_terms": len(metadata_postings), "metadata_postings": sum(map(len, metadata_postings.values())), "metadata_bytes": len(output) - metadata_offset, "average_metadata_length": round(total_metadata_length / len(documents), 3)}
    return bytes(output), metadata


def atomic_write(path: Path, value: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    fd, name = tempfile.mkstemp(prefix=path.name+".", suffix=".tmp", dir=path.parent)
    try:
        with os.fdopen(fd, "wb") as f: f.write(value)
        os.replace(name, path)
    finally:
        if Path(name).exists(): Path(name).unlink()


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source-root", type=Path, default=ROOT / "references")
    parser.add_argument("--output-dir", type=Path, default=OUTPUT_ROOT)
    parser.add_argument("--check", action="store_true", help="Verify deterministic index/metadata against current corpus/model; do not modify files")
    parser.add_argument("--no-compile", action="store_true", help="Only generate/check index and build metadata")
    parser.add_argument("--cxx", default=os.environ.get("CXX", "g++"))
    args = parser.parse_args()
    index, metadata = encode_index(args.source_root)
    index_path, metadata_path = args.output_dir / "router.idx", args.output_dir / "index-meta.json"
    encoded_meta = json.dumps(metadata, ensure_ascii=False, indent=2).encode("utf-8") + b"\n"
    if args.check:
        if not index_path.is_file() or index_path.read_bytes() != index or not metadata_path.is_file() or metadata_path.read_bytes() != encoded_meta:
            raise ValueError("native router index is missing or stale; run python scripts/maintenance/build_router.py")
        print(f"verified {index_path}: {metadata['documents']} documents, {len(index)} bytes")
        return 0
    atomic_write(index_path, index); atomic_write(metadata_path, encoded_meta)
    if not args.no_compile:
        compiler = shutil.which(args.cxx)
        if not compiler: raise ValueError(f"C++17 compiler not found: {args.cxx}; use --no-compile to build only the index")
        executable = args.output_dir / "cj-doc-router"
        subprocess.run([compiler, "-std=c++17", "-O3", "-DNDEBUG", "-Wall", "-Wextra", "-Wpedantic", str(ROOT / "native/doc_router/main.cpp"), "-o", str(executable)], check=True)
        print(f"compiled {executable}")
    print(f"wrote {index_path}: {metadata['documents']} documents, {metadata['terms']} terms, {len(index)} bytes")
    return 0


if __name__ == "__main__":
    try: raise SystemExit(main())
    except (OSError, ValueError, subprocess.CalledProcessError) as exc:
        print(f"error: {exc}", file=sys.stderr); raise SystemExit(2)
