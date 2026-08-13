<!-- cj-doc kind="api-member" level="7" id="stdx.serialization.serialization.interface.serializable.deserialize.deserialize-7bff1fcb53" parent="stdx.serialization.serialization.interface.serializable.deserialize" -->
# Serializable.static func deserialize(DataModel)

[← Serializable.deserialize](index.md)

## 签名

```cangjie role=signature
public static func deserialize(dm: DataModel): HashSet<T>
```

将 DataModel 反序列化为 HashSet<T>。

适用扩展：[extend<T> HashSet<T> <: Serializable<HashSet<T>> where T <: Serializable<T> & Hashable & Equatable<T>](../extensions/extend-t-hashset-t-serializable-hashset-t-where-t-serializable-b50b8121.md)。

## 契约

参数：

- dm: DataModel - 需要被反序列化的 DataModel。

返回值：

- HashSet\<T> - 反序列化后的 HashSet\<T>。

异常：

- DataModelException - 当 `dm` 的类型不是 DataModelSeq 时，抛出异常。
