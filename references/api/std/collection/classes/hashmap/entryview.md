<!-- cj-doc kind="api-member" level="6" id="std.collection.class.hashmap.entryview" parent="std.collection.class.hashmap" -->
# HashMap<K, V> where K <: Hashable & Equatable<K>.entryView

[← HashMap<K, V> where K <: Hashable & Equatable<K>](index.md)

## 签名

```cangjie role=signature
public func entryView(key: K): MapEntryView<K, V>
```

如果不包含特定键，返回一个空的引用视图。

## 契约

功能：如果不包含特定键，返回一个空的引用视图。如果包含特定键，则返回该键对应的元素的引用视图。

参数：

- key: K - 要添加的键值对的键。

返回值：

- MapEntryView\<K, V> - 一个引用视图。
