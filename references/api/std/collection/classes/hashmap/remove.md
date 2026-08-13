<!-- cj-doc kind="api-member" level="6" id="std.collection.class.hashmap.remove" parent="std.collection.class.hashmap" -->
# HashMap<K, V> where K <: Hashable & Equatable<K>.remove

[← HashMap<K, V> where K <: Hashable & Equatable<K>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func remove(Collection<K>)

### 签名

```cangjie role=signature
public func remove(all!: Collection<K>): Unit
```

从此 HashMap 中删除指定集合中键的映射（如果存在）。

### 契约

参数：

- all!: Collection\<K> - 传入要删除的键的集合。

## func remove(K)

### 签名

```cangjie role=signature
public func remove(key: K): Option<V>
```

从此 HashMap 中删除指定键的映射（如果存在）。

### 契约

参数：

- key: K - 传入要删除的 key。

返回值：

- Option\<V> - 被从 HashMap 中移除的键对应的值，用 Option 封装，如果 HashMap 中不存该键，返回 None 。
