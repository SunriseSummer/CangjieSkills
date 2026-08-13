<!-- cj-doc kind="api-type" level="5" id="std.collection.concurrent.class.concurrenthashmap" parent="std.collection.concurrent" -->
# ConcurrentHashMap<K, V> where K <: Hashable & Equatable<K>

[← std.collection.concurrent](../../index.md)

`ConcurrentHashMap<K, V> <: ConcurrentMap<K, V> & Collection<(K, V)> where K <: Hashable & Equatable<K>`

此类用于实现并发场景下线程安全的哈希表 ConcurrentHashMap 数据结构及相关操作函数。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`size: Int64`](prop-size.md) | 返回键值的个数。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(elements: Collection<(K, V)>, concurrencyLevel!: Int64 = 16)`](init.md) | 构造一个带有传入迭代器和指定并发度的 ConcurrentHashMap。 |
| [`init(concurrencyLevel!: Int64 = 16)`](init.md) | 构造一个具有默认初始容量（16）和指定并发度（默认等于 16）的 ConcurrentHashMap。 |
| [`init(size: Int64, initElement: (Int64) -> (K, V), concurrencyLevel!: Int64 = 16)`](init.md) | 构造具有传入大小和初始化函数元素以及指定并发度的 ConcurrentHashMap。 |
| [`init(capacity: Int64, concurrencyLevel!: Int64 = 16)`](init.md) | 构造一个带有传入容量大小和指定并发度（默认等于 16）的 ConcurrentHashMap。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`add(key: K, value: V): ?V`](add.md) | 将指定的值 value 与此 ConcurrentHashMap 中指定的键 key 关联。 |
| [`addIfAbsent(key: K, value: V): ?V`](addifabsent.md) | 当此 ConcurrentHashMap 中不存在键 key 时，在 ConcurrentHashMap 中添加指定的值 value 与指定的键 key 的关联。 |
| [`contains(key: K): Bool`](contains.md) | 判断此映射中是否包含指定键 key 的映射。 |
| [`entryView(key: K, fn: (MapEntryView<K, V>) -> Unit): ?V`](entryview.md) | 根据指定键 key 获取当前映射中相应的键值对视图 entryView，并调用函数 fn 对该键值对进行增、删、改操作，并返回最终映射中键 key 对应的值。 |
| [`get(key: K): ?V`](get.md) | 返回此映射中键 key 所关联的值。 |
| [`isEmpty(): Bool`](isempty.md) | 判断 ConcurrentHashMap 是否为空。 |
| [`iterator(): ConcurrentHashMapIterator<K, V>`](iterator.md) | 获取 ConcurrentHashMap 的迭代器。 |
| [`remove(key: K): ?V`](remove.md) | 从此映射中删除指定键 key 的映射（如果存在）。 |
| [`replace(key: K, value: V): ?V`](replace.md) | 如果 ConcurrentHashMap 中存在 key，则将 ConcurrentHashMap 中键 key 关联的值替换为 value；如果 ConcurrentHashMap 中不存在 key，则不对 ConcurrentHashMap 做任何修改。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator [](key: K): V`](operator-indexer.md) | 运算符重载集合，如果键存在，返回键对应的值；如果不存在，抛出异常。 |
| [`operator [](key: K, value!: V): Unit`](operator-indexer.md) | 运算符重载集合，如果键 key 存在，新 value 覆盖旧 value；如果键不存在，添加此键值对。 |
