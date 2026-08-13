<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.class.concurrenthashmap.get" parent="std.collection.concurrent.class.concurrenthashmap" -->
# ConcurrentHashMap<K, V> where K <: Hashable & Equatable<K>.get

[← ConcurrentHashMap<K, V> where K <: Hashable & Equatable<K>](index.md)

## 签名

```cangjie role=signature
public func get(key: K): ?V
```

返回此映射中键 key 所关联的值。

## 契约

参数：

- key: K - 传递 key，获取 value。

返回值：

- ?V - 此映射中键 key 所关联的值。
