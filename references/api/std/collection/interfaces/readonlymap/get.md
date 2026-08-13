<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.readonlymap.get" parent="std.collection.interface.readonlymap" -->
# ReadOnlyMap<K, V>.get

[← ReadOnlyMap<K, V>](index.md)

## 签名

```cangjie role=signature
func get(key: K): ?V
```

根据 key 得到 ReadOnlyMap 中映射的值。

## 契约

参数：

- key: K - 传递 key，获取 value。

返回值：

- ?V - ReadOnlyMap 中与 Key 对应的值。
