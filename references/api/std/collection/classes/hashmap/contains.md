<!-- cj-doc kind="api-member" level="6" id="std.collection.class.hashmap.contains" parent="std.collection.class.hashmap" -->
# HashMap<K, V> where K <: Hashable & Equatable<K>.contains

[← HashMap<K, V> where K <: Hashable & Equatable<K>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func contains(Collection<K>)

### 签名

```cangjie role=signature
public func contains(all!: Collection<K>): Bool
```

判断是否包含指定集合中所有键的映射。

### 契约

参数：

- all!: Collection\<K> - 键传递待判断的 keys。

返回值：

- Bool - 如果都包含，则返回 true；否则，返回 false。

## func contains(K)

### 签名

```cangjie role=signature
public func contains(key: K): Bool
```

判断是否包含指定键的映射。

### 契约

参数：

- key: K - 传递要判断的 key。

返回值：

- Bool - 如果存在，则返回 true；否则，返回 false。
