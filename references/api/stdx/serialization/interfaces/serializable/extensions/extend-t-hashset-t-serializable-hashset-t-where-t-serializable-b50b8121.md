<!-- cj-doc kind="api-extension" level="6" id="stdx.serialization.serialization.interface.serializable.extension.extend-t-hashset-t-serializable-hashset-t-where-t-serializable-b50b8121" parent="stdx.serialization.serialization.interface.serializable" -->
# extend<T> HashSet<T> <: Serializable<HashSet<T>> where T <: Serializable<T> & Hashable & Equatable<T>

[← Serializable](../index.md)

`extend<T> HashSet<T> <: Serializable<HashSet<T>> where T <: Serializable<T> & Hashable & Equatable<T>`

为 HashSet<T> 类型实现 Serializable<HashSet<T>> 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`static deserialize(dm: DataModel): HashSet<T>`](../deserialize/index.md) | 将 DataModel 反序列化为 HashSet<T>。 |
| [`serialize(): DataModel`](../serialize/index.md) | 将 HashSet<T> 序列化为 DataModelSeq。 |
