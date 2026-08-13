<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.interface.concurrentmap.replace" parent="std.collection.concurrent.interface.concurrentmap" -->
# ConcurrentMap<K, V>.replace

[← ConcurrentMap<K, V>](index.md)

## 签名

```cangjie role=signature
func replace(key: K, value: V): ?V
```

如果 Map 中存在 key，则将 Map 中键 key 关联的值替换为 value；如果 Map 中不存在 key，则不对 Map 做任何修改。

## 契约

参数：

- key: K - 传入要替换所关联值的键。
- value: V - 传入要替换成的新值。

返回值：

- ?V - 如果 key 存在，则返回 key 对应的旧值 Some(V)；当 key 不存在时，返回 None。
