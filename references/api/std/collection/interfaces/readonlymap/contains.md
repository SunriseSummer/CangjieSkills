<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.readonlymap.contains" parent="std.collection.interface.readonlymap" -->
# ReadOnlyMap<K, V>.contains

[← ReadOnlyMap<K, V>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func contains(Collection<K>)

### 签名

```cangjie role=signature
func contains(all!: Collection<K>): Bool
```

判断是否包含指定集合键的映射。

### 契约

参数：

- all!: Collection\<K> - 传递待判断的 的集合。

返回值：

- Bool - 如果存在，则返回 true；否则，返回 false。

## func contains(K)

### 签名

```cangjie role=signature
func contains(key: K): Bool
```

判断是否包含指定键的映射。

### 契约

参数：

- key: K - 传递要判断的 key。

返回值：

- Bool - 如果存在，则返回 true；否则，返回 false。
