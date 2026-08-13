<!-- cj-doc kind="api-type" level="5" id="std.collection.class.arraylist" parent="std.collection" -->
# ArrayList<T>

[← std.collection](../../index.md)

`ArrayList<T> <: List<T>`

提供可变长度的数组的功能。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`capacity: Int64`](prop-capacity.md) | 返回此 ArrayList 的容量大小。 |
| [`first: ?T`](prop-first.md) | 返回此 ArrayList 中的第一个元素，如果没有则返回 None。 |
| [`last: ?T`](prop-last.md) | 返回此 ArrayList 中的最后一个元素，如果没有则返回 None。 |
| [`size: Int64`](prop-size.md) | 返回此 ArrayList 中的元素个数。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个初始容量大小为默认值`16`的 ArrayList。 |
| [`init(elements: Collection<T>)`](init.md) | 构造一个包含指定集合中所有元素的 ArrayList。 |
| [`init(capacity: Int64)`](init.md) | 构造一个初始容量为指定大小的 ArrayList。 |
| [`init(size: Int64, initElement: (Int64) -> T)`](init.md) | 构造具有指定初始元素个数和指定规则函数的 ArrayList。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static of(elements: Array<T>): ArrayList<T>`](of.md) | 构造一个包含指定数组中所有元素的 ArrayList。 |
| [`add(all!: Collection<T>): Unit`](add.md) | 将指定集合中的所有元素附加到此 ArrayList 的末尾。 |
| [`add(all!: Collection<T>, at!: Int64): Unit`](add.md) | 从指定位置开始，将指定集合中的所有元素插入此 ArrayList。 |
| [`add(element: T): Unit`](add.md) | 将指定的元素附加到此 ArrayList 的末尾。 |
| [`add(element: T, at!: Int64): Unit`](add.md) | 在此 ArrayList 中的指定位置插入指定元素。 |
| [`clear(): Unit`](clear.md) | 从此 ArrayList 中删除所有元素。 |
| [`clone(): ArrayList<T>`](clone.md) | 返回此 ArrayList 实例的拷贝（浅拷贝）。 |
| [`get(index: Int64): ?T`](get.md) | 返回此 ArrayList 中指定位置的元素。 |
| [`unsafe getRawArray(): Array<T>`](getrawarray.md) | 返回 ArrayList 的原始数据。 |
| [`isEmpty(): Bool`](isempty.md) | 判断 ArrayList 是否为空。 |
| [`iterator(): Iterator<T>`](iterator.md) | 返回此 ArrayList 中元素的迭代器。 |
| [`remove(at!: Int64): T`](remove.md) | 删除此 ArrayList 中指定位置的元素。 |
| [`remove(range: Range<Int64>): Unit`](remove.md) | 删除此 ArrayList 中 Range 范围所包含的所有元素。 |
| [`removeIf(predicate: (T) -> Bool): Unit`](removeif.md) | 删除此 ArrayList 中满足给定 lambda 表达式或函数的所有元素。 |
| [`reserve(additional: Int64): Unit`](reserve.md) | 增加此 ArrayList 实例的容量。 |
| [`reverse(): Unit`](reverse.md) | 反转此 ArrayList 中元素的顺序。 |
| [`slice(range: Range<Int64>): ArrayList<T>`](slice.md) | 以传入参数 range 作为索引，返回索引对应的 ArrayList<T>。 |
| [`toArray(): Array<T>`](toarray.md) | 返回一个数组，其中包含此列表中按正确顺序排列的所有元素。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator [](index: Int64): T`](operator-indexer.md) | 操作符重载 - get。 |
| [`operator [](index: Int64, value!: T): Unit`](operator-indexer.md) | 操作符重载，通过下标运算符用指定的元素替换此列表中指定位置的元素。 |
| [`operator [](range: Range<Int64>): ArrayList<T>`](operator-indexer.md) | 运算符重载 - 切片。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<T> ArrayList<T> <: Equatable<ArrayList<T>> where T <: Equatable<T>`](extensions/extend-t-arraylist-t-equatable-arraylist-t-where-t-equatable-t.md) | 为 ArrayList<T> 类型扩展 Equatable<ArrayList<T>> 接口，支持判等操作。 |
| [`extend<T> ArrayList<T> <: ToString where T <: ToString`](extensions/extend-t-arraylist-t-tostring-where-t-tostring.md) | 为 ArrayList<T> 扩展 ToString 接口，支持转字符串操作。 |
