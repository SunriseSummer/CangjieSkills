<!-- cj-doc kind="api-extension" level="6" id="stdx.serialization.serialization.interface.serializable.extension.extend-t-option-t-serializable-option-t-where-t-serializable-t" parent="stdx.serialization.serialization.interface.serializable" -->
# extend<T> Option<T> <: Serializable<Option<T>> where T <: Serializable<T>

[← Serializable](../index.md)

`extend<T> Option<T> <: Serializable<Option<T>> where T <: Serializable<T>`

为 Option<T> 类型实现 Serializable<Option<T>> 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`static deserialize(dm: DataModel): Option<T>`](../deserialize/index.md) | 将 DataModel 反序列化为 Option<T>。 |
| [`serialize(): DataModel`](../serialize/index.md) | 将 Option<T> 中的 `T` 序列化为 DataModel。 |
