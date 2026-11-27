"""Optional semantic route protocol/privacy tests; no remote calls or new labels."""
from __future__ import annotations
import argparse
import importlib.util
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(ROOT / "scripts"))
import semantic_router


class SemanticProtocolTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        if any(importlib.util.find_spec(name) is None for name in ("numpy", "onnxruntime", "tokenizers")) or not (ROOT / "build/semantic-router/semantic-meta.json").is_file():
            raise unittest.SkipTest("optional semantic model/index/dependencies not installed")
        cls.args = argparse.Namespace(index=ROOT / "build/semantic-router", mode="dense", threads=1, domain=[], top_k=5, min_similarity=.65, explain=True)
        cls.router = semantic_router.SemanticRouter(cls.args)

    @classmethod
    def tearDownClass(cls):
        cls.router.close()

    def test_telemetry_opt_out_precedes_onnx_import(self):
        source = Path(semantic_router.__file__).read_text()
        self.assertLess(source.index('os.environ["ORT_DISABLE_TELEMETRY"] = "1"'), source.index('import onnxruntime as ort'))
        code = "import os,sys;os.environ.pop('ORT_DISABLE_TELEMETRY',None);sys.modules['onnxruntime']=object();sys.path.insert(0,'scripts');import semantic_router"
        result = subprocess.run([sys.executable, "-c", code], cwd=ROOT, capture_output=True, text=True)
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("before telemetry opt-out", result.stderr)

    def test_empty_and_punctuation_abstain(self):
        for query in ("", "  ", "！？🌸"):
            answer = self.router.search(query)
            self.assertEqual(answer["status"], "no_match")
            self.assertEqual(answer["paths"], [])

    def test_exact_path_existing_and_stable(self):
        path = "references/api/std/collection/classes/arraylist/reverse.md"
        result = self.router.search(path)
        self.assertEqual(result["paths"], [path])
        self.assertTrue((ROOT / path).is_file())
        self.assertEqual(result, self.router.search(path))

    def test_cls_embeddings_normalized(self):
        import numpy as np
        vectors = self.router.encoder.encode(["中文概念", "ArrayList reverse"])
        self.assertEqual(vectors.shape, (2, 512))
        np.testing.assert_allclose(np.linalg.norm(vectors, axis=1), 1.0, atol=1e-5)

    def test_limits_reject_without_network(self):
        for query in ("x" * 16385, "String\x00fromUtf8"):
            with self.assertRaises(ValueError):
                self.router.search(query)

    def test_metadata_traversal_and_duplicate_ids_rejected(self):
        original = json.loads((self.args.index / "semantic-meta.json").read_text())
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            args = argparse.Namespace(**vars(self.args));args.index=root
            for mutation in ("references/../escape.md", "references\\escape.md", "/tmp/escape.md"):
                payload = json.loads(json.dumps(original));payload["documents"][0]["path"]=mutation
                (root / "semantic-meta.json").write_text(json.dumps(payload))
                with self.assertRaises(ValueError):
                    semantic_router.SemanticRouter(args)
            payload = json.loads(json.dumps(original));payload["documents"][1]["id"]=payload["documents"][0]["id"]
            (root / "semantic-meta.json").write_text(json.dumps(payload))
            with self.assertRaises(ValueError):
                semantic_router.SemanticRouter(args)

    def test_jsonl_warm_protocol(self):
        queries = ["references/api/std/collection/classes/arraylist/reverse.md", "！？", "怎么处理异常"]
        command = [sys.executable, str(ROOT / "scripts/semantic_router.py"), "--index", str(self.args.index), "--mode", "dense", "--stdin", "--top-k", "2"]
        process = subprocess.run(command, input="\n".join(queries)+"\n", capture_output=True, text=True, encoding="utf-8", timeout=30, check=True)
        lines = process.stdout.splitlines()
        self.assertEqual(len(lines), len(queries))
        for query,line in zip(queries,lines):
            result = json.loads(line)["queries"][0]
            self.assertEqual(result["query"],query)
            self.assertLessEqual(len(result["paths"]),2)
            self.assertTrue(all((ROOT / path).is_file() for path in result["paths"]))


if __name__ == "__main__":
    unittest.main()
