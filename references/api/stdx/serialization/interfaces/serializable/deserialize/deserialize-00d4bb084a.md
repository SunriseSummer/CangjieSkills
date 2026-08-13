<!-- cj-doc kind="api-member" level="7" id="stdx.serialization.serialization.interface.serializable.deserialize.deserialize-00d4bb084a" parent="stdx.serialization.serialization.interface.serializable.deserialize" -->
# Serializable.static func deserialize(DataModel)

[← Serializable.deserialize](index.md)

## 签名

```cangjie role=signature
public static func deserialize(dm: DataModel): Float16
```

将 DataModel 反序列化为 Float16。

适用扩展：[extend Float16 <: Serializable](../extensions/extend-float16-serializable.md)。

## 契约

参数：

- dm: DataModel - 需要被反序列化的 DataModel。

返回值：

- Float16 - 反序列化后的 Float16。

异常：

- DataModelException - 当 `dm` 的类型不是 DataModelFloat 或者 DataModelInt 时，抛出异常。
