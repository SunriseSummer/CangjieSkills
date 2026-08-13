#!/usr/bin/env python3
"""Unit and integration tests for semantic subtree document queries."""

from __future__ import annotations

import argparse
import json
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path


SCRIPT_DIR = Path(__file__).resolve().parent
DEV_ROOT = SCRIPT_DIR.parents[1]
SKILL_ROOT = DEV_ROOT / ".agents" / "skills" / "cangjie-coding"
SEARCH_SCRIPT = SKILL_ROOT / "scripts" / "search_docs.py"
RETRIEVAL_QUERIES = SCRIPT_DIR / "data" / "retrieval-evaluation-queries.json"
sys.dont_write_bytecode = True
sys.path.insert(0, str(SKILL_ROOT / "scripts"))
import search_docs


def args(**overrides: object) -> argparse.Namespace:
    defaults: dict[str, object] = {
        "domain": [],
        "kind": [],
        "all_terms": False,
        "max_results": 8,
        "node": [],
        "force": False,
        "estimate": False,
        "max_pages": search_docs.DEFAULT_MAX_PAGES,
        "max_chars": search_docs.DEFAULT_MAX_CHARS,
        "view": "leaves",
        "depth": None,
    }
    defaults.update(overrides)
    return argparse.Namespace(**defaults)


class SearchDocsTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.catalog = search_docs.build_catalog(search_docs.load_records())

    def test_natural_title_prefers_shallowest_semantic_node(self) -> None:
        query = "集合类型"
        root = search_docs.resolve_query_node(
            query, search_docs.terms_for(query), self.catalog, args()
        )
        self.assertEqual(root["id"], "language.collections")

    def test_chinese_subject_action_query_matches_separated_prose(self) -> None:
        self.assertTrue(search_docs.term_present("打开文件并写入字节", "文件写入"))
        self.assertFalse(search_docs.term_present("文件仅支持读取", "文件写入"))

    def test_ascii_terms_keep_identifier_boundaries(self) -> None:
        self.assertTrue(search_docs.term_present("std.net package", "net"))
        self.assertFalse(search_docs.term_present("internet package", "net"))
        self.assertFalse(search_docs.term_present("net_value", "net"))
        hits = search_docs.manifest_hits(
            "文件写入", search_docs.terms_for("文件写入"), args(domain=["std"])
        )
        self.assertTrue(hits)

    def test_folded_match_path_preserves_public_match_semantics(self) -> None:
        cases = (
            ("ArrayList add", "arraylist"),
            ("异常：FSException", "exceptions"),
            ("文件 写入", "文件写入"),
            ("TokenKind.NL 换行", "newline"),
        )
        for text, term in cases:
            with self.subTest(text=text, term=term):
                self.assertEqual(
                    search_docs.term_present(text, term),
                    search_docs.folded_term_present(text.casefold(), term.casefold()),
                )

    def test_small_bilingual_intent_aliases_reach_chinese_contracts(self) -> None:
        self.assertTrue(search_docs.term_present("异常：FSException", "exceptions"))
        self.assertTrue(search_docs.term_present("写入标准错误流", "stderr"))
        self.assertTrue(search_docs.term_present("严格 JSON 校验器", "strict"))
        self.assertTrue(search_docs.term_present("常用规则分类", "rules"))
        self.assertTrue(search_docs.term_present("格式化文件与目录", "directory"))
        self.assertTrue(search_docs.term_present("ServerBuilder", "httpserverbuilder"))
        self.assertTrue(search_docs.term_present("初始化项目", "init"))
        self.assertTrue(search_docs.term_present("创建可执行工程", "project"))
        self.assertTrue(search_docs.term_present("创建可执行工程", "executable"))
        self.assertFalse(search_docs.term_present("普通 HTTP 客户端", "httpserver"))
        self.assertTrue(search_docs.term_present("阻塞的入队操作", "blocked"))
        self.assertFalse(search_docs.term_present("非阻塞的入队操作", "blocked"))

    def test_cjpm_initialization_query_prefers_the_tool_topic(self) -> None:
        query = "cjpm init executable project"
        hits = search_docs.manifest_hits(
            query, search_docs.terms_for(query), args(), limit=None
        )
        selected = search_docs.compact_routing_hits(hits, query, 1)
        self.assertEqual(selected[0].record["id"], "tools.cjpm")

    def test_tuple_sort_query_exposes_constraint_and_custom_overload(self) -> None:
        query = "sort ArrayList tuple comparator"
        comparable = "std.sort.func.sort.sort-t-arraylist-t-bool-bool-where-t-comparable-t"
        comparator = "std.sort.func.sort.sort-t-arraylist-t-t-t-bool-bool-bool"
        hits = search_docs.manifest_hits(
            query, search_docs.terms_for(query), args(domain=["std"]), limit=None
        )
        selected = search_docs.compact_routing_hits(hits, query, 2)
        by_id = {hit.record["id"]: hit.record for hit in selected}
        self.assertEqual(set(by_id), {comparable, comparator})
        self.assertIn("元组", by_id[comparable]["summary"])
        self.assertIn("lessThan", by_id[comparator]["summary"])

    def test_overload_index_filters_signatures_and_attaches_exact_contracts(self) -> None:
        query = "sort lessThan lambda closure example"
        hits = search_docs.manifest_hits(
            query, search_docs.terms_for(query), args(domain=["std"]), limit=None
        )
        selected = search_docs.compact_routing_hits(hits, query, 1)
        self.assertEqual(selected[0].record["id"], "std.sort.func.sort")
        signatures = search_docs.output_signatures(selected[0])
        self.assertTrue(signatures)
        self.assertTrue(all("lessThan!" in item for item in signatures))
        contracts = search_docs.focused_child_contracts(selected[0])
        self.assertTrue(contracts)
        self.assertTrue(all("lessThan!" in item["signature"] for item in contracts))
        self.assertTrue(search_docs.ordinary_use_ready(selected[0]))

    def test_multifield_sort_query_reaches_verified_less_than_example(self) -> None:
        query = "sort tuple lessThan lambda multi field comparator"
        hits = search_docs.manifest_hits(
            query, search_docs.terms_for(query), args(), limit=None
        )
        selected = search_docs.compact_routing_hits(hits, query, 3)
        self.assertIn(
            "examples.collections.sort-by-comparator",
            {hit.record["id"] for hit in selected},
        )

    def test_optional_argument_mode_exposes_empty_callback_contract(self) -> None:
        query = "ArgumentMode OptionalValue empty callback"
        hits = search_docs.manifest_hits(
            query, search_docs.terms_for(query), args(domain=["std"]), limit=None
        )
        selected = search_docs.compact_routing_hits(hits, query, 1)
        self.assertEqual(
            selected[0].record["id"],
            "std.argopt.enum.argumentmode.value-optionalvalue",
        )
        self.assertIn("空字符串", selected[0].record["summary"])

    def test_cjpm_run_args_equals_query_reaches_boundary_contract(self) -> None:
        query = "cjpm run-args equals OptionalValue"
        expected = "tools.cjpm.3-常用命令选项表.3-2-run-选项"
        hits = search_docs.manifest_hits(
            query, search_docs.terms_for(query), args(domain=["tools"]), limit=None
        )
        selected = search_docs.compact_routing_hits(hits, query, 3)
        by_id = {hit.record["id"]: hit.record for hit in selected}
        self.assertIn(expected, by_id)
        self.assertIn("拆成两个实参", by_id[expected]["summary"])

    def test_adjacent_ecosystem_names_route_to_exact_cangjie_symbols(self) -> None:
        cases = {
            "Rune isDigit": "std.unicode.interface.unicoderuneextension.isnumber",
            "FileInfo isFile": "std.fs.struct.fileinfo.isregular",
            "ArrayList append": "std.collection.class.arraylist.add",
            "HashMap put": "std.collection.class.hashmap.operator-indexer",
            "ReentrantMutex condition": "std.sync.class.mutex.condition",
        }
        for query, expected in cases.items():
            with self.subTest(query=query):
                hits = search_docs.manifest_hits(
                    query, search_docs.terms_for(query), args(), limit=None
                )
                selected = search_docs.compact_routing_hits(hits, query, 3)
                self.assertIn(expected, {hit.record["id"] for hit in selected})

    def test_query_terms_are_deduplicated_in_original_order(self) -> None:
        self.assertEqual(
            search_docs.terms_for("HttpRequest body HttpResponse body"),
            ["httprequest", "body", "httpresponse"],
        )

    def test_code_shaped_literals_do_not_add_one_character_noise(self) -> None:
        self.assertEqual(
            search_docs.terms_for("Byte literal byte b'a' b'0'"),
            ["byte", "literal"],
        )

    def test_identifier_acronyms_are_searchable(self) -> None:
        aliases = search_docs.with_identifier_aliases("Float64.getPI HttpRequest")
        self.assertTrue(search_docs.term_present(aliases, "PI"))
        self.assertTrue(search_docs.term_present(aliases, "HTTP"))
        self.assertTrue(search_docs.term_present(search_docs.with_identifier_aliases("cffi"), "FFI"))

    def test_generic_navigation_label_does_not_displace_specific_topic(self) -> None:
        query = "应用示例 网络"
        terms = search_docs.routing_terms_for(query)
        self.assertEqual(terms, ["网络"])
        hits = search_docs.manifest_hits(
            query, terms, args(domain=["examples"]), limit=None
        )
        compact = search_docs.compact_routing_hits(hits, query, 4)
        self.assertTrue(compact)
        self.assertTrue(str(compact[0].record["id"]).startswith("examples.network"))

    def test_cangjie_prefix_does_not_displace_the_real_subject(self) -> None:
        query = "Cangjie enum Equatable ToString Exception Object"
        terms = search_docs.routing_terms_for(query)
        self.assertEqual(terms[0], "enum")
        hits = search_docs.manifest_hits(query, terms, args(), limit=None)
        compact = search_docs.compact_routing_hits(hits, query, 5)
        ids = {hit.record["id"] for hit in compact}
        self.assertTrue(
            any(str(item).startswith("language.enum") for item in ids),
            f"top5={sorted(ids)}",
        )

    def test_common_english_terms_reach_cangjie_contracts(self) -> None:
        cases = {
            "named arguments": "language.function.2-函数调用.2-3-命名参数调用",
            "String substring slice": "language.string.14-下标访问与切片.14-2-切片",
            "compiler warnings unused": "tools.cjc.2-核心选项速查.2-12-警告控制与零警告验收",
        }
        for query, expected in cases.items():
            with self.subTest(query=query):
                hits = search_docs.manifest_hits(
                    query, search_docs.routing_terms_for(query), args(), limit=None
                )
                top_five = {
                    hit.record["id"]
                    for hit in search_docs.compact_routing_hits(hits, query, 5)
                }
                self.assertIn(expected, top_five, f"top5={sorted(top_five)}")

    def test_camel_case_api_fragments_are_searchable_terms(self) -> None:
        aliases = search_docs.with_identifier_aliases("readBigEndian writeLittleEndian")
        self.assertTrue(search_docs.term_present(aliases.casefold(), "bigendian"))
        self.assertTrue(search_docs.term_present(aliases.casefold(), "littleendian"))
        query = "BigEndian LittleEndian write read integer"
        hits = search_docs.manifest_hits(query, search_docs.terms_for(query), args(domain=["std"]))
        top_five = {hit.record["id"] for hit in hits[:5]}
        self.assertTrue(any("bigendian" in item or "littleendian" in item for item in top_five))

    def test_exact_symbol_subject_outranks_generic_trailing_words(self) -> None:
        query = "ParsedArguments option value get"
        hits = search_docs.manifest_hits(
            query, search_docs.terms_for(query), args(domain=["std"])
        )
        self.assertEqual(hits[0].record["id"], "std.argopt.struct.parsedarguments")

    def test_exact_member_leaf_outranks_its_type_overview(self) -> None:
        query = "ArrayList reverse"
        hits = search_docs.manifest_hits(
            query, search_docs.terms_for(query), args(domain=["std"]), limit=None
        )
        selected = search_docs.compact_routing_hits(hits, query, 1)
        self.assertEqual(selected[0].record["id"], "std.collection.class.arraylist.reverse")
        self.assertIn("reverse(): Unit", selected[0].record["signatures"])

    def test_overload_leaf_uses_summary_receiver_when_signature_is_generic(self) -> None:
        cases = {
            "Int64 writeBigEndian": "将 Int64 值以大端序",
            "Float64 writeLittleEndian": "将 Float64 值以小端序",
        }
        for query, expected_summary in cases.items():
            with self.subTest(query=query):
                hits = search_docs.manifest_hits(
                    query, search_docs.terms_for(query), args(domain=["std"]), limit=None
                )
                selected = search_docs.compact_routing_hits(hits, query, 1)
                self.assertIn(expected_summary, selected[0].record["summary"])
                self.assertEqual(selected[0].record["kind"], "api-member")

    def test_natural_integer_conversion_reaches_fixed_width_contract(self) -> None:
        query = "UInt16 toInt64"
        hits = search_docs.manifest_hits(
            query, search_docs.terms_for(query), args(domain=["std"]), limit=None
        )
        selected = search_docs.compact_routing_hits(hits, query, 1)
        self.assertEqual(selected[0].record["id"], "std.core.intrinsic.uint16.position")

        bigint_query = "BigInt toInt64"
        bigint_hits = search_docs.manifest_hits(
            bigint_query, search_docs.terms_for(bigint_query), args(domain=["std"]), limit=None
        )
        bigint_selected = search_docs.compact_routing_hits(bigint_hits, bigint_query, 1)
        self.assertEqual(bigint_selected[0].record["id"], "std.math.numeric.struct.bigint.toint64")

    def test_common_cross_language_intents_route_to_cangjie_names(self) -> None:
        cases = {
            "environment variable getenv": "std.env.func.getvariable-string",
            "queue enqueue": "std.collection.interface.queue.add",
            "queue dequeue": "std.collection.interface.queue.remove",
            "format precision alignment": "std.convert.interface.formattable",
        }
        for query, expected_prefix in cases.items():
            with self.subTest(query=query):
                hits = search_docs.manifest_hits(query, search_docs.terms_for(query), args(), limit=None)
                selected = search_docs.compact_routing_hits(hits, query, 3)
                self.assertTrue(
                    any(str(hit.record["id"]).startswith(expected_prefix) for hit in selected),
                    f"top3={[hit.record['id'] for hit in selected]}",
                )

    def test_tuple_vocabulary_routes_to_language_rules_and_examples(self) -> None:
        cases = {
            "tuple field access destructuring": {
                "language.basic_data_type.8-元组类型.8-1-元素访问",
                "language.for.4-迭代进阶.4-1-元组解构",
            },
            "HashMap tuple iteration key value": {
                "language.collections.hashmap.7-遍历",
                "language.for.4-迭代进阶.4-1-元组解构",
                "examples.collections.hashmap-tuple-iteration",
            },
        }
        for query, expected in cases.items():
            with self.subTest(query=query):
                hits = search_docs.manifest_hits(query, search_docs.terms_for(query), args(), limit=None)
                selected = search_docs.compact_routing_hits(hits, query, 3)
                self.assertTrue(
                    {hit.record["id"] for hit in selected} & expected,
                    f"top3={[hit.record['id'] for hit in selected]}",
                )

    def test_cooperating_api_query_keeps_verified_composition_visible(self) -> None:
        query = "ConcurrentHashMap AtomicInt64 key counter"
        hits = search_docs.manifest_hits(query, search_docs.terms_for(query), args(), limit=None)
        selected = search_docs.compact_routing_hits(hits, query, 2)
        self.assertIn(
            "examples.concurrency.concurrent-key-counter",
            {hit.record["id"] for hit in selected},
        )

    def test_blocking_container_lifecycle_query_reaches_single_lock_example(self) -> None:
        query = "ArrayBlockingQueue close blocked sender drain wake Condition"
        hits = search_docs.manifest_hits(
            query, search_docs.terms_for(query), args(), limit=None
        )
        selected = search_docs.compact_routing_hits(hits, query, 3)
        self.assertIn(
            "examples.concurrency.bounded-channel-lifecycle",
            {hit.record["id"] for hit in selected},
        )

    def test_pi_query_reaches_active_floating_point_member(self) -> None:
        query = "PI std.math"
        hits = search_docs.manifest_hits(
            query, search_docs.terms_for(query), args(domain=["std"]), limit=None
        )
        selected = search_docs.compact_routing_hits(hits, query, 1)
        self.assertEqual(selected[0].record["id"], "std.math.interface.floatingpoint.getpi")

    def test_qualified_package_prefix_beats_neighbor_package(self) -> None:
        query = "std.math abs sqrt"
        hits = search_docs.manifest_hits(
            query, search_docs.terms_for(query), args(domain=["std"]), limit=None
        )
        selected = search_docs.compact_routing_hits(hits, query, 1)
        self.assertEqual(selected[0].record["id"], "std.math")

    def test_common_intent_words_route_to_recommended_surfaces(self) -> None:
        cases = {
            "Byte literal byte b'a' b'0'": "std.core.type.byte",
            "Float64 isFinite": "std.core.intrinsic.float64",
            "String uppercase toUpper": "std.unicode.interface.unicodestringextension.toupper",
        }
        for query, expected in cases.items():
            with self.subTest(query=query):
                hits = search_docs.manifest_hits(
                    query, search_docs.terms_for(query), args(), limit=None
                )
                selected = search_docs.compact_routing_hits(hits, query, 3)
                self.assertIn(expected, {hit.record["id"] for hit in selected})

    def test_rune_and_macro_codegen_queries_reach_precise_rules_in_top_three(self) -> None:
        cases = {
            "Rune literal UInt32 code point": {
                "std.core.intrinsic.rune",
                "language.basic_data_type.4-字符类型-rune.支持的运算",
                "examples.text.rune-code-point",
            },
            "macro multiple statements newline cangjieLex TokenKind.NL": {
                "language.macro.overview.4-std-ast-包与语法节点.4-7-辅助工具函数",
                "examples.macros.multi-statement-codegen",
            },
        }
        for query, expected in cases.items():
            with self.subTest(query=query):
                hits = search_docs.manifest_hits(
                    query, search_docs.routing_terms_for(query), args(), limit=None
                )
                selected = search_docs.compact_routing_hits(hits, query, 3)
                self.assertTrue(
                    {hit.record["id"] for hit in selected} & expected,
                    f"top3={[hit.record['id'] for hit in selected]}",
                )

    def test_query_shape_note_only_flags_large_symbol_bundles(self) -> None:
        broad = "Cangjie class Exception ToString ArrayList HashMap String Rune Float64 parse conversion"
        self.assertIn("repeat --query", search_docs.query_shape_note(broad))
        self.assertIn(
            "repeat --query",
            search_docs.query_shape_note("String Rune ArrayList HashMap"),
        )
        self.assertEqual(search_docs.query_shape_note("ArrayList reverse"), "")

    def test_array_initialization_query_surfaces_constructor_rows(self) -> None:
        query = "Array Float64 initialization"
        hits = search_docs.manifest_hits(
            query, search_docs.terms_for(query), args(domain=["std"]), limit=None
        )
        selected = search_docs.compact_routing_hits(hits, query, 1)
        self.assertEqual(selected[0].record["id"], "std.core.struct.array.init")
        self.assertTrue(any("init" in line for line in selected[0].record["signatures"]))

    def test_prebuilt_content_index_covers_every_manifest_page(self) -> None:
        pages = search_docs.load_search_content_index()
        expected_paths = {record["path"] for record in search_docs.load_records()}
        self.assertEqual(set(pages), expected_paths)
        sample = "examples/cli-process/command-line-arguments.md"
        self.assertIn("getCommandLineArgs", pages[sample])

    def test_search_content_omits_generated_parent_backlink(self) -> None:
        content = """<!-- cj-doc kind=example-leaf -->
# 解析整数

[← 字符串、正则与文本解析](index.md)

用 Int64.parse 解析整数。
"""
        prepared = search_docs.prepare_search_content(content)
        self.assertNotIn("正则", prepared)
        self.assertIn("Int64.parse", prepared)

    def test_matching_snippets_do_not_expose_cjtest_fence_metadata(self) -> None:
        record = next(
            item for item in search_docs.load_records()
            if item["id"] == "language.basic_data_type.4-字符类型-rune.支持的运算"
        )
        snippets = search_docs.matching_snippets(record, ["decimaldigit"])
        self.assertTrue(snippets)
        self.assertFalse(any(item.startswith("```") for item in snippets))

    def test_category_backlink_does_not_create_false_regex_match(self) -> None:
        query = "正则"
        hits = search_docs.manifest_hits(
            query, search_docs.terms_for(query), args(domain=["examples"]), limit=None
        )
        ids = {hit.record["id"] for hit in hits}
        self.assertIn("examples.text.regex-find-all", ids)
        self.assertNotIn("examples.text.int64-parse", ids)

    def test_fuzzy_subtree_query_prefers_overview_over_detail_leaf(self) -> None:
        query = "HTTP"
        root = search_docs.resolve_query_node(
            query, search_docs.terms_for(query), self.catalog, args()
        )
        self.assertTrue(self.catalog.children.get(root["id"]))

    def test_fuzzy_example_query_uses_closest_category_not_examples_root(self) -> None:
        query = "Deflate Base64 JsonValue HTTP"
        root = search_docs.resolve_query_node(
            query, search_docs.terms_for(query), self.catalog, args(domain=["examples"])
        )
        self.assertEqual(root["id"], "examples.network")

    def test_first_query_term_anchors_multiword_subject(self) -> None:
        enum_query = "enum pattern matching"
        interface_query = "interface declaration function syntax"
        enum_hits = search_docs.manifest_hits(
            enum_query, search_docs.terms_for(enum_query), args(domain=["language"])
        )
        interface_hits = search_docs.manifest_hits(
            interface_query, search_docs.terms_for(interface_query), args(domain=["language"])
        )
        self.assertEqual(enum_hits[0].record["id"], "language.enum")
        self.assertEqual(interface_hits[0].record["id"], "language.interface")

    def test_representative_queries_reach_expected_page_in_top_three(self) -> None:
        cases = [
            ("文件写入", ["std"], {"examples.files.file-write", "std.fs.class.file.writeto", "guides.std.fs.1-file-类"}),
            ("UTF-8 文件读取", ["std"], {"examples.files.file-read", "std.fs.class.file.readfrom"}),
            ("HashMap 计数", ["std"], {"examples.collections.hashmap-counting"}),
            ("String split", ["language"], {"language.string.7-分割.7-1-split-按分隔符分割"}),
            ("cjpm run arguments", ["tools"], {"tools.cjpm.3-常用命令选项表.3-2-run-选项"}),
            ("cjpm test source directory", ["tools"], {"tools.cjpm.3-常用命令选项表.3-3-test-选项"}),
            ("DataModel toJson fromJson nested object", ["stdx"], {"examples.json.json-roundtrip"}),
            ("Regex findAll", ["std"], {"std.regex.class.regex.findall"}),
            ("DateTime parse", ["std"], {"std.time.struct.datetime.parse"}),
            ("AtomicInt64 fetchAdd", ["std"], {"std.sync.class.atomicint64.fetchadd"}),
            ("C pointer array FFI", ["language"], {"language.cffi.overview.3-内存管理.3-3-acquirearrayrawdata-releasearrayrawdata"}),
            ("ParsedArguments option value get", ["std"], {"std.argopt.struct.parsedarguments"}),
            ("Float64 parse std.convert import", ["std"], {
                "std.convert.interface.parsable.extension.extend-float64-parsable-float64",
                "language.basic_data_type.1-整数类型.1-6-数值类型转换",
            }),
            ("String split maxSplits removeEmpty signature", ["std"], {
                "std.core.struct.string.split",
            }),
        ]
        for query, domains, expected in cases:
            with self.subTest(query=query):
                hits = search_docs.manifest_hits(
                    query, search_docs.terms_for(query), args(domain=domains)
                )
                top_three = {hit.record["id"] for hit in hits[:3]}
                self.assertTrue(top_three & expected, f"top3={sorted(top_three)}")

    def test_broad_retrieval_evaluation_set_never_returns_empty(self) -> None:
        queries = json.loads(RETRIEVAL_QUERIES.read_text(encoding="utf-8"))
        self.assertGreaterEqual(len(queries), 40)
        for query in queries:
            with self.subTest(query=query):
                hits = search_docs.manifest_hits(query, search_docs.terms_for(query), args())
                self.assertTrue(hits)

    def test_newly_audited_queries_reach_the_correct_page_in_top_three(self) -> None:
        cases = {
            "C FFI Lambda unsafe": {"examples.cffi.unsafe-lambda"},
            "where 多个接口约束": {
                "examples.abstractions.generic-constraint",
                "language.generic.7-泛型约束",
                "language.generic.7-泛型约束.7-5-规则",
            },
            "MonoTime now elapsed Duration": {"std.time.struct.monotime", "examples.time.monotime-elapsed"},
            "HttpServer": {"stdx.net.http.class.server"},
            "HttpServerBuilder afterBind closeGracefully onShutdown": {
                "stdx.net.http.class.serverbuilder",
                "examples.network.http-local-roundtrip",
            },
            "JsonValue strict JSON": {"stdx.encoding.json.class.jsonvalue.fromstr"},
            "File.readFrom exceptions": {"std.fs.class.file.readfrom"},
            "getGlobalLogger setGlobalLogger Attr": {"stdx.log"},
            "cjlint rules": {
                "tools.cjlint",
                "tools.cjlint.4-告警屏蔽.4-1-规则级屏蔽",
                "tools.cjlint.5-常用规则分类.5-1-命名规范-g-nam",
            },
            "cjfmt cjlint 质量门禁": {"examples.code-quality.format-lint-gate"},
        }
        for query, expected in cases.items():
            with self.subTest(query=query):
                hits = search_docs.manifest_hits(query, search_docs.terms_for(query), args())
                top_three = {hit.record["id"] for hit in hits[:3]}
                self.assertTrue(top_three & expected, f"top3={sorted(top_three)}")

    def test_application_examples_are_flat_and_filterable_without_library_directories(self) -> None:
        root = search_docs.resolve_exact_selector("examples", self.catalog, args())
        categories = self.catalog.children[root["id"]]
        self.assertTrue(categories)
        self.assertTrue(all(record["kind"] == "example-category" for record in categories))
        self.assertFalse(any("/std/" in record["path"] or "/stdx/" in record["path"] for record in categories))
        network = search_docs.resolve_exact_selector("examples.network", self.catalog, args())
        leaves = self.catalog.children[network["id"]]
        self.assertTrue(leaves)
        self.assertTrue(all(record["kind"] == "example-leaf" for record in leaves))
        hits = search_docs.manifest_hits(
            "WebSocket 本机关闭", search_docs.terms_for("WebSocket 本机关闭"), args(domain=["examples"])
        )
        self.assertEqual(hits[0].record["id"], "examples.network.websocket-local-roundtrip")

    def test_compact_match_results_omit_unrequested_domain_root(self) -> None:
        query = "JSON 配置校验 命令行参数"
        hits = search_docs.manifest_hits(
            query, search_docs.terms_for(query), args(domain=["examples"]), limit=None
        )
        compact = search_docs.compact_routing_hits(hits, query, 5)
        self.assertEqual(len(compact), 5)
        compact_ids = {hit.record["id"] for hit in compact}
        self.assertNotIn("examples", compact_ids)
        self.assertTrue(
            compact_ids
            & {"examples.cli-process.command-line-arguments", "examples.cli-process.cli-exit-status"}
        )

    def test_api_descendants_follow_parent_edges_not_id_prefixes(self) -> None:
        root = search_docs.resolve_exact_selector("api.std", self.catalog, args())
        distances = search_docs.subtree_distances([root], self.catalog, None)
        self.assertIn("std.collection", distances)
        self.assertIn("std.collection.class.arraylist", distances)

    def test_nonleaf_and_leaf_classification_uses_actual_children(self) -> None:
        root = search_docs.resolve_exact_selector("std.collection", self.catalog, args())
        indexes = search_docs.expand_records([root], self.catalog, "indexes")
        leaves = search_docs.expand_records([root], self.catalog, "leaves")
        index_ids = {record["id"] for record, _ in indexes}
        leaf_ids = {record["id"] for record, _ in leaves}
        self.assertIn("std.collection", index_ids)
        self.assertIn("std.collection.class.arraylist", index_ids)
        self.assertIn("std.collection.class.arraylist.add", leaf_ids)
        self.assertTrue(index_ids.isdisjoint(leaf_ids))

    def test_exact_leaf_returns_itself_in_leaf_view(self) -> None:
        root = search_docs.resolve_exact_selector("examples.project-build.unit-test", self.catalog, args())
        selected = search_docs.expand_records([root], self.catalog, "leaves")
        self.assertEqual(
            [(record["id"], distance) for record, distance in selected],
            [("examples.project-build.unit-test", 0)],
        )

    def test_receiver_member_query_resolves_to_leaf_in_leaf_view(self) -> None:
        query = "ArrayDeque size"
        root = search_docs.resolve_query_node(
            query,
            search_docs.terms_for(query),
            self.catalog,
            args(view="leaves"),
        )
        self.assertEqual(root["id"], "std.collection.class.arraydeque.prop-size")
        search_docs.enforce_api_leaf_policy([root], self.catalog, args(view="leaves"))

    def test_multiple_overlapping_roots_are_deduplicated(self) -> None:
        parent = search_docs.resolve_exact_selector("language.collections", self.catalog, args())
        child = self.catalog.children[parent["id"]][0]
        with_parent = search_docs.expand_records([parent], self.catalog, "leaves")
        with_both = search_docs.expand_records([parent, child], self.catalog, "leaves")
        self.assertEqual(
            {record["id"] for record, _ in with_parent},
            {record["id"] for record, _ in with_both},
        )

    def test_directory_and_windows_page_paths_resolve(self) -> None:
        directory = search_docs.resolve_exact_selector("language/collections", self.catalog, args())
        windows_page = search_docs.resolve_exact_selector(
            r"references\language\collections\index.md", self.catalog, args()
        )
        self.assertEqual(directory["id"], "language.collections")
        self.assertEqual(windows_page["id"], "language.collections")

    def test_expansion_order_is_deterministic(self) -> None:
        root = search_docs.resolve_exact_selector("language.collections", self.catalog, args())
        first = [record["id"] for record, _ in search_docs.expand_records([root], self.catalog, "indexes")]
        second = [record["id"] for record, _ in search_docs.expand_records([root], self.catalog, "indexes")]
        self.assertEqual(first, second)

    def test_depth_limits_descendant_traversal(self) -> None:
        root = search_docs.resolve_exact_selector("language.collections", self.catalog, args())
        distances = search_docs.subtree_distances([root], self.catalog, 1)
        self.assertTrue(distances)
        self.assertLessEqual(max(distances.values()), 1)

    def test_page_limit_refuses_unbounded_output(self) -> None:
        root = search_docs.resolve_exact_selector("language.collections", self.catalog, args())
        pages = search_docs.load_pages(search_docs.expand_records([root], self.catalog, "leaves"))
        with self.assertRaisesRegex(ValueError, "subtree expansion refused"):
            search_docs.enforce_expansion_limits(pages, args(max_pages=1))
        search_docs.enforce_expansion_limits(pages, args(max_pages=1, estimate=True))
        search_docs.enforce_expansion_limits(pages, args(max_pages=1, force=True))

    def test_wide_api_leaf_expansion_requires_explicit_override(self) -> None:
        root = search_docs.resolve_exact_selector("std.core.struct.array", self.catalog, args())
        with self.assertRaisesRegex(ValueError, "wide API leaf expansion refused"):
            search_docs.enforce_api_leaf_policy([root], self.catalog, args(view="leaves"))
        search_docs.enforce_api_leaf_policy(
            [root], self.catalog, args(view="leaves", estimate=True)
        )
        search_docs.enforce_api_leaf_policy(
            [root], self.catalog, args(view="leaves", force=True)
        )

    def test_multi_node_resolution_keeps_valid_nodes_and_reports_bad_selector(self) -> None:
        options = args(
            view="leaves",
            node=["examples.reflection.field-annotation", "std.ref.enums.cleanuppolicy"],
        )
        roots, warnings = search_docs.resolve_roots_tolerant("", [], self.catalog, options)
        self.assertEqual([item["id"] for item in roots], ["examples.reflection.field-annotation"])
        self.assertEqual(len(warnings), 1)
        self.assertIn("unknown node", warnings[0])

    def test_multi_node_policy_skips_only_wide_api_root(self) -> None:
        options = args(view="leaves")
        roots = [
            search_docs.resolve_exact_selector("examples.reflection.field-annotation", self.catalog, options),
            search_docs.resolve_exact_selector("std.reflect.class.classtypeinfo", self.catalog, options),
        ]
        accepted, warnings = search_docs.keep_bounded_roots(roots, self.catalog, options)
        self.assertEqual([item["id"] for item in accepted], ["examples.reflection.field-annotation"])
        self.assertEqual(len(warnings), 1)
        self.assertIn("wide API leaf expansion refused", warnings[0])

    def test_wide_guide_topic_leaf_expansion_requires_progressive_disclosure(self) -> None:
        root = search_docs.resolve_exact_selector("language.macro", self.catalog, args())
        with self.assertRaisesRegex(ValueError, "wide topic leaf expansion refused"):
            search_docs.enforce_api_leaf_policy([root], self.catalog, args(view="leaves"))
        search_docs.enforce_api_leaf_policy(
            [root], self.catalog, args(view="leaves", estimate=True)
        )
        search_docs.enforce_api_leaf_policy(
            [root], self.catalog, args(view="leaves", force=True)
        )

    def test_narrow_example_category_still_expands_all_leaves(self) -> None:
        root = search_docs.resolve_exact_selector("examples.macros", self.catalog, args())
        search_docs.enforce_api_leaf_policy([root], self.catalog, args(view="leaves"))
        leaves = search_docs.expand_records([root], self.catalog, "leaves")
        self.assertGreaterEqual(len(leaves), 4)

    def test_cli_json_contains_full_page_content(self) -> None:
        completed = subprocess.run(
            [
                sys.executable,
                str(SEARCH_SCRIPT),
                "--node",
                "examples.project-build.unit-test",
                "--view",
                "leaves",
                "--json",
            ],
            check=True,
            capture_output=True,
            text=True,
            encoding="utf-8",
        )
        payload = json.loads(completed.stdout)
        self.assertEqual(payload["stats"]["pages"], 1)
        self.assertEqual(payload["pages"][0]["id"], "examples.project-build.unit-test")
        self.assertIn("单元测试", payload["pages"][0]["content"])

    def test_cli_batches_semantic_queries_in_one_leaf_expansion(self) -> None:
        completed = subprocess.run(
            [
                sys.executable,
                str(SEARCH_SCRIPT),
                "--query",
                "FileInfo size property",
                "--query",
                "File readFrom static",
                "--view",
                "leaves",
                "--json",
            ],
            check=True,
            capture_output=True,
            text=True,
            encoding="utf-8",
        )
        payload = json.loads(completed.stdout)
        ids = {item["id"] for item in payload["pages"]}
        self.assertIn("std.fs.struct.fileinfo.prop-size", ids)
        self.assertIn("std.fs.class.file.readfrom", ids)

    def test_cli_leaf_batch_keeps_good_query_when_another_query_is_bad(self) -> None:
        completed = subprocess.run(
            [
                sys.executable,
                str(SEARCH_SCRIPT),
                "--query",
                "FileInfo size property",
                "--query",
                "DefinitelyMissingCangjieSymbol",
                "--view",
                "leaves",
                "--json",
            ],
            check=True,
            capture_output=True,
            text=True,
            encoding="utf-8",
        )
        payload = json.loads(completed.stdout)
        self.assertEqual(payload["pages"][0]["id"], "std.fs.struct.fileinfo.prop-size")
        self.assertIn("no layered-document node matches", payload["warnings"][0])

    def test_cli_estimate_json_omits_page_bodies(self) -> None:
        completed = subprocess.run(
            [
                sys.executable,
                str(SEARCH_SCRIPT),
                "--node",
                "examples.project-build.unit-test",
                "--view",
                "leaves",
                "--estimate",
                "--json",
            ],
            check=True,
            capture_output=True,
            text=True,
            encoding="utf-8",
        )
        payload = json.loads(completed.stdout)
        self.assertNotIn("content", payload["pages"][0])

    def test_cli_batches_queries_and_writes_one_trace_record(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            trace = Path(temporary) / "search.jsonl"
            completed = subprocess.run(
                [
                    sys.executable,
                    str(SEARCH_SCRIPT),
                    "--query",
                    "ArrayList reverse",
                    "--query",
                    "std.math sqrt",
                    "--domain",
                    "std",
                    "--max-results",
                    "1",
                    "--json",
                    "--trace-file",
                    str(trace),
                ],
                check=True,
                capture_output=True,
                text=True,
                encoding="utf-8",
            )
            payload = json.loads(completed.stdout)
            self.assertEqual([item["query"] for item in payload["queries"]], [
                "ArrayList reverse", "std.math sqrt",
            ])
            self.assertIn("reverse(): Unit", json.dumps(payload["queries"][0]["results"][0], ensure_ascii=False))
            for result in payload["queries"][0]["results"]:
                self.assertNotIn("source", result)
                self.assertNotIn("source_signature", result)
                self.assertNotIn("source_signatures", result)
            records = [json.loads(line) for line in trace.read_text(encoding="utf-8").splitlines()]
            self.assertEqual(len(records), 1)
            self.assertEqual(records[0]["mode"], "matches")
            self.assertEqual(records[0]["queries"], ["ArrayList reverse", "std.math sqrt"])
            self.assertEqual(records[0]["result_count"], 2)
            self.assertGreater(records[0]["response_characters"], 0)
            self.assertGreaterEqual(records[0]["duration_ms"], 0)

    def test_cli_default_returns_at_most_three_results_per_query(self) -> None:
        completed = subprocess.run(
            [sys.executable, str(SEARCH_SCRIPT), "collection", "add", "remove", "sort", "--json"],
            check=True,
            capture_output=True,
            text=True,
            encoding="utf-8",
        )
        self.assertLessEqual(len(json.loads(completed.stdout)), 3)

    def test_json_payload_filters_large_signature_lists_to_query_matches(self) -> None:
        record = {
            "id": "std.demo",
            "kind": "api-package",
            "path": "api/std/demo/index.md",
            "signatures": [f"func item{index}(): Unit" for index in range(20)] + ["sqrt(value: Float64): Float64"],
            "source_signatures": ["public func irrelevant(): Unit"],
            "source": "std/demo/source.md",
        }
        payload = search_docs.hit_payload(search_docs.Hit(1, record, ("sqrt",)))
        self.assertEqual(payload["signatures"], ["sqrt(value: Float64): Float64"])
        self.assertEqual(payload["signature_count"], 21)
        self.assertNotIn("source", payload)
        self.assertNotIn("source_signatures", payload)

    def test_batched_payload_emits_repeated_document_only_once(self) -> None:
        record = {
            "id": "stdx.log",
            "kind": "api-package",
            "path": "api/stdx/log/index.md",
            "summary": "日志包。",
        }
        hit = search_docs.Hit(100, record, ("log",), ("日志包。",))
        payload = search_docs.batch_match_payload([
            ("logger", ["logger"], [hit]),
            ("log", ["log"], [hit]),
        ])
        self.assertEqual(payload[0]["results"][0]["summary"], "日志包。")
        reused = payload[1]["results"][0]
        self.assertEqual(reused["id"], "stdx.log")
        self.assertEqual(reused["reused_from_query"], "logger")
        self.assertNotIn("summary", reused)

    def test_cli_limit_and_removed_source_option_fail_cleanly(self) -> None:
        limited = subprocess.run(
            [
                sys.executable,
                str(SEARCH_SCRIPT),
                "--node",
                "language",
                "--view",
                "leaves",
                "--max-pages",
                "1",
            ],
            capture_output=True,
            text=True,
            encoding="utf-8",
        )
        removed = subprocess.run(
            [
                sys.executable,
                str(SEARCH_SCRIPT),
                "--source",
            ],
            capture_output=True,
            text=True,
            encoding="utf-8",
        )
        self.assertNotEqual(limited.returncode, 0)
        self.assertIn("leaf expansion refused", limited.stderr)
        self.assertNotEqual(removed.returncode, 0)
        self.assertIn("unrecognized arguments: --source", removed.stderr)

    def test_cli_refuses_wide_api_leaf_dump_before_loading_bodies(self) -> None:
        completed = subprocess.run(
            [
                sys.executable,
                str(SEARCH_SCRIPT),
                "--node",
                "std.core.struct.array",
                "--view",
                "leaves",
            ],
            capture_output=True,
            text=True,
            encoding="utf-8",
        )
        self.assertNotEqual(completed.returncode, 0)
        self.assertIn("wide API leaf expansion refused", completed.stderr)
        self.assertIn("<Type> <member-or-intent>", completed.stderr)

    def test_cli_reports_ambiguous_same_level_title(self) -> None:
        records = [
            {"id": "a", "kind": "index", "level": 2, "parent": "root", "path": "a/index.md", "title": "重复"},
            {"id": "b", "kind": "index", "level": 2, "parent": "root", "path": "b/index.md", "title": "重复"},
        ]
        catalog = search_docs.build_catalog(records)
        with self.assertRaisesRegex(ValueError, "ambiguous node"):
            search_docs.resolve_exact_selector("重复", catalog, args())

    def test_manifest_output_does_not_recommend_wildcard_import(self) -> None:
        hits = search_docs.manifest_hits(
            "ArrayList reverse", search_docs.terms_for("ArrayList reverse"),
            args(domain=["std"]),
        )
        output = search_docs.rendered(search_docs.print_manifest, hits[:1], "ArrayList reverse")
        self.assertIn("- package: `std.collection`", output)
        self.assertNotIn("import std.collection.*", output)


if __name__ == "__main__":
    unittest.main(verbosity=2)
