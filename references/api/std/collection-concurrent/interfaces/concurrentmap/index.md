<!-- cj-doc kind="api-type" level="5" id="std.collection.concurrent.interface.concurrentmap" parent="std.collection.concurrent" -->
# ConcurrentMap<K, V>

[← std.collection.concurrent](../../index.md)

`ConcurrentMap<K, V>`

保证线程安全和操作原子性的 Map 接口定义。

## 方法

| 签名 | 功能 |
|---|---|
| [`add(key: K, value: V): ?V`](add.md) | 将指定的值 value 与此 Map 中指定的键 key 关联。 |
| [`addIfAbsent(key: K, value: V): ?V`](addifabsent.md) | 当此 Map 中不存在键 key 时，在 Map 中添加指定的值 value 与指定的键 key 的关联。 |
| [`contains(key: K): Bool`](contains.md) | 判断 Map 中是否包含指定键 key 的关联。 |
| [`entryView(key: K, fn: (MapEntryView<K, V>) -> Unit): ?V`](entryview.md) | 根据指定键 key 获取当前映射中相应的键值对视图 entryView，并调用函数 fn 对该键值对进行增、删、改操作，并返回最终映射中键 key 对应的值。 |
| [`get(key: K): ?V`](get.md) | 返回 Map 中键 key 所关联的值。 |
| [`remove(key: K): ?V`](remove.md) | 从此映射中删除指定键 key 的映射（如果存在）。 |
| [`replace(key: K, value: V): ?V`](replace.md) | 如果 Map 中存在 key，则将 Map 中键 key 关联的值替换为 value；如果 Map 中不存在 key，则不对 Map 做任何修改。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator [](key: K): V`](operator-indexer.md) | 根据指定键 key 获取值。 |
| [`operator [](key: K, value!: V): Unit`](operator-indexer.md) | 设置指定键 key 的值为 value。 |
