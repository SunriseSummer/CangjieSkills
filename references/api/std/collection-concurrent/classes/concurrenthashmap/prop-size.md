<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.class.concurrenthashmap.prop-size" parent="std.collection.concurrent.class.concurrenthashmap" -->
# ConcurrentHashMap<K, V> where K <: Hashable & Equatable<K>.size

[← ConcurrentHashMap<K, V> where K <: Hashable & Equatable<K>](index.md)

## 签名

```cangjie role=signature
public prop size: Int64
```

返回键值的个数。

## 契约

> **注意：**
>
> 此方法不保证并发场景下的原子性，建议在环境中没有其他线程并发地修改 ConcurrentHashMap 时调用。

类型：Int64
