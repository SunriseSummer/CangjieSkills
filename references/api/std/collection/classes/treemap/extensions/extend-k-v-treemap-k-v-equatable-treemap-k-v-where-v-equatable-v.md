<!-- cj-doc kind="api-extension" level="6" id="std.collection.class.treemap.extension.extend-k-v-treemap-k-v-equatable-treemap-k-v-where-v-equatable-v" parent="std.collection.class.treemap" -->
# extend<K, V> TreeMap<K, V> <: Equatable<TreeMap<K, V>> where V <: Equatable<V>

[← TreeMap<K, V> where K <: Comparable<K>](../index.md)

`extend<K, V> TreeMap<K, V> <: Equatable<TreeMap<K, V>> where V <: Equatable<V>`

为 TreeMap<K, V> 类型扩展 Equatable<TreeMap<K, V>> 接口，支持判等操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`operator !=(right: TreeMap<K, V>): Bool`](../operator-ne.md) | 判断当前实例与参数指向的 TreeMap<K, V> 实例是否不等。 |
| [`operator ==(right: TreeMap<K, V>): Bool`](../operator-eq.md) | 判断当前实例与参数指向的 TreeMap<K, V> 实例是否相等。 |
