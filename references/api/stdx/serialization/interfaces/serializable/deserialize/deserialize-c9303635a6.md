<!-- cj-doc kind="api-member" level="7" id="stdx.serialization.serialization.interface.serializable.deserialize.deserialize-c9303635a6" parent="stdx.serialization.serialization.interface.serializable.deserialize" -->
# Serializable.static func deserialize(DataModel)

[← Serializable.deserialize](index.md)

## 签名

```cangjie role=signature
public static func deserialize(dm: DataModel): Float32
```

将 DataModel 反序列化为 Float32。

适用扩展：[extend Float32 <: Serializable](../extensions/extend-float32-serializable.md)。

## 契约

参数：

- dm: DataModel - 需要被反序列化的 DataModel。

返回值：

- Float32 - 反序列化后的 Float32。

异常：

- DataModelException - 当 `dm` 的类型不是 DataModelFloat 或者 DataModelInt 时，抛出异常。
