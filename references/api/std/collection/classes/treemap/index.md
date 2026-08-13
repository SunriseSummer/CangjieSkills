<!-- cj-doc kind="api-type" level="5" id="std.collection.class.treemap" parent="std.collection" -->
# TreeMap<K, V> where K <: Comparable<K>

[← std.collection](../../index.md)

`TreeMap<K, V> <: OrderedMap<K, V> where K <: Comparable<K>`

基于平衡二叉搜索树实现的 OrderedMap 接口实例。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`first: ?(K, V)`](prop-first.md) | 获取 TreeMap 的第一个元素。 |
| [`last: ?(K, V)`](prop-last.md) | 获取 TreeMap 的最后一个元素。 |
| [`size: Int64`](prop-size.md) | 返回键值的个数。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个空的 TreeMap。 |
| [`init(elements: Array<(K,V)>)`](init.md) | 通过传入的键值对数组构造一个 TreeMap。 |
| [`init(elements: Collection<(K, V)>)`](init.md) | 通过传入的键值对集合构造一个 TreeMap。 |
| [`init(size: Int64, initElement: (Int64) -> (K, V))`](init.md) | 通过传入的元素个数 size 和函数规则来构造 TreeMap。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`add(all!: Collection<(K, V)>): Unit`](add.md) | 将新的键值对集合放入 TreeMap 中。 |
| [`add(key: K, value: V): Option<V>`](add.md) | 将新的键值对放入 TreeMap 中。 |
| [`backward(mark: K, inclusive!: Bool = true): Iterator<(K, V)>`](backward.md) | 获取从第一个键小于等于 mark 的节点按降序遍历到 first 的迭代器。 |
| [`clear(): Unit`](clear.md) | 清除所有键值对。 |
| [`clone(): TreeMap<K, V>`](clone.md) | 克隆 TreeMap。 |
| [`contains(all!: Collection<K>): Bool`](contains.md) | 判断是否包含指定集合键的映射。 |
| [`contains(key: K): Bool`](contains.md) | 判断是否包含指定键的映射。 |
| [`entryView(k: K): MapEntryView<K, V>`](entryview.md) | 如果不包含特定键，返回一个空的引用视图。 |
| [`forward(mark: K, inclusive!: Bool = true): Iterator<(K, V)>`](forward.md) | 获取从第一个键大于等于 mark 的节点按升序遍历到 last 结束的一个迭代器。 |
| [`get(key: K): ?V`](get.md) | 返回指定键映射的值。 |
| [`isEmpty(): Bool`](isempty.md) | 判断 TreeMap 是否为空。 |
| [`iterator(): Iterator<(K, V)>`](iterator.md) | 返回 TreeMap 的迭代器，迭代器按 Key 值从小到大的顺序迭代。 |
| [`keys(): EquatableCollection<K>`](keys.md) | 返回 TreeMap 中所有的 key，并将所有 key 存储在一个容器中。 |
| [`remove(all!: Collection<K>): Unit`](remove.md) | 从此映射中删除指定集合的映射（如果存在）。 |
| [`remove(key: K): Option<V>`](remove.md) | 从此映射中删除指定键的映射（如果存在）。 |
| [`removeFirst(): ?(K, V)`](removefirst.md) | 删除 TreeMap 的第一个元素。 |
| [`removeIf(predicate: (K, V) -> Bool): Unit`](removeif.md) | 传入 lambda 表达式，如果满足条件，则删除对应的键值。 |
| [`removeLast(): ?(K, V)`](removelast.md) | 删除 TreeMap 的最后一个元素。 |
| [`values(): Collection<V>`](values.md) | 返回 TreeMap 中包含的值，并将所有的 value 存储在一个容器中。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator [](key: K): V`](operator-indexer.md) | 运算符重载集合，如果键存在，返回键对应的值。 |
| [`operator [](key: K, value!: V): Unit`](operator-indexer.md) | 运算符重载集合，如果键存在，新 value 覆盖旧 value，如果键不存在，添加此键值对。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<K, V> TreeMap<K, V> <: Equatable<TreeMap<K, V>> where V <: Equatable<V>`](extensions/extend-k-v-treemap-k-v-equatable-treemap-k-v-where-v-equatable-v.md) | 为 TreeMap<K, V> 类型扩展 Equatable<TreeMap<K, V>> 接口，支持判等操作。 |
| [`extend<K, V> TreeMap<K, V> <: ToString where V <: ToString, K <: ToString & Comparable<K>`](extensions/extend-k-v-treemap-k-v-tostring-where-v-tostring-k-tostring-comparable-k.md) | 为 TreeMap<K, V> 扩展 ToString 接口，支持转字符串操作。 |
