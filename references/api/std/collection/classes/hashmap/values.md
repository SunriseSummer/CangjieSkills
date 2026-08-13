<!-- cj-doc kind="api-member" level="6" id="std.collection.class.hashmap.values" parent="std.collection.class.hashmap" -->
# HashMap<K, V> where K <: Hashable & Equatable<K>.values

[← HashMap<K, V> where K <: Hashable & Equatable<K>](index.md)

## 签名

```cangjie role=signature
public func values(): Collection<V>
```

返回 HashMap 中包含的值，并将所有的 value 存储在一个 Values 容器中。

## 契约

返回值：

- Collection\<V> - 保存所有返回的 value。
