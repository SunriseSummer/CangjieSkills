<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.interface.concurrentmap.addifabsent" parent="std.collection.concurrent.interface.concurrentmap" -->
# ConcurrentMap<K, V>.addIfAbsent

[← ConcurrentMap<K, V>](index.md)

## 签名

```cangjie role=signature
func addIfAbsent(key: K, value: V): ?V
```

当此 Map 中不存在键 key 时，在 Map 中添加指定的值 value 与指定的键 key 的关联。

## 契约

功能：当此 Map 中不存在键 key 时，在 Map 中添加指定的值 value 与指定的键 key 的关联。如果 Map 已经包含键 key，则不执行赋值操作。

参数：

- key: K - 要放置的键。
- value: V - 要分配的值。

返回值：

- ?V - 如果赋值之前 key 存在，则返回当前 key 对应的值 Some(V)，且不执行赋值操作；当赋值前 key 不存在时，返回 None。
