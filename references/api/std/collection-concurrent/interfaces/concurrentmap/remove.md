<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.interface.concurrentmap.remove" parent="std.collection.concurrent.interface.concurrentmap" -->
# ConcurrentMap<K, V>.remove

[← ConcurrentMap<K, V>](index.md)

## 签名

```cangjie role=signature
func remove(key: K): ?V
```

从此映射中删除指定键 key 的映射（如果存在）。

## 契约

参数：

- key: K - 传入要删除的 key。

返回值：

- ?V - 如果移除之前 key 存在，则返回 key 对应的值 Some(V)；当移除时 key 不存在时，返回 None。
