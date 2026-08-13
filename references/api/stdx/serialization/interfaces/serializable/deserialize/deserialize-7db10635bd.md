<!-- cj-doc kind="api-member" level="7" id="stdx.serialization.serialization.interface.serializable.deserialize.deserialize-7db10635bd" parent="stdx.serialization.serialization.interface.serializable.deserialize" -->
# Serializable.static func deserialize(DataModel)

[← Serializable.deserialize](index.md)

## 签名

```cangjie role=signature
public static func deserialize(dm: DataModel): ArrayList<T>
```

将 DataModel 反序列化为 ArrayList<T>。

适用扩展：[extend<T> ArrayList<T> <: Serializable<ArrayList<T>> where T <: Serializable<T>](../extensions/extend-t-arraylist-t-serializable-arraylist-t-where-t-serializable-t.md)。

## 契约

参数：

- dm: DataModel - 需要被反序列化的 DataModel。

返回值：

- ArrayList\<T> - 反序列化后的 ArrayList\<T>。

异常：

- DataModelException - 当 `dm` 的类型不是 DataModelSeq 时，抛出异常。
