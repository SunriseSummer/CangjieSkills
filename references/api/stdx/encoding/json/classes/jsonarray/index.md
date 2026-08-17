<!-- cj-doc kind="api-type" level="5" id="stdx.encoding.json.class.jsonarray" parent="stdx.encoding.json" -->
# JsonArray

[← stdx.encoding.json](../../index.md)

`JsonArray <: JsonValue`

JSON 数组容器；1.1.3.1 未实现 `Iterable`，遍历时使用 `getItems()`，或按 `0..size()` 生成索引并用 `operator []` 取值。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 创建空 JsonArray。 |
| [`init(list: ArrayList<JsonValue>)`](init.md) | 将指定的 ArrayList 类型实例封装成 JsonArray 实例。 |
| [`init(list: Array<JsonValue>)`](init.md) | 将指定的 Array 类型实例封装成 JsonArray 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`add(jv: JsonValue): JsonArray`](add.md) | 向 JsonArray 中加入 JsonValue 数据。 |
| [`get(index: Int64): Option<JsonValue>`](get.md) | 获取 JsonArray 中指定索引的 JsonValue，并用 Option<JsonValue> 封装。 |
| [`getItems(): ArrayList<JsonValue>`](getitems.md) | 获取 JsonArray 中的 items 数据。 |
| [`kind(): JsonKind`](kind.md) | 返回当前 JsonArray 所属的 JsonKind 类型（JsArray）。 |
| [`size(): Int64`](size.md) | 获取 JsonArray 中 JsonValue 的数量。 |
| [`toJsonString(): String`](tojsonstring.md) | 将 JsonArray 转换为 JSON 格式的 (带有空格换行符) 的字符串。 |
| [`toJsonString(depth: Int64, bracketInNewLine!: Bool = false, indent!: String = " "): String`](tojsonstring.md) | 将 JsonArray 转换为 JSON 格式的字符串。 |
| [`toString(): String`](tostring.md) | 将 JsonString 转换为字符串。 |
| [`func toJsonStringWithoutEscaping(): String（2 个重载）`](tojsonstringwithoutescaping.md) | 将 JsonArray 转换为 JSON 格式的 (带有空格换行符) 的字符串，不对 html 特殊字符 `&` 转义。 |
| [`func toStringWithoutEscaping(): String`](tostringwithoutescaping.md) | 将 JsonArray 转换为字符串，不对 html 特殊字符 `&` 转义。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator [](index: Int64): JsonValue`](operator-indexer.md) | 获取 JsonArray 中指定索引的 JsonValue。 |
