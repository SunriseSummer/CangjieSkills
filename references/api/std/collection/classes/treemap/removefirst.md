<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treemap.removefirst" parent="std.collection.class.treemap" -->
# TreeMap<K, V> where K <: Comparable<K>.removeFirst

[← TreeMap<K, V> where K <: Comparable<K>](index.md)

## 签名

```cangjie role=signature
public func removeFirst(): ?(K, V)
```

删除 TreeMap 的第一个元素。

## 契约

返回值：

- ?(K, V) - 如果存在第一个元素，那么删除该元素，用 Option 封装该元素并返回；否则返回 Option\<(K, V)>.None。
