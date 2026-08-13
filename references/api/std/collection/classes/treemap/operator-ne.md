<!-- cj-doc kind="api-member" level="7" id="std.collection.class.treemap.operator-ne" parent="std.collection.class.treemap.extension.extend-k-v-treemap-k-v-equatable-treemap-k-v-where-v-equatable-v" -->
# TreeMap<K, V> where K <: Comparable<K>.!=

[← extend<K, V> TreeMap<K, V> <: Equatable<TreeMap<K, V>> where V <: Equatable<V>](extensions/extend-k-v-treemap-k-v-equatable-treemap-k-v-where-v-equatable-v.md)

## 签名

```cangjie role=signature
public operator func !=(right: TreeMap<K, V>): Bool
```

判断当前实例与参数指向的 TreeMap<K, V> 实例是否不等。

## 契约

参数：

- right: TreeMap\<K, V> - 被比较的对象。

返回值：

- Bool - 如果不等，则返回 true，否则返回 false。
