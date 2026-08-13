<!-- cj-doc kind="api-member" level="6" id="std.collection.class.hashmapiterator.remove" parent="std.collection.class.hashmapiterator" -->
# HashMapIterator<K, V> where K <: Hashable & Equatable<K>.remove

[← HashMapIterator<K, V> where K <: Hashable & Equatable<K>](index.md)

## 签名

```cangjie role=signature
public func remove(): Option<(K, V)>
```

删除此 HashMap 迭代器的 next 函数返回的元素，此函数只能在 next 函数调用时调用一次。

## 契约

返回值：

- Option\<(K, V)> - 返回被删除的元素。

异常：

- ConcurrentModificationException - 当函数检测到不同步的并发修改，抛出异常。
