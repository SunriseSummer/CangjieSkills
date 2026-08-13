<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treemap.get" parent="std.collection.class.treemap" -->
# TreeMap<K, V> where K <: Comparable<K>.get

[← TreeMap<K, V> where K <: Comparable<K>](index.md)

## 签名

```cangjie role=signature
public func get(key: K): ?V
```

返回指定键映射的值。

## 契约

参数：

- key: K - 指定的键。

返回值：

- ?V - 如果存在这样一个值，用 Option 封装该值并返回；否则，返回 Option\<V>.None。
