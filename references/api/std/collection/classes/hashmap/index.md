<!-- cj-doc kind="api-type" level="5" id="std.collection.class.hashmap" parent="std.collection" -->
# HashMap<K, V> where K <: Hashable & Equatable<K>

[← std.collection](../../index.md)

`HashMap<K, V> <: Map<K, V> where K <: Hashable & Equatable<K>`

Map 接口的哈希表实现。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`capacity: Int64`](prop-capacity.md) | 返回 HashMap 的容量。 |
| [`size: Int64`](prop-size.md) | 返回键值对的个数。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个具有默认初始容量为 16 和默认负载因子为空的 HashMap。 |
| [`init(elements: Array<(K, V)>)`](init.md) | 通过传入的键值对数组构造一个 HashMap。 |
| [`init(elements: Collection<(K, V)>)`](init.md) | 通过传入的键值对集合构造一个 HashMap。 |
| [`init(capacity: Int64)`](init.md) | 构造一个带有传入容量大小的 HashMap。 |
| [`init(size: Int64, initElement: (Int64) -> (K, V))`](init.md) | 通过传入的元素个数 size 和函数规则来构造 HashMap。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`add(all!: Collection<(K, V)>): Unit`](add.md) | 按照 elements 的迭代器顺序将新的键值对集合放入 HashMap 中。 |
| [`add(key: K, value: V): Option<V>`](add.md) | 将键值对放入 HashMap 中。 |
| [`clear(): Unit`](clear.md) | 清除所有键值对。 |
| [`clone(): HashMap<K, V>`](clone.md) | 克隆 HashMap。 |
| [`contains(all!: Collection<K>): Bool`](contains.md) | 判断是否包含指定集合中所有键的映射。 |
| [`contains(key: K): Bool`](contains.md) | 判断是否包含指定键的映射。 |
| [`entryView(key: K): MapEntryView<K, V>`](entryview.md) | 如果不包含特定键，返回一个空的引用视图。 |
| [`get(key: K): ?V`](get.md) | 返回指定键映射到的值，如果 HashMap 不包含指定键的映射，则返回 Option<V>.None。 |
| [`isEmpty(): Bool`](isempty.md) | 判断 HashMap 是否为空，如果是，则返回 true；否则，返回 false。 |
| [`iterator(): HashMapIterator<K, V>`](iterator.md) | 返回 HashMap 的迭代器。 |
| [`keys(): EquatableCollection<K>`](keys.md) | 返回 HashMap 中所有的 key，并将所有 key 存储在一个 Keys 容器中。 |
| [`remove(all!: Collection<K>): Unit`](remove.md) | 从此 HashMap 中删除指定集合中键的映射（如果存在）。 |
| [`remove(key: K): Option<V>`](remove.md) | 从此 HashMap 中删除指定键的映射（如果存在）。 |
| [`removeIf(predicate: (K, V) -> Bool): Unit`](removeif.md) | 传入 lambda 表达式，如果满足条件，则删除对应的键值对。 |
| [`reserve(additional: Int64): Unit`](reserve.md) | 扩容当前的 HashMap。 |
| [`toArray(): Array<(K, V)>`](toarray.md) | 构造一个包含 HashMap 内键值对的数组，并返回。 |
| [`values(): Collection<V>`](values.md) | 返回 HashMap 中包含的值，并将所有的 value 存储在一个 Values 容器中。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator [](key: K): V`](operator-indexer.md) | 运算符重载 get 方法，如果键存在，返回键对应的值。 |
| [`operator [](key: K, value!: V): Unit`](operator-indexer.md) | 运算符重载 add 方法，如果键存在，新 value 覆盖旧 value，如果键不存在，添加此键值对。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<K, V> HashMap<K, V> <: Equatable<HashMap<K, V>> where V <: Equatable<V>`](extensions/extend-k-v-hashmap-k-v-equatable-hashmap-k-v-where-v-equatable-v.md) | 为 HashMap<K, V> 类型扩展 Equatable<HashMap<K, V>> 接口，支持判等操作。 |
| [`extend<K, V> HashMap<K, V> <: ToString where V <: ToString, K <: ToString`](extensions/extend-k-v-hashmap-k-v-tostring-where-v-tostring-k-tostring.md) | 为 HashMap<K, V> 扩展 ToString 接口，支持转字符串操作。 |
