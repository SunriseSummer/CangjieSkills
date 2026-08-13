<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treemap.prop-first" parent="std.collection.class.treemap" -->
# TreeMap<K, V> where K <: Comparable<K>.first

[← TreeMap<K, V> where K <: Comparable<K>](index.md)

## 签名

```cangjie role=signature
public prop first: ?(K, V)
```

获取 TreeMap 的第一个元素。

## 契约

功能：获取 TreeMap 的第一个元素。如果存在第一个元素，用 Option 封装该元素并返回；否则返回 Option\<(K, V)>.None。

类型：?(K, V)
