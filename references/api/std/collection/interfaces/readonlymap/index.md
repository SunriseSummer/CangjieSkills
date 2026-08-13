<!-- cj-doc kind="api-type" level="5" id="std.collection.interface.readonlymap" parent="std.collection" -->
# ReadOnlyMap<K, V>

[← std.collection](../../index.md)

`ReadOnlyMap<K, V> <: Collection<(K, V)>`

ReadOnlyMap 接口提供了一种将键映射到值的方式。

## 方法

| 签名 | 功能 |
|---|---|
| [`contains(all!: Collection<K>): Bool`](contains.md) | 判断是否包含指定集合键的映射。 |
| [`contains(key: K): Bool`](contains.md) | 判断是否包含指定键的映射。 |
| [`get(key: K): ?V`](get.md) | 根据 key 得到 ReadOnlyMap 中映射的值。 |
| [`keys(): EquatableCollection<K>`](keys.md) | 返回 ReadOnlyMap 中所有的 key，并将所有 key 存储在一个 EquatableCollection<K> 容器中。 |
| [`values(): Collection<V>`](values.md) | 返回 ReadOnlyMap 中所有的 value，并将所有 value 存储在一个 Collection<V> 容器中。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator [](key: K): V`](operator-indexer.md) | 运算符重载集合，如果键存在，返回键对应的值，如果不存在，抛出异常。 |
