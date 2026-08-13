<!-- cj-doc kind="api-member" level="7" id="stdx.serialization.serialization.interface.serializable.deserialize.deserialize-0758e3c324" parent="stdx.serialization.serialization.interface.serializable.deserialize" -->
# Serializable.static func deserialize(DataModel)

[← Serializable.deserialize](index.md)

## 签名

```cangjie role=signature
public static func deserialize(dm: DataModel): Option<T>
```

将 DataModel 反序列化为 Option<T>。

适用扩展：[extend<T> Option<T> <: Serializable<Option<T>> where T <: Serializable<T>](../extensions/extend-t-option-t-serializable-option-t-where-t-serializable-t.md)。

## 契约

参数：

- dm: DataModel - 需要被反序列化的 DataModel。

返回值：

- Option\<T> - 反序列化后的 Option\<T>。

异常：

- DataModelException - 当 `dm` 的类型不支持反序列化到 T 类型时，抛出异常。
