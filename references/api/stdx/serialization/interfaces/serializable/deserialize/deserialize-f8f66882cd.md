<!-- cj-doc kind="api-member" level="7" id="stdx.serialization.serialization.interface.serializable.deserialize.deserialize-f8f66882cd" parent="stdx.serialization.serialization.interface.serializable.deserialize" -->
# Serializable.static func deserialize(DataModel)

[← Serializable.deserialize](index.md)

## 签名

```cangjie role=signature
public static func deserialize(dm: DataModel): String
```

将 DataModel 反序列化为 String。

适用扩展：[extend String <: Serializable](../extensions/extend-string-serializable.md)。

## 契约

参数：

- dm: DataModel - 需要被反序列化的 DataModel。

返回值：

- String - 反序列化后的 String。

异常：

- DataModelException - 当 `dm` 的类型不是 DataModelString 时，则抛出异常。
