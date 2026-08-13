<!-- cj-doc kind="api-member" level="7" id="stdx.serialization.serialization.interface.serializable.serialize.serialize-6440242c5f" parent="stdx.serialization.serialization.interface.serializable.serialize" -->
# Serializable.func serialize()

[← Serializable.serialize](index.md)

## 签名

```cangjie role=signature
public func serialize(): DataModel
```

将 ArrayList<T> 序列化为 DataModelSeq。

适用扩展：[extend<T> ArrayList<T> <: Serializable<ArrayList<T>> where T <: Serializable<T>](../extensions/extend-t-arraylist-t-serializable-arraylist-t-where-t-serializable-t.md)。

## 契约

返回值：

- DataModel - 序列化的 DataModelSeq。
