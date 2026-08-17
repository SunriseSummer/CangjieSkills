<!-- cj-doc kind="api-extension" level="6" id="stdx.encoding.json.stream.interface.jsonserializable.extension.extend-t-arraystack-t-jsonserializable-where-t-jsonserializable" parent="stdx.encoding.json.stream.interface.jsonserializable" -->
# extend<T> ArrayStack<T> <: JsonSerializable where T <: JsonSerializable

[← JsonSerializable](../index.md)

`extend<T> ArrayStack<T> <: JsonSerializable where T <: JsonSerializable`

为 ArrayStack<T> 类型提供序列化到 JSON 数据流的接口。

## 父类型

- JsonSerializable

将 ArrayStack<T> 类型写入参数 `w` 指定的 JsonWriter 实例中。

## 参数

- w: JsonWriter - 写入序列化结果的 JsonWriter 实例。

## 成员

| 签名 | 功能 |
|---|---|
| `func toJson(w: JsonWriter): Unit` | 将 ArrayStack<T> 类型写入参数 `w` 指定的 JsonWriter 实例中。 |

