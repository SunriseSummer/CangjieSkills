<!-- cj-doc kind="api-member" level="5" id="std.collection.func.collecthashmap-k-v-iterable-k-v-where-k-hashable-equatable-k" parent="std.collection" -->
# collectHashMap<K, V>(Iterable<(K, V)>) where K <: Hashable & Equatable<K>

[← std.collection](../index.md)

## 签名

```cangjie role=signature
public func collectHashMap<K, V>(it: Iterable<(K, V)>): HashMap<K, V> where K <: Hashable & Equatable<K>
```

将一个迭代器转换成 HashMap 类型。

## 契约

参数：

- it: Iterable\<(K, V)> - 给定的迭代器。

返回值：

- HashMap\<K, V> - 返回一个 HashMap。
