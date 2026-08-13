<!-- cj-doc kind="api-member" level="7" id="stdx.serialization.serialization.interface.serializable.serialize.serialize-4a053f5510" parent="stdx.serialization.serialization.interface.serializable.serialize" -->
# Serializable.func serialize()

[← Serializable.serialize](index.md)

## 签名

```cangjie role=signature
public func serialize(): DataModel
```

将 HashSet<T> 序列化为 DataModelSeq。

适用扩展：[extend<T> HashSet<T> <: Serializable<HashSet<T>> where T <: Serializable<T> & Hashable & Equatable<T>](../extensions/extend-t-hashset-t-serializable-hashset-t-where-t-serializable-b50b8121.md)。

## 契约

返回值：

- DataModel - 序列化的 DataModelSeq。
