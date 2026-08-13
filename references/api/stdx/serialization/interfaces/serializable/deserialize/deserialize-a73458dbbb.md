<!-- cj-doc kind="api-member" level="7" id="stdx.serialization.serialization.interface.serializable.deserialize.deserialize-a73458dbbb" parent="stdx.serialization.serialization.interface.serializable.deserialize" -->
# Serializable.static func deserialize(DataModel)

[← Serializable.deserialize](index.md)

## 签名

```cangjie role=signature
public static func deserialize(dm: DataModel): Float64
```

将 DataModel 反序列化为 Float64。

适用扩展：[extend Float64 <: Serializable](../extensions/extend-float64-serializable.md)。

## 契约

参数：

- dm: DataModel - 需要被反序列化的 DataModel。

返回值：

- Float64 - 反序列化后的 Float64。

异常：

- DataModelException - 当 `dm` 的类型不是 DataModelFloat 或者 DataModelInt 时，抛出异常。
