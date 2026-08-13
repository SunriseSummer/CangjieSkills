<!-- cj-doc kind="api-type" level="5" id="std.collection.interface.map" parent="std.collection" -->
# Map<K, V>

[← std.collection](../../index.md)

`Map<K, V> <: ReadOnlyMap<K, V>`

Map 接口提供了一种将键映射到值的方式。

## 方法

| 签名 | 功能 |
|---|---|
| [`add(all!: Collection<(K, V)>): Unit`](add.md) | 将新的键值对放入 Map 中。 |
| [`add(key: K, value: V): ?V`](add.md) | 将传入的键值对放入该 Map 中。 |
| [`addIfAbsent(key: K, value: V): ?V`](addifabsent.md) | 如果 key 不在当前 Map 中，添加指定键值对 key-value。 |
| [`clear(): Unit`](clear.md) | 清除所有键值对。 |
| [`entryView(k: K): MapEntryView<K, V>`](entryview.md) | 获取键 k 对应的视图。 |
| [`remove(all!: Collection<K>): Unit`](remove.md) | 从此映射中删除指定集合的映射（如果存在）。 |
| [`remove(key: K): Option<V>`](remove.md) | 从此 Map 中删除指定键的映射（如果存在）。 |
| [`removeIf(predicate: (K, V) -> Bool): Unit`](removeif.md) | 传入 lambda 表达式，如果满足条件，则删除对应的键值对。 |
| [`replace(key: K, value: V): ?V`](replace.md) | 如果当前 Map 中已有指定 key，将其值修改为 value。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator [](key: K, value!: V): Unit`](operator-indexer.md) | 运算符重载集合，如果键存在，新 value 覆盖旧 value，如果键不存在，添加此键值对。 |
