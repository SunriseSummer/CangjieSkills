<!-- cj-doc kind="api-member" level="7" id="stdx.serialization.serialization.interface.serializable.deserialize.deserialize-63df4ab873" parent="stdx.serialization.serialization.interface.serializable.deserialize" -->
# Serializable.static func deserialize(DataModel)

[← Serializable.deserialize](index.md)

## 签名

```cangjie role=signature
public static func deserialize(dm: DataModel): Bool
```

将 DataModel 反序列化为 Bool。

适用扩展：[extend Bool <: Serializable](../extensions/extend-bool-serializable.md)。

## 契约

参数：

- dm: DataModel - 需要被反序列化的 DataModel。

返回值：

- Bool - 反序列化后的 Bool。

异常：

- DataModelException - 当 `dm` 的类型不是 DataModelBool 时，抛出异常。
