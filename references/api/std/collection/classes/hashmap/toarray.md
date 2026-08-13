<!-- cj-doc kind="api-member" level="6" id="std.collection.class.hashmap.toarray" parent="std.collection.class.hashmap" -->
# HashMap<K, V> where K <: Hashable & Equatable<K>.toArray

[← HashMap<K, V> where K <: Hashable & Equatable<K>](index.md)

## 签名

```cangjie role=signature
public func toArray(): Array<(K, V)>
```

构造一个包含 HashMap 内键值对的数组，并返回。

## 契约

返回值：

- Array\<(K, V)> - 包含容器内所有键值对的数组。
