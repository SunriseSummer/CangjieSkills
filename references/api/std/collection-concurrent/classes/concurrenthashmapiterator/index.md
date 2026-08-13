<!-- cj-doc kind="api-type" level="5" id="std.collection.concurrent.class.concurrenthashmapiterator" parent="std.collection.concurrent" -->
# ConcurrentHashMapIterator<K, V> where K <: Hashable & Equatable<K>

[← std.collection.concurrent](../../index.md)

`ConcurrentHashMapIterator<K, V> <: Iterator<(K, V)> where K <: Hashable & Equatable<K>`

此类主要实现 ConcurrentHashMap 的迭代器功能。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(cmap: ConcurrentHashMap<K, V>)`](init.md) | 创建 ConcurrentHashMapIterator<K, V> 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`next(): Option<(K, V)>`](next.md) | 返回迭代中的下一个元素。 |
