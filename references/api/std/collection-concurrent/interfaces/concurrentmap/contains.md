<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.interface.concurrentmap.contains" parent="std.collection.concurrent.interface.concurrentmap" -->
# ConcurrentMap<K, V>.contains

[← ConcurrentMap<K, V>](index.md)

## 签名

```cangjie role=signature
func contains(key: K): Bool
```

判断 Map 中是否包含指定键 key 的关联。

## 契约

参数：

- key: K - 传递要判断的 key。

返回值：

- Bool - 当 key 存在时返回 true；当 key 不存在时返回 false。
