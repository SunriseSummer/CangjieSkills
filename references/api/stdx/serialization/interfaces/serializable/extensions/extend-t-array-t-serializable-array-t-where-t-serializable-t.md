<!-- cj-doc kind="api-extension" level="6" id="stdx.serialization.serialization.interface.serializable.extension.extend-t-array-t-serializable-array-t-where-t-serializable-t" parent="stdx.serialization.serialization.interface.serializable" -->
# extend<T> Array<T> <: Serializable<Array<T>> where T <: Serializable<T>

[← Serializable](../index.md)

`extend<T> Array<T> <: Serializable<Array<T>> where T <: Serializable<T>`

为 Array<T> 类型实现 Serializable<Array<T>> 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`static deserialize(dm: DataModel): Array<T>`](../deserialize/index.md) | 将 DataModel 反序列化为 Array<T>。 |
| [`serialize(): DataModel`](../serialize/index.md) | 将 Array<T> 序列化为 DataModelSeq。 |
