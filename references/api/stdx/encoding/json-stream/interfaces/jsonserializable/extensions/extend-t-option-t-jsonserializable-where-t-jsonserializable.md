<!-- cj-doc kind="api-extension" level="6" id="stdx.encoding.json.stream.interface.jsonserializable.extension.extend-t-option-t-jsonserializable-where-t-jsonserializable" parent="stdx.encoding.json.stream.interface.jsonserializable" -->
# extend<T> Option<T> <: JsonSerializable where T <: JsonSerializable

[← JsonSerializable](../index.md)

`extend<T> Option<T> <: JsonSerializable where T <: JsonSerializable`

为 Option<T> 类型提供序列化到 JSON 数据流的接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`toJson(w: JsonWriter): Unit`](../tojson/index.md) | 将 Option<T> 类型写入参数 `w` 指定的 JsonWriter 实例中。 |
