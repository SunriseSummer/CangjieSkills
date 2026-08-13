<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.map.add" parent="std.collection.interface.map" -->
# Map<K, V>.add

[← Map<K, V>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func add(Collection<(K, V)>)

### 签名

```cangjie role=signature
func add(all!: Collection<(K, V)>): Unit
```

将新的键值对放入 Map 中。

### 契约

功能：将新的键值对放入 Map 中。对于 Map 中已有的键，该键映射的值将被新值替换。

参数：

- all!: Collection\<(K, V)> - 需要放入到 Map 中的键值对集合。

## func add(K, V)

### 签名

```cangjie role=signature
func add(key: K, value: V): ?V
```

将传入的键值对放入该 Map 中。

### 契约

功能：将传入的键值对放入该 Map 中。对于 Map 中已有的键，该键映射的值将被新值替换。

参数：

- key: K - 要放置的键。
- value: V - 要分配的值。

返回值：

- ?V - 如果赋值之前 key 存在，返回旧值，否则返回 None。
