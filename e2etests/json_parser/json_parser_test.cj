package json_parser

import std.collection.*
import std.math.*

@Test
class TestParseSimpleValues {
    @TestCase
    func testParseNull() {
        let v = JsonValue.fromString("null")
        @Assert(v.isNull())
    }

    @TestCase
    func testParseTrue() {
        let v = JsonValue.fromString("true")
        @Assert(v.isBool())
        @Assert(v.asBool(), true)
    }

    @TestCase
    func testParseFalse() {
        let v = JsonValue.fromString("false")
        @Assert(v.isBool())
        @Assert(v.asBool(), false)
    }

    @TestCase
    func testParseInteger() {
        let v = JsonValue.fromString("42")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - 42.0) < 0.001)
    }

    @TestCase
    func testParseNegativeInteger() {
        let v = JsonValue.fromString("-7")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - (-7.0)) < 0.001)
    }

    @TestCase
    func testParseZero() {
        let v = JsonValue.fromString("0")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber()) < 0.001)
    }

    @TestCase
    func testParseFloat() {
        let v = JsonValue.fromString("3.14")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - 3.14) < 0.001)
    }

    @TestCase
    func testParseNegativeFloat() {
        let v = JsonValue.fromString("-0.5")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - (-0.5)) < 0.001)
    }

    @TestCase
    func testParseScientificNotation() {
        let v = JsonValue.fromString("1e3")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - 1000.0) < 0.001)
    }

    @TestCase
    func testParseScientificNotationWithSign() {
        let v = JsonValue.fromString("1.5e-2")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - 0.015) < 0.0001)
    }

    @TestCase
    func testParseSimpleString() {
        let v = JsonValue.fromString("\"hello\"")
        @Assert(v.isString())
        @Assert(v.asString(), "hello")
    }

    @TestCase
    func testParseEmptyString() {
        let v = JsonValue.fromString("\"\"")
        @Assert(v.isString())
        @Assert(v.asString(), "")
    }

    @TestCase
    func testParseStringWithEscapes() {
        let v = JsonValue.fromString("\"hello\\nworld\"")
        @Assert(v.isString())
        @Assert(v.asString(), "hello\nworld")
    }

    @TestCase
    func testParseStringWithTab() {
        let v = JsonValue.fromString("\"a\\tb\"")
        @Assert(v.isString())
        @Assert(v.asString(), "a\tb")
    }

    @TestCase
    func testParseStringWithEscapedQuote() {
        let v = JsonValue.fromString("\"say \\\"hi\\\"\"")
        @Assert(v.isString())
        @Assert(v.asString(), "say \"hi\"")
    }

    @TestCase
    func testParseStringWithBackslash() {
        let v = JsonValue.fromString("\"a\\\\b\"")
        @Assert(v.isString())
        @Assert(v.asString(), "a\\b")
    }

    @TestCase
    func testParseStringWithSlash() {
        let v = JsonValue.fromString("\"a\\/b\"")
        @Assert(v.isString())
        @Assert(v.asString(), "a/b")
    }

    @TestCase
    func testParseStringWithUnicode() {
        let v = JsonValue.fromString("\"\\u4f60\\u597d\"")
        @Assert(v.isString())
        @Assert(v.asString(), "你好")
    }

    @TestCase
    func testParseStringWithUTF8() {
        let v = JsonValue.fromString("\"中文测试\"")
        @Assert(v.isString())
        @Assert(v.asString(), "中文测试")
    }
}

@Test
class TestParseWhitespace {
    @TestCase
    func testWhitespaceAroundValue() {
        let v = JsonValue.fromString("  42  ")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - 42.0) < 0.001)
    }

    @TestCase
    func testWhitespaceInObject() {
        let v = JsonValue.fromString("{ \"a\" : 1 }")
        @Assert(v.isObject())
    }

    @TestCase
    func testNewlinesAndTabs() {
        let v = JsonValue.fromString("{\n\t\"x\": 1\n}")
        @Assert(v.isObject())
    }
}

@Test
class TestParseArray {
    @TestCase
    func testEmptyArray() {
        let v = JsonValue.fromString("[]")
        @Assert(v.isArray())
        let arr = (v as JsonArr).getOrThrow()
        @Assert(arr.size(), 0)
    }

    @TestCase
    func testSingleElementArray() {
        let v = JsonValue.fromString("[1]")
        @Assert(v.isArray())
        let arr = (v as JsonArr).getOrThrow()
        @Assert(arr.size(), 1)
        @Assert(abs(arr.get(0).asNumber() - 1.0) < 0.001)
    }

    @TestCase
    func testMixedArray() {
        let v = JsonValue.fromString("[1, \"two\", true, null, 3.14]")
        @Assert(v.isArray())
        let arr = (v as JsonArr).getOrThrow()
        @Assert(arr.size(), 5)
        @Assert(arr.get(0).isNumber())
        @Assert(arr.get(1).isString())
        @Assert(arr.get(1).asString(), "two")
        @Assert(arr.get(2).isBool())
        @Assert(arr.get(2).asBool(), true)
        @Assert(arr.get(3).isNull())
        @Assert(abs(arr.get(4).asNumber() - 3.14) < 0.001)
    }

    @TestCase
    func testNestedArray() {
        let v = JsonValue.fromString("[[1, 2], [3, 4]]")
        @Assert(v.isArray())
        let arr = (v as JsonArr).getOrThrow()
        @Assert(arr.size(), 2)
        let inner = (arr.get(0) as JsonArr).getOrThrow()
        @Assert(inner.size(), 2)
        @Assert(abs(inner.get(0).asNumber() - 1.0) < 0.001)
    }
}

@Test
class TestParseObject {
    @TestCase
    func testEmptyObject() {
        let v = JsonValue.fromString("{}")
        @Assert(v.isObject())
        let obj = (v as JsonObj).getOrThrow()
        @Assert(obj.size(), 0)
    }

    @TestCase
    func testSimpleObject() {
        let v = JsonValue.fromString("{\"name\": \"Alice\", \"age\": 30}")
        @Assert(v.isObject())
        let obj = (v as JsonObj).getOrThrow()
        @Assert(obj.size(), 2)
        @Assert(obj.get("name").getOrThrow().asString(), "Alice")
        @Assert(abs(obj.get("age").getOrThrow().asNumber() - 30.0) < 0.001)
    }

    @TestCase
    func testNestedObject() {
        let v = JsonValue.fromString("{\"a\": {\"b\": 1}}")
        @Assert(v.isObject())
        let obj = (v as JsonObj).getOrThrow()
        let inner = (obj.get("a").getOrThrow() as JsonObj).getOrThrow()
        @Assert(abs(inner.get("b").getOrThrow().asNumber() - 1.0) < 0.001)
    }

    @TestCase
    func testObjectContainsKey() {
        let v = JsonValue.fromString("{\"key\": \"value\"}")
        let obj = (v as JsonObj).getOrThrow()
        @Assert(obj.containsKey("key"))
        @Assert(!obj.containsKey("missing"))
    }

    @TestCase
    func testObjectGetMissing() {
        let v = JsonValue.fromString("{\"key\": \"value\"}")
        let obj = (v as JsonObj).getOrThrow()
        @Assert(obj.get("missing").isNone())
    }
}

@Test
class TestParseComplex {
    @TestCase
    func testComplexJson() {
        let input = ##"{"name":"Alice","age":30,"active":true,"scores":[90,85,95],"address":null}"##
        let v = JsonValue.fromString(input)
        @Assert(v.isObject())
        let obj = (v as JsonObj).getOrThrow()
        @Assert(obj.get("name").getOrThrow().asString(), "Alice")
        @Assert(abs(obj.get("age").getOrThrow().asNumber() - 30.0) < 0.001)
        @Assert(obj.get("active").getOrThrow().asBool(), true)
        @Assert(obj.get("address").getOrThrow().isNull())
        let scores = (obj.get("scores").getOrThrow() as JsonArr).getOrThrow()
        @Assert(scores.size(), 3)
        @Assert(abs(scores.get(0).asNumber() - 90.0) < 0.001)
    }

    @TestCase
    func testDeeplyNestedJson() {
        let input = ##"{"a":{"b":{"c":{"d":42}}}}"##
        let v = JsonValue.fromString(input)
        let obj = (v as JsonObj).getOrThrow()
        let a = (obj.get("a").getOrThrow() as JsonObj).getOrThrow()
        let b = (a.get("b").getOrThrow() as JsonObj).getOrThrow()
        let c = (b.get("c").getOrThrow() as JsonObj).getOrThrow()
        @Assert(abs(c.get("d").getOrThrow().asNumber() - 42.0) < 0.001)
    }

    @TestCase
    func testObjectWithArray() {
        let input = ##"{"items":[{"id":1,"name":"a"},{"id":2,"name":"b"}]}"##
        let v = JsonValue.fromString(input)
        let obj = (v as JsonObj).getOrThrow()
        let items = (obj.get("items").getOrThrow() as JsonArr).getOrThrow()
        @Assert(items.size(), 2)
        let item1 = (items.get(0) as JsonObj).getOrThrow()
        @Assert(abs(item1.get("id").getOrThrow().asNumber() - 1.0) < 0.001)
        @Assert(item1.get("name").getOrThrow().asString(), "a")
    }
}

@Test
class TestSerialize {
    @TestCase
    func testSerializeNull() {
        @Assert(JsonNull().toString(), "null")
    }

    @TestCase
    func testSerializeTrue() {
        @Assert(JsonBool(true).toString(), "true")
    }

    @TestCase
    func testSerializeFalse() {
        @Assert(JsonBool(false).toString(), "false")
    }

    @TestCase
    func testSerializeInteger() {
        let s = JsonNum(42.0).toString()
        @Assert(s, "42")
    }

    @TestCase
    func testSerializeFloat() {
        let s = JsonNum(3.14).toString()
        @Assert(s.startsWith("3.14"))
    }

    @TestCase
    func testSerializeString() {
        @Assert(JsonStr("hello").toString(), "\"hello\"")
    }

    @TestCase
    func testSerializeStringWithEscapes() {
        @Assert(JsonStr("a\nb").toString(), "\"a\\nb\"")
    }

    @TestCase
    func testSerializeEmptyArray() {
        @Assert(JsonArr().toString(), "[]")
    }

    @TestCase
    func testSerializeArray() {
        let arr = JsonArr()
        arr.add(JsonNum(1.0))
        arr.add(JsonNum(2.0))
        @Assert(arr.toString(), "[1,2]")
    }

    @TestCase
    func testSerializeEmptyObject() {
        @Assert(JsonObj().toString(), "{}")
    }

    @TestCase
    func testSerializeObject() {
        let obj = JsonObj()
        obj.put("a", JsonNum(1.0))
        obj.put("b", JsonStr("hello"))
        @Assert(obj.toString(), "{\"a\":1,\"b\":\"hello\"}")
    }
}

@Test
class TestRoundTrip {
    @TestCase
    func testRoundTripNull() {
        let s = "null"
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
    }

    @TestCase
    func testRoundTripBool() {
        let s = "true"
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
    }

    @TestCase
    func testRoundTripNumber() {
        let s = "42"
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
    }

    @TestCase
    func testRoundTripString() {
        let s = "\"hello world\""
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
    }

    @TestCase
    func testRoundTripArray() {
        let s = "[1,2,3]"
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
    }

    @TestCase
    func testRoundTripObject() {
        let s = ##"{"name":"Alice","age":30}"##
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
    }

    @TestCase
    func testRoundTripComplex() {
        let s = ##"{"a":[1,true,null,"hi"],"b":{"c":3}}"##
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
    }
}

@Test
class TestErrorHandling {
    @TestCase
    func testEmptyInput() {
        try {
            JsonValue.fromString("")
            @Fail("Should have thrown")
        } catch (e: JsonException) {
            @Assert(true)
        }
    }

    @TestCase
    func testInvalidToken() {
        try {
            JsonValue.fromString("xyz")
            @Fail("Should have thrown")
        } catch (e: JsonException) {
            @Assert(true)
        }
    }

    @TestCase
    func testUnterminatedString() {
        try {
            JsonValue.fromString("\"hello")
            @Fail("Should have thrown")
        } catch (e: JsonException) {
            @Assert(true)
        }
    }

    @TestCase
    func testUnterminatedArray() {
        try {
            JsonValue.fromString("[1, 2")
            @Fail("Should have thrown")
        } catch (e: JsonException) {
            @Assert(true)
        }
    }

    @TestCase
    func testUnterminatedObject() {
        try {
            JsonValue.fromString("{\"a\": 1")
            @Fail("Should have thrown")
        } catch (e: JsonException) {
            @Assert(true)
        }
    }

    @TestCase
    func testTrailingCommaInArray() {
        try {
            JsonValue.fromString("[1,]")
            @Fail("Should have thrown")
        } catch (e: JsonException) {
            @Assert(true)
        }
    }

    @TestCase
    func testTrailingCommaInObject() {
        try {
            JsonValue.fromString("{\"a\":1,}")
            @Fail("Should have thrown")
        } catch (e: JsonException) {
            @Assert(true)
        }
    }

    @TestCase
    func testTrailingContent() {
        try {
            JsonValue.fromString("42 extra")
            @Fail("Should have thrown")
        } catch (e: JsonException) {
            @Assert(true)
        }
    }

    @TestCase
    func testInvalidNumber() {
        try {
            JsonValue.fromString("1.")
            @Fail("Should have thrown")
        } catch (e: JsonException) {
            @Assert(true)
        }
    }

    @TestCase
    func testMissingColon() {
        try {
            JsonValue.fromString("{\"a\" 1}")
            @Fail("Should have thrown")
        } catch (e: JsonException) {
            @Assert(true)
        }
    }
}

@Test
class TestBuildValues {
    @TestCase
    func testBuildArray() {
        let arr = JsonArr()
        arr.add(JsonNum(1.0))
        arr.add(JsonStr("hello"))
        arr.add(JsonBool(true))
        arr.add(JsonNull())
        @Assert(arr.size(), 4)
        @Assert(abs(arr.get(0).asNumber() - 1.0) < 0.001)
        @Assert(arr.get(1).asString(), "hello")
        @Assert(arr.get(2).asBool(), true)
        @Assert(arr.get(3).isNull())
    }

    @TestCase
    func testBuildObject() {
        let obj = JsonObj()
        obj.put("name", JsonStr("Alice"))
        obj.put("age", JsonNum(30.0))
        @Assert(obj.size(), 2)
        @Assert(obj.get("name").getOrThrow().asString(), "Alice")
        @Assert(abs(obj.get("age").getOrThrow().asNumber() - 30.0) < 0.001)
    }

    @TestCase
    func testObjectPutOverwrite() {
        let obj = JsonObj()
        obj.put("key", JsonStr("old"))
        obj.put("key", JsonStr("new"))
        @Assert(obj.size(), 1)
        @Assert(obj.get("key").getOrThrow().asString(), "new")
    }

    @TestCase
    func testObjectKeys() {
        let obj = JsonObj()
        obj.put("a", JsonNum(1.0))
        obj.put("b", JsonNum(2.0))
        let keys = obj.keys()
        @Assert(keys.size, 2)
        @Assert(keys[0], "a")
        @Assert(keys[1], "b")
    }

    @TestCase
    func testTypeChecks() {
        @Assert(JsonNull().isNull())
        @Assert(!JsonNull().isBool())
        @Assert(!JsonNull().isNumber())
        @Assert(!JsonNull().isString())
        @Assert(!JsonNull().isArray())
        @Assert(!JsonNull().isObject())

        @Assert(JsonBool(true).isBool())
        @Assert(JsonNum(1.0).isNumber())
        @Assert(JsonStr("x").isString())
        @Assert(JsonArr().isArray())
        @Assert(JsonObj().isObject())
    }

    @TestCase
    func testTypeMismatchThrows() {
        try {
            JsonNull().asBool()
            @Fail("Should have thrown")
        } catch (e: JsonException) {
            @Assert(true)
        }
        try {
            JsonNull().asNumber()
            @Fail("Should have thrown")
        } catch (e: JsonException) {
            @Assert(true)
        }
        try {
            JsonNull().asString()
            @Fail("Should have thrown")
        } catch (e: JsonException) {
            @Assert(true)
        }
    }
}
