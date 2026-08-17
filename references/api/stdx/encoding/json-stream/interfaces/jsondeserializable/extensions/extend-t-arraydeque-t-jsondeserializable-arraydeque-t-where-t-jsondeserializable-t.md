<!-- cj-doc kind="api-extension" level="6" id="stdx.encoding.json.stream.interface.jsondeserializable.extension.extend-t-arraydeque-t-jsondeserializable-arraydeque-t-where-t-jsondeserializable-t" parent="stdx.encoding.json.stream.interface.jsondeserializable" -->
# extend<T> ArrayDeque<T> <: JsonDeserializable<ArrayDeque<T>> where T <: JsonDeserializable<T>

[← JsonDeserializable<T>](../index.md)

`extend<T> ArrayDeque<T> <: JsonDeserializable<ArrayDeque<T>> where T <: JsonDeserializable<T>`

为 ArrayDeque 类型实现 JsonDeserializable 接口。

## 父类型

- JsonDeserializable<ArrayDeque<T>>

从 JsonReader 中读取一个 ArrayDeque。

## 参数

- r: JsonReader - 读取反序列化结果的 JsonReader 实例。

## 返回值

- ArrayDeque<T> - ArrayDeque 类型的实例。

## 成员

| 签名 | 功能 |
|---|---|
| `static func fromJson(r: JsonReader): ArrayDeque<T>` | 从 JsonReader 中读取一个 ArrayDeque。 |

