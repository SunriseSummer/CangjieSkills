<!-- cj-doc kind="api-member" level="7" id="stdx.serialization.serialization.interface.serializable.serialize.serialize-563166a553" parent="stdx.serialization.serialization.interface.serializable.serialize" -->
# Serializable.func serialize()

[← Serializable.serialize](index.md)

## 签名

```cangjie role=signature
public func serialize(): DataModel
```

将 Option<T> 中的 `T` 序列化为 DataModel。

适用扩展：[extend<T> Option<T> <: Serializable<Option<T>> where T <: Serializable<T>](../extensions/extend-t-option-t-serializable-option-t-where-t-serializable-t.md)。

## 契约

返回值：

- DataModel - 序列化的 DataModel。
