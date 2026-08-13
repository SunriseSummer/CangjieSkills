<!-- cj-doc kind="api-member" level="7" id="stdx.serialization.serialization.interface.serializable.deserialize.deserialize-f25a4fdd7d" parent="stdx.serialization.serialization.interface.serializable.deserialize" -->
# Serializable.static func deserialize(DataModel)

[← Serializable.deserialize](index.md)

## 签名

```cangjie role=signature
public static func deserialize(dm: DataModel): Rune
```

将 DataModel 反序列化为 Rune。

适用扩展：[extend Rune <: Serializable](../extensions/extend-rune-serializable.md)。

## 契约

参数：

- dm: DataModel - 需要被反序列化的 DataModel。

返回值：

- Rune - 反序列化后的字符。

异常：

- DataModelException - 当 `dm` 的类型不是 DataModelString 时，则抛出此异常。
- Exception - 当 `dm` 的类型不是 Rune 时，则抛出此异常。
