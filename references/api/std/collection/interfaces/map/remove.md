<!-- cj-doc kind="api-member" level="6" id="std.collection.interface.map.remove" parent="std.collection.interface.map" -->
# Map<K, V>.remove

[← Map<K, V>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func remove(Collection<K>)

### 签名

```cangjie role=signature
func remove(all!: Collection<K>): Unit
```

从此映射中删除指定集合的映射（如果存在）。

### 契约

参数：

- all!: Collection\<K> - 传入要删除的集合。

## func remove(K)

### 签名

```cangjie role=signature
func remove(key: K): Option<V>
```

从此 Map 中删除指定键的映射（如果存在）。

### 契约

参数：

- key: K - 传入要删除的 key。

返回值：

- Option\<V> - 从 Map 中移除的键对应的值。用 Option 封装。
