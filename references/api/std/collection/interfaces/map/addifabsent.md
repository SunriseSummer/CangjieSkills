<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.map.addifabsent" parent="std.collection.interface.map" -->
# Map<K, V>.addIfAbsent

[← Map<K, V>](index.md)

## 签名

```cangjie role=signature
func addIfAbsent(key: K, value: V): ?V
```

如果 key 不在当前 Map 中，添加指定键值对 key-value。

## 契约

功能：如果 key 不在当前 Map 中，添加指定键值对 key-value。否则不做修改。

参数：

- key: K - 待添加键值对的键。
- value: V - 待添加键值对的值。

返回值：

- ?V - 如果调用该函数时当前 Map 中已有指定的 key，返回该 key 对应的旧值，否则返回 None。
