<!-- cj-doc kind="api-member" level="7" id="stdx.serialization.serialization.interface.serializable.deserialize.deserialize-22d1f52b08" parent="stdx.serialization.serialization.interface.serializable.deserialize" -->
# Serializable.static func deserialize(DataModel)

[← Serializable.deserialize](index.md)

## 签名

```cangjie role=signature
public static func deserialize(dm: DataModel): HashMap<K, V>
```

将 DataModel 反序列化为 HashMap<K, V>。

适用扩展：[extend<K, V> HashMap<K, V> <: Serializable<HashMap<K, V>> where K <: Serializable<K> & Hashable & Equatable<K>, V <: Serializable<V>](../extensions/extend-k-v-hashmap-k-v-serializable-hashmap-k-v-where-k-seriali-21aafa8d.md)。

## 契约

参数：

- dm: DataModel - 需要被反序列化的 DataModel。

返回值：

- HashMap\<K, V> - 反序列化后的 HashMap\<K, V>。

异常：

- DataModelException - 当 `dm` 不是 DataModelStruct 类型，或者 DataModelStruct 类型的 `dm` 中的 Field 不是 String 类型时，抛出异常。
