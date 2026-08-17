<!-- cj-doc kind="api-type" level="5" id="std.collection.class.hashset" parent="std.collection" -->
# HashSet<T> where T <: Hashable & Equatable<T>

[← std.collection](../../index.md)

`HashSet<T> <: Set<T> where T <: Hashable & Equatable<T>`

基于 HashMap 实现的 Set 接口的实例。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`capacity: Int64`](prop-capacity.md) | 返回此 HashSet 的内部数组容量大小。 |
| [`size: Int64`](prop-size.md) | 返回此 HashSet 的元素个数。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个空的 HashSet，初始容量为 16。 |
| [`init(elements: Array<T>)`](init.md) | 使用传入的数组构造 HashSet。 |
| [`init(elements: Collection<T>)`](init.md) | 使用传入的集合构造 HashSet。 |
| [`init(capacity: Int64)`](init.md) | 使用传入的容量构造一个 HashSet。 |
| [`init(size: Int64, initElement: (Int64) -> T)`](init.md) | 通过传入的函数元素个数 size 和函数规则来构造 HashSet。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`add(all!: Collection<T>): Unit`](add.md) | 添加 Collection 中的所有元素至此 HashSet 中，如果元素存在，则不添加。 |
| [`add(element: T): Bool`](add.md) | 将指定的元素添加到 HashSet 中，若添加的元素在 HashSet 中存在，则添加失败。 |
| [`clear(): Unit`](clear.md) | 从此 HashSet 中移除所有元素。 |
| [`clone(): HashSet<T>`](clone.md) | 克隆 HashSet。 |
| [`contains(all!: Collection<T>): Bool`](contains.md) | 判断 HashSet 是否包含指定 Collection 中的所有元素。 |
| [`contains(element: T): Bool`](contains.md) | 判断 HashSet 是否包含指定元素。 |
| [`isEmpty(): Bool`](isempty.md) | 判断 HashSet 是否为空。 |
| [`iterator(): Iterator<T>`](iterator.md) | 返回此 HashSet 的迭代器。 |
| [`remove(all!: Collection<T>): Unit`](remove.md) | 移除此 HashSet 中那些也包含在指定 Collection 中的所有元素。 |
| [`remove(element: T): Bool`](remove.md) | 如果指定元素存在于此 HashSet 中，则将其移除。 |
| [`removeIf(predicate: (T) -> Bool): Unit`](removeif.md) | 传入 lambda 表达式，如果满足 `true` 条件，则删除对应的元素。 |
| [`reserve(additional: Int64): Unit`](reserve.md) | 将 HashSet 扩容 additional 大小，当 additional 小于等于零时，不发生扩容；当 HashSet 剩余容量大于等于 additional 时，不发生扩容；当 HashSet 剩余容量小于 additional 时，取（原始容量的 1.5 倍向下取整）与（additional + 已使用容量）中的最大值进行扩容。 |
| [`retain(all!: Set<T>): Unit`](retain.md) | 从此 HashSet 中保留 Set 中的元素。 |
| [`subsetOf(other: ReadOnlySet<T>): Bool`](subsetof.md) | 检查该集合是否为其他 ReadOnlySet 的子集。 |
| [`toArray(): Array<T>`](toarray.md) | 返回一个包含容器内所有元素的数组。 |
| [`func all(predicate: (T) -> Bool): Bool`](all.md) | 判断 HashSet 中所有元素是否都满足条件。 |
| [`func any(predicate: (T) -> Bool): Bool`](any.md) | 判断 HashSet 是否存在任意一个满足条件的元素。 |
| [`func filter(predicate: (T) -> Bool): HashSet<T>`](filter.md) | 返回一个满足筛选条件的元素的新 HashSet<T>。 |
| [`func filterMap<R>(transform: (T) -> Option<R>): HashSet<R> where R <: Hashable & Equatable<R>`](filtermap.md) | 同时进行筛选操作和映射操作，返回一个新 HashSet。 |
| [`func fold<R>(initial: R, operation: (R, T) -> R): R`](fold.md) | 使用指定初始值，从左向右计算。 |
| [`func forEach(action: (T) -> Unit): Unit`](foreach.md) | 遍历所有元素，执行给定的操作。 |
| [`func map<R>(transform: (T) -> R): HashSet<R> where R <: Hashable & Equatable<R>`](map.md) | 将当前 HashSet 内所有 T 类型元素根据 transform 映射为 R 类型的元素，组成新的 HashSet。 |
| [`func none(predicate: (T) -> Bool): Bool`](none.md) | 判断 HashSet 中所有元素是否都不满足条件。 |
| [`func reduce(operation: (T, T) -> T): Option<T>`](reduce.md) | 使用第一个元素作为初始值，从左向右计算。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator &(other: ReadOnlySet<T>): HashSet<T>`](operator-bitand.md) | 返回包含两个集合交集的元素的新集合。 |
| [`operator -(other: ReadOnlySet<T>): HashSet<T>`](operator-sub.md) | 返回包含两个集合差集的元素的新集合。 |
| [`operator \|(other: ReadOnlySet<T>): HashSet<T>`](operator-bitor.md) | 返回包含两个集合并集的元素的新集合。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<T> HashSet<T> <: Equatable<HashSet<T>>`](extensions/extend-t-hashset-t-equatable-hashset-t.md) | 为 HashSet<T> 类型扩展 Equatable<HashSet<T>> 接口，支持判等操作。 |
| [`extend<T> HashSet<T> <: ToString where T <: ToString`](extensions/extend-t-hashset-t-tostring-where-t-tostring.md) | 为 HashSet<T> 扩展 ToString 接口，支持转字符串操作。 |
