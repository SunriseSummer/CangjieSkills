<!-- cj-doc kind="api-extension" level="6" id="stdx.serialization.serialization.interface.serializable.extension.extend-k-v-hashmap-k-v-serializable-hashmap-k-v-where-k-seriali-21aafa8d" parent="stdx.serialization.serialization.interface.serializable" -->
# extend<K, V> HashMap<K, V> <: Serializable<HashMap<K, V>> where K <: Serializable<K> & Hashable & Equatable<K>, V <: Serializable<V>

[← Serializable](../index.md)

`extend<K, V> HashMap<K, V> <: Serializable<HashMap<K, V>> where K <: Serializable<K> & Hashable & Equatable<K>, V <: Serializable<V>`

为 HashMap<K, V> 类型实现 Serializable<HashMap<K, V>> 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`static deserialize(dm: DataModel): HashMap<K, V>`](../deserialize/index.md) | 将 DataModel 反序列化为 HashMap<K, V>。 |
| [`serialize(): DataModel`](../serialize/index.md) | 将 HashMap<K, V> 序列化为 DataModelSeq。 |
