<!-- cj-doc kind="api-extension" level="6" id="stdx.encoding.json.stream.interface.jsondeserializable.extension.extend-t-treeset-t-jsondeserializable-treeset-t-where-t-jsondeserializable-t" parent="stdx.encoding.json.stream.interface.jsondeserializable" -->
# extend<T> TreeSet<T> <: JsonDeserializable<TreeSet<T>> where T <: JsonDeserializable<T>

[← JsonDeserializable<T>](../index.md)

`extend<T> TreeSet<T> <: JsonDeserializable<TreeSet<T>> where T <: JsonDeserializable<T>`

为 TreeSet 类型实现 JsonDeserializable 接口。

## 父类型

- JsonDeserializable<TreeSet<T>>

从 JsonReader 中读取一个 TreeSet。

## 参数

- r: JsonReader - 读取反序列化结果的 JsonReader 实例。

## 返回值

- TreeSet<T> - TreeSet 类型的实例。

## 成员

| 签名 | 功能 |
|---|---|
| `static func fromJson(r: JsonReader): TreeSet<T>` | 从 JsonReader 中读取一个 TreeSet。 |

