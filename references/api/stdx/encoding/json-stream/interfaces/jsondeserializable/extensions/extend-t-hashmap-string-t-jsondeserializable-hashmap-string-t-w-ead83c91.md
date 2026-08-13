<!-- cj-doc kind="api-extension" level="6" id="stdx.encoding.json.stream.interface.jsondeserializable.extension.extend-t-hashmap-string-t-jsondeserializable-hashmap-string-t-w-ead83c91" parent="stdx.encoding.json.stream.interface.jsondeserializable" -->
# extend<T> HashMap<String, T> <: JsonDeserializable<HashMap<String, T>> where T <: JsonDeserializable<T>

[← JsonDeserializable<T>](../index.md)

`extend<T> HashMap<String, T> <: JsonDeserializable<HashMap<String, T>> where T <: JsonDeserializable<T>`

为 HashMap 类型实现 JsonDeserializable 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`static fromJson(r: JsonReader): HashMap<String, T>`](../fromjson/index.md) | 从 JsonReader 中读取一个 HashMap。 |
