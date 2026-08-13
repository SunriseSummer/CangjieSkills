<!-- cj-doc kind="api-extension" level="6" id="std.core.struct.array.extension.extend-t-array-t-equatable-array-t-where-t-equatable-t" parent="std.core.struct.array" -->
# extend<T> Array<T> <: Equatable<Array<T>> where T <: Equatable<T>

[← Array<T>](../index.md)

`extend<T> Array<T> <: Equatable<Array<T>> where T <: Equatable<T>`

为 Array<T> 类型扩展 Equatable<Array<T>> 接口实现，支持判等操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`contains(element: T): Bool`](../contains.md) | 查找当前数组是否包含指定元素。 |
| [`indexOf(elements: Array<T>): Option<Int64>`](../indexof.md) | 返回数组中子数组 `elements` 出现的第一个位置，如果数组中不包含此数组，返回 None。 |
| [`indexOf(elements: Array<T>, fromIndex: Int64): Option<Int64>`](../indexof.md) | 返回数组中在 `fromIndex`之后，子数组`elements` 出现的第一个位置，未找到返回 None。 |
| [`indexOf(element: T): Option<Int64>`](../indexof.md) | 获取数组中 `element` 出现的第一个位置，如果数组中不包含此元素，返回 None。 |
| [`indexOf(element: T, fromIndex: Int64): Option<Int64>`](../indexof.md) | 返回数组中在 `fromIndex`之后， `element` 出现的第一个位置，未找到返回 None。 |
| [`lastIndexOf(elements: Array<T>): Option<Int64>`](../lastindexof.md) | 返回数组中子数组 `elements` 出现的最后一个位置，如果数组中不存在此子数组，返回 None。 |
| [`lastIndexOf(elements: Array<T>, fromIndex: Int64): Option<Int64>`](../lastindexof.md) | 从 `fromIndex` 开始向后搜索，返回数组中子数组 `elements` 出现的最后一个位置，如果数组中不存在此子数组，返回 None。 |
| [`lastIndexOf(element: T): Option<Int64>`](../lastindexof.md) | 返回数组中 `element` 出现的最后一个位置，如果数组中不存在此元素，返回 None。 |
| [`lastIndexOf(element: T, fromIndex: Int64): Option<Int64>`](../lastindexof.md) | 从 `fromIndex` 开始向后搜索，返回数组中 `element` 出现的最后一个位置，如果数组中不存在此元素，返回 None。 |
| [`removePrefix(prefix: Array<T>): Array<T>`](../removeprefix.md) | 删除前缀。 |
| [`removeSuffix(suffix: Array<T>): Array<T>`](../removesuffix.md) | 删除后缀。 |
| [`trimEnd(predicate: (T)->Bool): Array<T>`](../trimend.md) | 修剪当前数组，从尾开始删除符合过滤条件的函数，直到第一个不符合的元素为止，并返回当前数组的切片。 |
| [`trimEnd(set: Array<T>): Array<T>`](../trimend.md) | 修剪当前数组，从尾开始删除在指定集合 set 中的元素，直到第一个不在 set 中的元素为止，并返回当前数组的切片。 |
| [`trimStart(predicate: (T)->Bool): Array<T>`](../trimstart.md) | 修剪当前数组，从头开始删除符合过滤条件的函数，直到第一个不符合的元素为止，并返回当前数组的切片。 |
| [`trimStart(set: Array<T>): Array<T>`](../trimstart.md) | 修剪当前数组，从头开始删除在指定集合 set 中的元素，直到第一个不在 set 中的元素为止，并返回当前数组的切片。 |
| [`operator const !=(that: Array<T>): Bool`](../operator-ne.md) | 判断当前实例与指定 Array<T> 实例是否不等。 |
| [`operator const ==(that: Array<T>): Bool`](../operator-eq.md) | 判断当前实例与指定 Array<T> 实例是否相等。 |
