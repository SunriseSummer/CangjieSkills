<!-- cj-doc kind="api-type" level="5" id="std.core.struct.range" parent="std.core" -->
# Range<T> where T <: Countable<T> & Comparable<T> & Equatable<T>

[← std.core](../../index.md)

`Range<T> <: Iterable<T> where T <: Countable<T> & Comparable<T> & Equatable<T>`

该类是区间类型，用于表示一个拥有固定范围和步长的 `T` 的序列，要求 `T` 是可数的，有序的。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`end: T`](field-end.md) | 表示结束值。 |
| [`hasEnd: Bool`](field-hasend.md) | 表示是否包含结束值。 |
| [`hasStart: Bool`](field-hasstart.md) | 表示是否包含开始值。 |
| [`isClosed: Bool`](field-isclosed.md) | 表示区间开闭情况，为 true 表示左闭右闭，为 false 表示左闭右开。 |
| [`start: T`](field-start.md) | 表示开始值。 |
| [`step: Int64`](field-step.md) | 表示步长。 |
| [`isEmpty(): Bool`](field-func.md) | 判断该区间是否为空。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(start: T, end: T, step: Int64, hasStart: Bool, hasEnd: Bool, isClosed: Bool)`](init.md) | 使用该构造函数创建 Range 序列。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`iterator(): Iterator<T>`](iterator.md) | 获取当前区间的迭代器。 |
| [`const func isEmpty(): Bool`](isempty.md) | 判断该区间是否为空。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<T> Range<T> <: Equatable<Range<T>> where T <: Countable<T> & Comparable<T> & Equatable<T>`](extensions/extend-t-range-t-equatable-range-t-where-t-countable-t-comparab-c0ddba7b.md) | 为 Range<T> 类型扩展 Equatable<Range<T>> 接口。 |
| [`extend<T> Range<T> <: Hashable where T <: Hashable & Countable<T> & Comparable<T> & Equatable<T>`](extensions/extend-t-range-t-hashable-where-t-hashable-countable-t-comparab-8f0ee3f5.md) | 为 Range 类型扩展 Hashable 接口，支持计算哈希值。 |
