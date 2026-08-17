<!-- cj-doc kind="api-extension" level="6" id="stdx.encoding.json.stream.interface.jsondeserializable.extension.extend-t-hashset-t-jsondeserializable-hashset-t-where-t-jsondeserializable-t" parent="stdx.encoding.json.stream.interface.jsondeserializable" -->
# extend<T> HashSet<T> <: JsonDeserializable<HashSet<T>> where T <: JsonDeserializable<T>

[← JsonDeserializable<T>](../index.md)

`extend<T> HashSet<T> <: JsonDeserializable<HashSet<T>> where T <: JsonDeserializable<T>`

为 HashSet 类型实现 JsonDeserializable 接口。

## 父类型

- JsonDeserializable<HashSet<T>>

从 JsonReader 中读取一个 HashSet。

## 参数

- r: JsonReader - 读取反序列化结果的 JsonReader 实例。

## 返回值

- HashSet<T> - HashSet 类型的实例。

## 成员

| 签名 | 功能 |
|---|---|
| `static func fromJson(r: JsonReader): HashSet<T>` | 从 JsonReader 中读取一个 HashSet。 |

