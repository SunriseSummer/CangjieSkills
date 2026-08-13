<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.interface.concurrentmap.get" parent="std.collection.concurrent.interface.concurrentmap" -->
# ConcurrentMap<K, V>.get

[← ConcurrentMap<K, V>](index.md)

## 签名

```cangjie role=signature
func get(key: K): ?V
```

返回 Map 中键 key 所关联的值。

## 契约

参数：

- key: K - 传递 key，获取 value。

返回值：

- ?V - 当 key 存在时，返回其关联的值 Some(V)；当 key 不存在时，返回 None。
