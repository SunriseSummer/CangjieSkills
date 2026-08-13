<!-- cj-doc kind="api-extension" level="6" id="stdx.encoding.json.stream.interface.jsondeserializable.extension.extend-t-array-t-jsondeserializable-array-t-where-t-jsondeserializable-t" parent="stdx.encoding.json.stream.interface.jsondeserializable" -->
# extend<T> Array<T> <: JsonDeserializable<Array<T>> where T <: JsonDeserializable<T>

[← JsonDeserializable<T>](../index.md)

`extend<T> Array<T> <: JsonDeserializable<Array<T>> where T <: JsonDeserializable<T>`

为 Array<T> 类型实现 JsonDeserializable 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`static fromJson(r: JsonReader): Array<T>`](../fromjson/index.md) | 从 JsonReader 中读取一个 Array。 |
