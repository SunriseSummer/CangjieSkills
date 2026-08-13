<!-- cj-doc kind="api-member" level="7" id="stdx.serialization.serialization.interface.serializable.serialize.serialize-706fc8e3ed" parent="stdx.serialization.serialization.interface.serializable.serialize" -->
# Serializable.func serialize()

[← Serializable.serialize](index.md)

## 签名

```cangjie role=signature
public func serialize(): DataModel
```

将 Array<T> 序列化为 DataModelSeq。

适用扩展：[extend<T> Array<T> <: Serializable<Array<T>> where T <: Serializable<T>](../extensions/extend-t-array-t-serializable-array-t-where-t-serializable-t.md)。

## 契约

返回值：

- DataModel - 序列化的 DataModelSeq。
