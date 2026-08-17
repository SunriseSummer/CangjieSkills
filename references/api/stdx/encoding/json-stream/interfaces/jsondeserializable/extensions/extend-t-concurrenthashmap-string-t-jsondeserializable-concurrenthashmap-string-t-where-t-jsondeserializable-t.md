<!-- cj-doc kind="api-extension" level="6" id="stdx.encoding.json.stream.interface.jsondeserializable.extension.extend-t-concurrenthashmap-string-t-jsondeserializable-concurrenthashmap-string-t-where-t-jsondeserializable-t" parent="stdx.encoding.json.stream.interface.jsondeserializable" -->
# extend<T> ConcurrentHashMap<String, T> <: JsonDeserializable<ConcurrentHashMap<String, T>> where T <: JsonDeserializable<T>

[← JsonDeserializable<T>](../index.md)

`extend<T> ConcurrentHashMap<String, T> <: JsonDeserializable<ConcurrentHashMap<String, T>> where T <: JsonDeserializable<T>`

为 ConcurrentHashMap 类型实现 JsonDeserializable 接口。

## 父类型

- JsonDeserializable<ConcurrentHashMap<String, T>>

从 JsonReader 中读取一个 ConcurrentHashMap。

## 参数

- r: JsonReader - 读取反序列化结果的 JsonReader 实例。

## 返回值

- ConcurrentHashMap<String, T> - ConcurrentHashMap<String, T> 类型的实例。

## 成员

| 签名 | 功能 |
|---|---|
| `static func fromJson(r: JsonReader): ConcurrentHashMap<String, T>` | 从 JsonReader 中读取一个 ConcurrentHashMap。 |

