<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treemap.add" parent="std.collection.class.treemap" -->
# TreeMap<K, V> where K <: Comparable<K>.add

[← TreeMap<K, V> where K <: Comparable<K>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func add(Collection<(K, V)>)

### 签名

```cangjie role=signature
public func add(all!: Collection<(K, V)>): Unit
```

将新的键值对集合放入 TreeMap 中。

### 契约

功能：将新的键值对集合放入 TreeMap 中。对于 TreeMap 中已有的键，该键的值将被新值替换。

参数：

- all!: Collection\<(K, V)> - 需要添加进 TreeMap 的键值对集合。

## func add(K, V)

### 签名

```cangjie role=signature
public func add(key: K, value: V): Option<V>
```

将新的键值对放入 TreeMap 中。

### 契约

功能：将新的键值对放入 TreeMap 中。对于 TreeMap 中已有的键，该键的值将被新值替换。

参数：

- key: K - 要放置的键。
- value: V - 要分配的值。

返回值：

- Option\<V> - 如果赋值之前 key 存在，旧的 value 用 Option 封装并返回；否则，返回 Option\<V>.None。
