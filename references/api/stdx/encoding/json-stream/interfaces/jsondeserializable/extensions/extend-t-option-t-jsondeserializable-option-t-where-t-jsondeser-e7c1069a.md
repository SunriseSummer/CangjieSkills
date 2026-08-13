<!-- cj-doc kind="api-extension" level="6" id="stdx.encoding.json.stream.interface.jsondeserializable.extension.extend-t-option-t-jsondeserializable-option-t-where-t-jsondeser-e7c1069a" parent="stdx.encoding.json.stream.interface.jsondeserializable" -->
# extend<T> Option <T> <: JsonDeserializable<Option<T>> where T <: JsonDeserializable<T>

[← JsonDeserializable<T>](../index.md)

`extend<T> Option<T> <: JsonDeserializable<Option<T>> where T <: JsonDeserializable<T>`

为 Option 类型实现 JsonDeserializable 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`static fromJson(r: JsonReader): Option<T>`](../fromjson/index.md) | 从 JsonReader 中读取一个 Option。 |
