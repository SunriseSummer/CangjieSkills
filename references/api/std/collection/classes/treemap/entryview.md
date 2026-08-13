<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treemap.entryview" parent="std.collection.class.treemap" -->
# TreeMap<K, V> where K <: Comparable<K>.entryView

[← TreeMap<K, V> where K <: Comparable<K>](index.md)

## 签名

```cangjie role=signature
public func entryView(k: K): MapEntryView<K, V>
```

如果不包含特定键，返回一个空的引用视图。

## 契约

功能：如果不包含特定键，返回一个空的引用视图。如果包含特定键，则返回该键对应的元素的引用视图。

参数：

- k: K - 要添加的键值对的键。

返回值：

- MapEntryView\<K, V> - 一个引用视图。
