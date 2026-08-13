<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treemap.remove" parent="std.collection.class.treemap" -->
# TreeMap<K, V> where K <: Comparable<K>.remove

[← TreeMap<K, V> where K <: Comparable<K>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func remove(Collection<K>)

### 签名

```cangjie role=signature
public func remove(all!: Collection<K>): Unit
```

从此映射中删除指定集合的映射（如果存在）。

### 契约

参数：

- all!: Collection\<K> - 传入要删除的键的集合。

## func remove(K)

### 签名

```cangjie role=signature
public func remove(key: K): Option<V>
```

从此映射中删除指定键的映射（如果存在）。

### 契约

参数：

- key: K - 传入要删除的 key。

返回值：

- Option\<V> - 被移除映射的值用 Option 封装，如果 TreeMap 中不存在指定的键，返回 None。
