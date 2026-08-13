<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.class.concurrenthashmap.iterator" parent="std.collection.concurrent.class.concurrenthashmap" -->
# ConcurrentHashMap<K, V> where K <: Hashable & Equatable<K>.iterator

[← ConcurrentHashMap<K, V> where K <: Hashable & Equatable<K>](index.md)

## 签名

```cangjie role=signature
public func iterator(): ConcurrentHashMapIterator<K, V>
```

获取 ConcurrentHashMap 的迭代器。

## 契约

返回值：

- ConcurrentHashMapIterator\<K, V> - ConcurrentHashMap 的迭代器
