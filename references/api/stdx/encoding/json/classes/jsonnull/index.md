<!-- cj-doc kind="api-type" level="5" id="stdx.encoding.json.class.jsonnull" parent="stdx.encoding.json" -->
# JsonNull

[← stdx.encoding.json](../../index.md)

`JsonNull <: JsonValue`

此类为 JsonValue 实现子类，主要用于封装 null 的 JSON 数据。

## 方法

| 签名 | 功能 |
|---|---|
| [`kind(): JsonKind`](kind.md) | 返回当前 JsonNull 所属的 JsonKind 类型（JsNull）。 |
| [`toJsonString(): String`](tojsonstring.md) | 将 JsonNull 转换为 JSON 格式的 (带有空格换行符) 字符串。 |
| [`toString(): String`](tostring.md) | 将 JsonNull 转换为字符串。 |
