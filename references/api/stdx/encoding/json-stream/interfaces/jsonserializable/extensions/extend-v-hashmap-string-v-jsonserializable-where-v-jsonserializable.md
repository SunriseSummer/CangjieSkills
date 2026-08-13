<!-- cj-doc kind="api-extension" level="6" id="stdx.encoding.json.stream.interface.jsonserializable.extension.extend-v-hashmap-string-v-jsonserializable-where-v-jsonserializable" parent="stdx.encoding.json.stream.interface.jsonserializable" -->
# extend<V> HashMap<String, V> <: JsonSerializable where V <: JsonSerializable

[← JsonSerializable](../index.md)

`extend<V> HashMap<String, V> <: JsonSerializable where V <: JsonSerializable`

为 HashMap<String, T> 类型提供序列化到 JSON 数据流的接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`toJson(w: JsonWriter): Unit`](../tojson/index.md) | 将 HashMap<String, T> 类型写入参数 `w` 指定的 JsonWriter 实例中。 |
