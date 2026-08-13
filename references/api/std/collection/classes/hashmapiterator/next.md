<!-- cj-doc kind="api-member" level="6" id="std.collection.class.hashmapiterator.next" parent="std.collection.class.hashmapiterator" -->
# HashMapIterator<K, V> where K <: Hashable & Equatable<K>.next

[← HashMapIterator<K, V> where K <: Hashable & Equatable<K>](index.md)

## 签名

```cangjie role=signature
public func next(): ?(K, V)
```

返回迭代器中的下一个元素。

## 契约

返回值：

- ?(K, V) - 迭代器中的下一个元素，用 Option 封装。

异常：

- ConcurrentModificationException - 当函数检测到不同步的并发修改，抛出异常。
