<!-- cj-doc kind="api-extension" level="6" id="stdx.serialization.serialization.interface.serializable.extension.extend-t-arraylist-t-serializable-arraylist-t-where-t-serializable-t" parent="stdx.serialization.serialization.interface.serializable" -->
# extend<T> ArrayList<T> <: Serializable<ArrayList<T>> where T <: Serializable<T>

[← Serializable](../index.md)

`extend<T> ArrayList<T> <: Serializable<ArrayList<T>> where T <: Serializable<T>`

为 ArrayList<T> 类型实现 Serializable<ArrayList<T>> 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`static deserialize(dm: DataModel): ArrayList<T>`](../deserialize/index.md) | 将 DataModel 反序列化为 ArrayList<T>。 |
| [`serialize(): DataModel`](../serialize/index.md) | 将 ArrayList<T> 序列化为 DataModelSeq。 |
