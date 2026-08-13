<!-- cj-doc kind="api-type" level="5" id="std.collection.class.treeset" parent="std.collection" -->
# TreeSet<T> where T <: Comparable<T>

[← std.collection](../../index.md)

`TreeSet<T> <: OrderedSet<T> where T <: Comparable<T>`

基于 TreeMap 实现的 Set 接口的实例。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`first: ?T`](prop-first.md) | 获取 TreeSet 的第一个元素。 |
| [`last: ?T`](prop-last.md) | 获取 TreeSet 的最后一个元素。 |
| [`size: Int64`](prop-size.md) | 返回元素的个数。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个空的 TreeSet。 |
| [`init(elements: Collection<T>)`](init.md) | 通过传入的元素集合构造一个 TreeSet。 |
| [`init(size: Int64, initElement: (Int64) -> T)`](init.md) | 通过传入的元素个数 size 和函数规则来构造 TreeSet。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static of(elements: Array<T>): TreeSet<T>`](of.md) | 构造一个包含指定数组中所有元素的 TreeSet。 |
| [`add(all!: Collection<T>): Unit`](add.md) | 添加 Collection 中的所有元素至此 TreeSet 中，如果元素存在，则不添加。 |
| [`add(element: T): Bool`](add.md) | 将新的元素放入 TreeSet 中。 |
| [`backward(mark: T, inclusive!: Bool = true): Iterator<T>`](backward.md) | 获取从第一个键小于等于 mark 的节点按降序遍历到 first 的迭代器。 |
| [`clear(): Unit`](clear.md) | 清除所有元素。 |
| [`clone(): TreeSet<T>`](clone.md) | 克隆 TreeSet。 |
| [`contains(all!: Collection<T>): Bool`](contains.md) | 判断 TreeSet 是否包含指定 Collection 中的所有元素。 |
| [`contains(element: T): Bool`](contains.md) | 判断是否包含指定元素。 |
| [`forward(mark: T, inclusive!: Bool = true): Iterator<T>`](forward.md) | 获取从第一个元素大于等于 mark 的节点按升序遍历到 last 结束的一个迭代器。 |
| [`isEmpty(): Bool`](isempty.md) | 判断 TreeSet 是否为空。 |
| [`iterator(): Iterator<T>`](iterator.md) | 返回 TreeSet 的迭代器，迭代器按元素值从小到大的顺序迭代。 |
| [`remove(all!: Collection<T>): Unit`](remove.md) | 移除此 TreeSet 中那些也包含在指定 Collection 中的所有元素。 |
| [`remove(element: T): Bool`](remove.md) | 如果指定元素存在于此 TreeSet 中，则将其移除。 |
| [`removeFirst(): ?T`](removefirst.md) | 删除 TreeSet 的第一个元素。 |
| [`removeIf(predicate: (T) -> Bool): Unit`](removeif.md) | 传入 lambda 表达式，如果满足 `true` 条件，则删除对应的元素。 |
| [`removeLast(): ?T`](removelast.md) | 删除 TreeSet 的最后一个元素。 |
| [`retain(all!: Set<T>): Unit`](retain.md) | 从此 TreeSet 中保留 Set 中的元素，其他元素将被移除。 |
| [`subsetOf(other: ReadOnlySet<T>): Bool`](subsetof.md) | 检查该集合是否为其他 ReadOnlySet 的子集。 |
| [`toArray(): Array<T>`](toarray.md) | 返回一个包含容器内所有元素的数组。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator &(other: ReadOnlySet<T>): TreeSet<T>`](operator-bitand.md) | 返回包含两个集合交集的元素的新集合。 |
| [`operator -(other: ReadOnlySet<T>): TreeSet<T>`](operator-sub.md) | 返回包含两个集合差集的元素的新集合。 |
| [`operator \|(other: ReadOnlySet<T>): TreeSet<T>`](operator-bitor.md) | 返回包含两个集合并集的元素的新集合。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<T> TreeSet<T> <: Equatable<TreeSet<T>>`](extensions/extend-t-treeset-t-equatable-treeset-t.md) | 为 TreeSet<T> 类型扩展 Equatable<TreeSet<T>> 接口，支持判等操作。 |
| [`extend<T> TreeSet<T> <: ToString where T <: ToString`](extensions/extend-t-treeset-t-tostring-where-t-tostring.md) | 为 TreeSet<T> 扩展 ToString 接口，支持转字符串操作。 |
