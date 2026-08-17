<!-- cj-doc kind="api-type" level="5" id="stdx.encoding.json.class.jsonvalue" parent="stdx.encoding.json" -->
# JsonValue

[← stdx.encoding.json](../../index.md)

`sealed abstract JsonValue <: ToString`

JSON 值基类；先用 `kind()` 判别形态，再调用对应 `asXxx()`，形态不匹配时抛 `JsonException`。

## 方法

| 签名 | 功能 |
|---|---|
| [`static fromStr(s: String): JsonValue`](fromstr.md) | 把字符串解析为 JsonValue；语法错误抛 `JsonException`。 |
| [`asArray(): JsonArray`](asarray.md) | 将 JsonValue 转换为 JsonArray 格式。 |
| [`asBool(): JsonBool`](asbool.md) | 将 JsonValue 转换为 JsonBool 格式。 |
| [`asFloat(): JsonFloat`](asfloat.md) | 将 JsonValue 转换为 JsonFloat 格式。 |
| [`asInt(): JsonInt`](asint.md) | 将 JsonValue 转换为 JsonInt 格式。 |
| [`asNull(): JsonNull`](asnull.md) | 将 JsonValue 转换为 JsonNull 格式。 |
| [`asObject(): JsonObject`](asobject.md) | 将 JsonValue 转换为 JsonObject 格式。 |
| [`asString(): JsonString`](asstring.md) | 将 JsonValue 转换为 JsonString 格式。 |
| [`kind(): JsonKind`](kind.md) | 返回值的 `JsonKind`；显式导入类型并用 `case JsonKind.JsXxx` 匹配，不能用 `==`/`!=` 比较。 |
| [`toJsonString(): String`](tojsonstring.md) | 将 JsonValue 转换为 JSON 格式的 (带有空格换行符) 字符串。 |
| [`toString(): String`](tostring.md) | 将 JsonValue 转换为字符串。 |
| [`func toJsonStringWithoutEscaping(): String`](tojsonstringwithoutescaping.md) | 将 JsonValue 转换为 JSON 格式的 (带有空格换行符) 字符串，不对 html 特殊字符 `&` 转义。 |
| [`func toStringWithoutEscaping(): String`](tostringwithoutescaping.md) | 将 JsonValue 转换为字符串，不对 html 特殊字符 `&` 转义。 |
