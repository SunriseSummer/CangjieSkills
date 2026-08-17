<!-- cj-doc kind="api-extension" level="6" id="stdx.encoding.json.stream.interface.jsondeserializable.extension.extend-t-treemap-string-t-jsondeserializable-treemap-string-t-where-t-jsondeserializable-t" parent="stdx.encoding.json.stream.interface.jsondeserializable" -->
# extend<T> TreeMap<String, T> <: JsonDeserializable<TreeMap<String, T>> where T <: JsonDeserializable<T>

[← JsonDeserializable<T>](../index.md)

`extend<T> TreeMap<String, T> <: JsonDeserializable<TreeMap<String, T>> where T <: JsonDeserializable<T>`

为 TreeMap 类型实现 JsonDeserializable 接口。

## 父类型

- JsonDeserializable<TreeMap<String, T>>

从 JsonReader 中读取一个 TreeMap。

## 参数

- r: JsonReader - 读取反序列化结果的 JsonReader 实例。

## 返回值

- TreeMap<String, T> - TreeMap<String, T> 类型的实例。

## 成员

| 签名 | 功能 |
|---|---|
| `static func fromJson(r: JsonReader): TreeMap<String, T>` | 从 JsonReader 中读取一个 TreeMap。 |

