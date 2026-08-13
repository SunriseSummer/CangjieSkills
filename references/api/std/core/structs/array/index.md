<!-- cj-doc kind="api-type" level="5" id="std.core.struct.array" parent="std.core" -->
# Array<T>

[← std.core](../../index.md)

`Array<T>`

固定长度的同类型元素序列；可用数组字面量、`Array<T>()`、`Array<T>(size, repeat: value)` 或 `Array<T>(size, {index => value})` 构造，引用类型的 repeat 值会被各元素共享。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`first: Option<T>`](prop-first.md) | 获取当前数组的第一个元素，如果当前数组为空，返回 None。 |
| [`last: Option<T>`](prop-last.md) | 获取当前数组的最后一个元素，如果当前数组为空，返回 None。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个空数组。 |
| [`init(size: Int64, initElement: (Int64) -> T)`](init.md) | 创建指定长度的数组，其中元素根据初始化函数计算获取。 |
| [`init(size: Int64, repeat!: T)`](init.md) | 构造一个指定长度的数组，其中元素都用指定初始值进行初始化。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`clone(): Array<T>`](clone.md) | 克隆数组，将对数组数据进行深拷贝。 |
| [`clone(range: Range<Int64>) : Array<T>`](clone.md) | 克隆数组的指定区间。 |
| [`concat(other: Array<T>): Array<T>`](concat.md) | 该函数将创建一个新的数组，数组内容是当前数组后面串联 other 指向的数组。 |
| [`copyTo(dst: Array<T>): Unit`](copyto.md) | 将当前数组的全部元素拷贝到目标数组 dst 中。 |
| [`copyTo(dst: Array<T>, srcStart: Int64, dstStart: Int64, copyLen: Int64): Unit`](copyto.md) | 将当前数组中的一段数据拷贝到目标数组中。 |
| [`fill(value: T): Unit`](fill.md) | 将当前数组内所有元素都替换成指定的 value。 |
| [`get(index: Int64): Option<T>`](get.md) | 获取数组中下标 index 对应的元素。 |
| [`map<R>(transform: (T)->R): Array<R>`](map.md) | 将当前数组内所有 T 类型元素根据 transform 映射为 R 类型的元素，组成新的数组。 |
| [`repeat(n: Int64): Array<T>`](repeat.md) | 重复当前数组若干次，得到新数组。 |
| [`reverse(): Unit`](reverse.md) | 反转数组，将数组中元素的顺序进行反转。 |
| [`slice(start: Int64, len: Int64): Array<T>`](slice.md) | 获取数组切片。 |
| [`splitAt(mid: Int64): (Array<T>, Array<T>)`](splitat.md) | 从指定位置 mid 处分割数组。 |
| [`swap(index1: Int64, index2: Int64): Unit`](swap.md) | 交换指定位置的两个元素。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator [](index: Int64): T`](operator-indexer.md) | 获取数组下标 index 对应的值。 |
| [`operator [](index: Int64, value!: T): Unit`](operator-indexer.md) | 修改数组中下标 index 对应的值。 |
| [`operator [](range: Range<Int64>): Array<T>`](operator-indexer.md) | 根据给定区间获取数组切片。 |
| [`operator [](range: Range<Int64>, value!: Array<T>): Unit`](operator-indexer.md) | 用指定的数组对本数组一个连续范围的元素赋值。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<T> Array<Array<T>>`](extensions/extend-t-array-array-t.md) | 为二维数组进行扩展，提供将其展开为一维数组的方法。 |
| [`extend<T> Array<T> <: Collection<T>`](extensions/extend-t-array-t-collection-t.md) | 为 Array<T> 类型实现 Collection 接口。 |
| [`extend<T> Array<T> <: Equatable<Array<T>> where T <: Equatable<T>`](extensions/extend-t-array-t-equatable-array-t-where-t-equatable-t.md) | 为 Array<T> 类型扩展 Equatable<Array<T>> 接口实现，支持判等操作。 |
| [`extend<T> Array<T> <: ToString where T <: ToString`](extensions/extend-t-array-t-where-t-tostring.md) | 为 Array<T> 类型扩展 ToString 接口，支持转字符串操作。 |
