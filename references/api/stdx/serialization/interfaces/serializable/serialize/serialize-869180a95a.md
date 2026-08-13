<!-- cj-doc kind="api-member" level="7" id="stdx.serialization.serialization.interface.serializable.serialize.serialize-869180a95a" parent="stdx.serialization.serialization.interface.serializable.serialize" -->
# Serializable.func serialize()

[← Serializable.serialize](index.md)

## 签名

```cangjie role=signature
public func serialize(): DataModel
```

将 HashMap<K, V> 序列化为 DataModelSeq。

适用扩展：[extend<K, V> HashMap<K, V> <: Serializable<HashMap<K, V>> where K <: Serializable<K> & Hashable & Equatable<K>, V <: Serializable<V>](../extensions/extend-k-v-hashmap-k-v-serializable-hashmap-k-v-where-k-seriali-21aafa8d.md)。

## 契约

返回值：

- DataModel - 序列化的 DataModelSeq。

异常：

- DataModelException - 当前 HashMap 实例中的 Key 不是 String 类型时，抛出异常。
