<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treemap.prop-last" parent="std.collection.class.treemap" -->
# TreeMap<K, V> where K <: Comparable<K>.last

[← TreeMap<K, V> where K <: Comparable<K>](index.md)

## 签名

```cangjie role=signature
public prop last: ?(K, V)
```

获取 TreeMap 的最后一个元素。

## 契约

功能：获取 TreeMap 的最后一个元素。如果存在最后一个元素，用 Option 封装该元素并返回；否则返回 Option\<(K, V)>.None。

返回值：

类型：?(K, V)
