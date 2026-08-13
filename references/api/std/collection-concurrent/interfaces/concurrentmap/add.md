<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.interface.concurrentmap.add" parent="std.collection.concurrent.interface.concurrentmap" -->
# ConcurrentMap<K, V>.add

[← ConcurrentMap<K, V>](index.md)

## 签名

```cangjie role=signature
func add(key: K, value: V): ?V
```

将指定的值 value 与此 Map 中指定的键 key 关联。

## 契约

功能：将指定的值 value 与此 Map 中指定的键 key 关联。如果 Map 中已经包含键 key 的关联，则旧值将被替换；如果 Map 中不包含键 key 的关联，则添加键 key 与值 value 的关联。

参数：

- key: K - 要放置的键。
- value: V - 要关联的值。

返回值：

- ?V - 如果赋值之前 key 存在，则返回旧的值 Some(V)；当赋值前 key 不存在时，返回 None。
