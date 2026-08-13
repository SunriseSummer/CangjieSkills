<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.map.operator-indexer" parent="std.collection.interface.map" -->
# Map<K, V>.[]

[← Map<K, V>](index.md)

## 签名

```cangjie role=signature
operator func [](key: K, value!: V): Unit
```

运算符重载集合，如果键存在，新 value 覆盖旧 value，如果键不存在，添加此键值对。

## 契约

参数：

- key: K - 需要进行设置的键。
- value!: V - 传递要设置的值。
