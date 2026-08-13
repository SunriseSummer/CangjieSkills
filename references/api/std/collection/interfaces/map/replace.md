<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.map.replace" parent="std.collection.interface.map" -->
# Map<K, V>.replace

[← Map<K, V>](index.md)

## 签名

```cangjie role=signature
func replace(key: K, value: V): ?V
```

如果当前 Map 中已有指定 key，将其值修改为 value。

## 契约

功能：如果当前 Map 中已有指定 key，将其值修改为 value。否则不做修改。

参数：

- key: K - 待修改键值对的键。
- value: V - 待修改键值对的新值。

返回值：

- ?V - 如果当前 Map 中已有指定 key，返回其旧值。否则返回 None。
