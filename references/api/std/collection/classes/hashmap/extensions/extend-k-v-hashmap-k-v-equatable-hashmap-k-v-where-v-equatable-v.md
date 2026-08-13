<!-- cj-doc kind="api-extension" level="6" id="std.collection.class.hashmap.extension.extend-k-v-hashmap-k-v-equatable-hashmap-k-v-where-v-equatable-v" parent="std.collection.class.hashmap" -->
# extend<K, V> HashMap<K, V> <: Equatable<HashMap<K, V>> where V <: Equatable<V>

[← HashMap<K, V> where K <: Hashable & Equatable<K>](../index.md)

`extend<K, V> HashMap<K, V> <: Equatable<HashMap<K, V>> where V <: Equatable<V>`

为 HashMap<K, V> 类型扩展 Equatable<HashMap<K, V>> 接口，支持判等操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`operator !=(right: HashMap<K, V>): Bool`](../operator-ne.md) | 判断当前实例与参数指向的 HashMap<K, V> 实例是否不等。 |
| [`operator ==(right: HashMap<K, V>): Bool`](../operator-eq.md) | 判断当前实例与参数指向的 HashMap<K, V> 实例是否相等。 |
