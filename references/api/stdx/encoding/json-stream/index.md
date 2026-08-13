<!-- cj-doc kind="api-package" level="4" id="stdx.encoding.json.stream" parent="api.stdx" -->
# stdx.encoding.json.stream

[← stdx 包索引](../../index.md)

在仓颉对象与 JSON 数据流之间转换。

包路径：`stdx.encoding.json.stream`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`JsonReader`](classes/jsonreader/index.md) | 此类提供 JSON 数据流转仓颉对象的反序列化能力。 |
| [`JsonWriter`](classes/jsonwriter/index.md) | JsonWriter 提供了将仓颉对象序列化到 OutputStream 的能力。 |

## 接口

| 声明 | 功能 |
|---|---|
| [`JsonDeserializable<T>`](interfaces/jsondeserializable/index.md) | 自定义类型实现静态 `fromJson(JsonReader)` 以流式读取 JSON；读取前用 `peek()` 判别 token，未知值用 `skip()` 完整消费。 |
| [`JsonSerializable`](interfaces/jsonserializable/index.md) | 自定义类型实现 `toJson(JsonWriter)` 以流式写出 JSON；对象和数组须显式配对 `startObject/endObject`、`startArray/endArray`。 |

## 结构体

| 声明 | 功能 |
|---|---|
| [`WriteConfig`](structs/writeconfig/index.md) | 用于表示 JsonWriter 的序列化格式配置。 |

## 枚举

| 声明 | 功能 |
|---|---|
| [`JsonToken <: Equatable<JsonToken> & Hashable`](enums/jsontoken/index.md) | 表示 JSON 编码的字符串中的结构、名称或者值类型。 |
