<!-- cj-doc kind="api-member" level="7" id="std.collection.class.hashmap.operator-ne" parent="std.collection.class.hashmap.extension.extend-k-v-hashmap-k-v-equatable-hashmap-k-v-where-v-equatable-v" -->
# HashMap<K, V> where K <: Hashable & Equatable<K>.!=

[← extend<K, V> HashMap<K, V> <: Equatable<HashMap<K, V>> where V <: Equatable<V>](extensions/extend-k-v-hashmap-k-v-equatable-hashmap-k-v-where-v-equatable-v.md)

## 签名

```cangjie role=signature
public operator func !=(right: HashMap<K, V>): Bool
```

判断当前实例与参数指向的 HashMap<K, V> 实例是否不等。

## 契约

参数：

- right: HashMap\<K, V> - 被比较的对象。

返回值：

- Bool - 如果不等，则返回 true，否则返回 false。
