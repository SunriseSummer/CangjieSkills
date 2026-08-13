<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.class.concurrenthashmap.isempty" parent="std.collection.concurrent.class.concurrenthashmap" -->
# ConcurrentHashMap<K, V> where K <: Hashable & Equatable<K>.isEmpty

[← ConcurrentHashMap<K, V> where K <: Hashable & Equatable<K>](index.md)

## 签名

```cangjie role=signature
public func isEmpty(): Bool
```

判断 ConcurrentHashMap 是否为空。

## 契约

> **注意：**
>
> 此方法不保证并发场景下的原子性，建议在环境中没有其他线程并发地修改 ConcurrentHashMap 时调用。

返回值：

- Bool - 如果是，则返回 true，否则，返回 false。
