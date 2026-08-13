<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.readonlymap.operator-indexer" parent="std.collection.interface.readonlymap" -->
# ReadOnlyMap<K, V>.[]

[← ReadOnlyMap<K, V>](index.md)

## 签名

```cangjie role=signature
operator func [](key: K): V
```

运算符重载集合，如果键存在，返回键对应的值，如果不存在，抛出异常。

## 契约

参数：

- key: K - 需要进行查找的键。

返回值：

- V - 与键对应的值。
