<!-- cj-doc kind="api-member" level="7" id="stdx.serialization.serialization.interface.serializable.deserialize.deserialize-2f0184d44a" parent="stdx.serialization.serialization.interface.serializable.deserialize" -->
# Serializable.static func deserialize(DataModel)

[← Serializable.deserialize](index.md)

## 签名

```cangjie role=signature
public static func deserialize(dm: DataModel): UInt64
```

将 DataModel 反序列化为 UInt64。

适用扩展：[extend UInt64 <: Serializable](../extensions/extend-uint64-serializable.md)。

## 契约

参数：

- dm: DataModel - 需要被反序列化的 DataModel。

返回值：

- UInt64 - 反序列化后的 UInt64。

异常：

- DataModelException - 当 `dm` 的类型不是 DataModelInt 时，则抛出异常。
