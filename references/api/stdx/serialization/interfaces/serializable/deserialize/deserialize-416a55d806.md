<!-- cj-doc kind="api-member" level="7" id="stdx.serialization.serialization.interface.serializable.deserialize.deserialize-416a55d806" parent="stdx.serialization.serialization.interface.serializable.deserialize" -->
# Serializable.static func deserialize(DataModel)

[← Serializable.deserialize](index.md)

## 签名

```cangjie role=signature
public static func deserialize(dm: DataModel): UInt8
```

将 DataModel 反序列化为 UInt8。

适用扩展：[extend UInt8 <: Serializable](../extensions/extend-uint8-serializable.md)。

## 契约

参数：

- dm: DataModel - 需要被反序列化的 DataModel。

返回值：

- UInt8 - 反序列化后的 UInt8。

异常：

- DataModelException - 当 `dm` 的类型不是 DataModelInt 时，则抛出异常。
