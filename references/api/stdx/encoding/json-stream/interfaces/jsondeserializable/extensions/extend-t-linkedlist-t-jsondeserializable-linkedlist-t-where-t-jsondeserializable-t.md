<!-- cj-doc kind="api-extension" level="6" id="stdx.encoding.json.stream.interface.jsondeserializable.extension.extend-t-linkedlist-t-jsondeserializable-linkedlist-t-where-t-jsondeserializable-t" parent="stdx.encoding.json.stream.interface.jsondeserializable" -->
# extend<T> LinkedList<T> <: JsonDeserializable<LinkedList<T>> where T <: JsonDeserializable<T>

[← JsonDeserializable<T>](../index.md)

`extend<T> LinkedList<T> <: JsonDeserializable<LinkedList<T>> where T <: JsonDeserializable<T>`

为 LinkedList 类型实现 JsonDeserializable 接口。

## 父类型

- JsonDeserializable<LinkedList<T>>

从 JsonReader 中读取一个 LinkedList。

## 参数

- r: JsonReader - 读取反序列化结果的 JsonReader 实例。

## 返回值

- LinkedList<T> - LinkedList 类型的实例。

## 成员

| 签名 | 功能 |
|---|---|
| `static func fromJson(r: JsonReader): LinkedList<T>` | 从 JsonReader 中读取一个 LinkedList。 |

