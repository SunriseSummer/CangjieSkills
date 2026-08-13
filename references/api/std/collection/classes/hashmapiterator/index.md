<!-- cj-doc kind="api-type" level="5" id="std.collection.class.hashmapiterator" parent="std.collection" -->
# HashMapIterator<K, V> where K <: Hashable & Equatable<K>

[← std.collection](../../index.md)

`HashMapIterator<K, V> <: Iterator<(K, V)> where K <: Hashable & Equatable<K>`

此类主要实现 HashMap 的迭代器功能。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(map: HashMap<K, V>)`](init.md) | 创建 HashMapIterator<K, V> 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`next(): ?(K, V)`](next.md) | 返回迭代器中的下一个元素。 |
| [`remove(): Option<(K, V)>`](remove.md) | 删除此 HashMap 迭代器的 next 函数返回的元素，此函数只能在 next 函数调用时调用一次。 |
