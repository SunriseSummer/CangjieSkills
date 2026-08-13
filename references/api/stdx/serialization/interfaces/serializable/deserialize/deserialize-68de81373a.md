<!-- cj-doc kind="api-member" level="7" id="stdx.serialization.serialization.interface.serializable.deserialize.deserialize-68de81373a" parent="stdx.serialization.serialization.interface.serializable.deserialize" -->
# Serializable.static func deserialize(DataModel)

[← Serializable.deserialize](index.md)

## 签名

```cangjie role=signature
public static func deserialize(dm: DataModel): UInt32
```

将 DataModel 反序列化为 UInt32。

适用扩展：[extend UInt32 <: Serializable](../extensions/extend-uint32-serializable.md)。

## 契约

参数：

- dm: DataModel - 需要被反序列化的 DataModel。

返回值：

- UInt32 - 反序列化后的 UInt32。

异常：

- DataModelException - 当 `dm` 的类型不是 DataModelInt 时，则抛出异常。
