<!-- cj-doc kind="api-type" level="5" id="stdx.encoding.json.class.jsonobject" parent="stdx.encoding.json" -->
# JsonObject

[← stdx.encoding.json](../../index.md)

`JsonObject <: JsonValue`

JSON 对象容器；缺键读取优先用 `get` 取得 Option，`operator []` 在键不存在时抛 `JsonException`；1.1.3.1 文档未承诺 `toString()` 的键顺序。

## 关键契约

键顺序：

- 1.1.3.1 发布文档只约定 `toString()`/`toJsonString()` 返回对象的字符串表示，不保证键的输出顺序。
- 当前 Windows x86_64 cjnative 实测保留插入顺序，这只是实现观察，不能作为跨平台或跨版本契约。
- JSON 语义不依赖对象成员顺序；协议签名、快照或规范化输出若要求稳定顺序，应在应用层对键排序后显式编码，不要直接断言 `JsonObject` 的输出键序。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 创建空 JsonObject。 |
| [`init(map: HashMap<String, JsonValue>)`](init.md) | 将指定的 HashMap 类型实例封装成 JsonObject 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`containsKey(key: String): Bool`](containskey.md) | 判断 JsonObject 中是否存在 key。 |
| [`get(key: String): Option<JsonValue>`](get.md) | 获取 JsonObject 中 key 对应的 JsonValue，并用 Option<JsonValue> 封装。 |
| [`getFields(): HashMap<String, JsonValue>`](getfields.md) | 获取 JsonObject 中的 fields 数据。 |
| [`kind(): JsonKind`](kind.md) | 返回当前 JsonObject 所属的 JsonKind 类型（JsObject）。 |
| [`put(key: String, v: JsonValue): Unit`](put.md) | 向 JsonObject 中加入 key-JsonValue 数据。 |
| [`size(): Int64`](size.md) | 获取 JsonObject 中 fields 存入 string-JsonValue 的数量。 |
| [`toJsonString(): String`](tojsonstring.md) | 将 JsonObject 转换为 JSON 格式的 (带有空格换行符) 字符串。 |
| [`toJsonString(depth: Int64, bracketInNewLine!: Bool = false, indent!: String = " "): String`](tojsonstring.md) | 将 JsonObject 转换为 Json 格式的字符串。 |
| [`toString(): String`](tostring.md) | 将 JsonObject 转换为字符串。 |
| [`func toJsonStringWithoutEscaping(): String（2 个重载）`](tojsonstringwithoutescaping.md) | 将 JsonObject 转换为 JSON 格式的 (带有空格换行符) 字符串，不对 html 特殊字符 `&` 转义。 |
| [`func toStringWithoutEscaping(): String`](tostringwithoutescaping.md) | 将 JsonObject 转换为字符串，不对 html 特殊字符 `&` 转义。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator [](key: String): JsonValue`](operator-indexer.md) | 获取 JsonObject 中 key 对应的 JsonValue。 |
