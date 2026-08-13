<!-- cj-doc kind="api-member" level="6" id="std.collection.class.hashmap.keys" parent="std.collection.class.hashmap" -->
# HashMap<K, V> where K <: Hashable & Equatable<K>.keys

[← HashMap<K, V> where K <: Hashable & Equatable<K>](index.md)

## 签名

```cangjie role=signature
public func keys(): EquatableCollection<K>
```

返回 HashMap 中所有的 key，并将所有 key 存储在一个 Keys 容器中。

## 契约

返回值：

- EquatableCollection\<K> - 保存所有返回的 key。
