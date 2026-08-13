<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treemap.iterator" parent="std.collection.class.treemap" -->
# TreeMap<K, V> where K <: Comparable<K>.iterator

[← TreeMap<K, V> where K <: Comparable<K>](index.md)

## 签名

```cangjie role=signature
public func iterator(): Iterator<(K, V)>
```

返回 TreeMap 的迭代器，迭代器按 Key 值从小到大的顺序迭代。

## 契约

返回值：

- Iterator\<(K, V)> - TreeMap 的迭代器。
