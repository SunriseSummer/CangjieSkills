<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.class.concurrenthashmap.contains" parent="std.collection.concurrent.class.concurrenthashmap" -->
# ConcurrentHashMap<K, V> where K <: Hashable & Equatable<K>.contains

[← ConcurrentHashMap<K, V> where K <: Hashable & Equatable<K>](index.md)

## 签名

```cangjie role=signature
public func contains(key: K): Bool
```

判断此映射中是否包含指定键 key 的映射。

## 契约

参数：

- key: K - 传递要判断的 key。

返回值：

- Bool - 是否包含指定键 key 的映射，包含为 true，不包含为 false。
