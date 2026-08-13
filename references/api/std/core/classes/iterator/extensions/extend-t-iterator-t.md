<!-- cj-doc kind="api-extension" level="6" id="std.core.class.iterator.extension.extend-t-iterator-t" parent="std.core.class.iterator" -->
# extend<T> Iterator<T>

[← Iterator<T>](../index.md)

`extend<T> Iterator<T>`

扩展 Iterator<T> 类型。

## 成员

| 签名 | 功能 |
|---|---|
| [`all(predicate: (T)-> Bool): Bool`](../all.md) | 判断迭代器所有元素是否都满足条件。 |
| [`any(predicate: (T)-> Bool): Bool`](../any.md) | 判断迭代器是否存在任意一个满足条件的元素。 |
| [`at(n: Int64): Option<T>`](../at.md) | 获取当前迭代器第 n 个元素，n 从 0 开始计数。 |
| [`concat(other: Iterator<T>): Iterator<T>`](../concat.md) | 串联两个迭代器，当前迭代器在先，参数表示的迭代器在后。 |
| [`count(): Int64`](../count.md) | 统计当前迭代器包含元素数量。 |
| [`enumerate(): Iterator<(Int64, T)>`](../enumerate.md) | 用于获取带索引的迭代器。 |
| [`filter(predicate: (T)-> Bool): Iterator<T>`](../filter.md) | 筛选出满足条件的元素。 |
| [`filterMap<R>(transform: (T) -> Option<R>): Iterator<R>`](../filtermap.md) | 同时进行筛选操作和映射操作，返回一个新的迭代器。 |
| [`first(): Option<T>`](../first.md) | 获取当前迭代器的头部元素。 |
| [`flatMap<R>(transform: (T) -> Iterator<R>): Iterator<R>`](../flatmap.md) | 创建一个带 flatten 功能的映射。 |
| [`fold<R>(initial: R, operation: (R, T)->R): R`](../fold.md) | 使用指定初始值，从左向右计算。 |
| [`forEach(action: (T)-> Unit): Unit`](../foreach.md) | 遍历当前迭代器所有元素，对每个元素执行给定的操作。 |
| [`inspect(action: (T) -> Unit): Iterator<T>`](../inspect.md) | 迭代器每次调用 next() 对当前元素执行额外操作（不会消耗迭代器中元素）。 |
| [`intersperse(separator: T): Iterator<T>`](../intersperse.md) | 迭代器每两个元素之间插入一个给定的新元素。 |
| [`isEmpty(): Bool`](../isempty.md) | 判断当前迭代器是否为空。 |
| [`last(): Option<T>`](../last.md) | 获取当前迭代器尾部元素。 |
| [`map<R>(transform: (T)-> R): Iterator<R>`](../map.md) | 创建一个映射。 |
| [`none(predicate: (T)-> Bool): Bool`](../none.md) | 判断当前迭代器中所有元素是否都不满足条件。 |
| [`reduce(operation: (T, T) -> T): Option<T>`](../reduce.md) | 使用第一个元素作为初始值，从左向右计算。 |
| [`skip(count: Int64): Iterator<T>`](../skip.md) | 从前往后从当前迭代器跳过特定个数。 |
| [`step(count: Int64): Iterator<T>`](../step.md) | 迭代器每次调用 next() 跳过特定个数。 |
| [`take(count: Int64): Iterator<T>`](../take.md) | 从当前迭代器取出特定个数。 |
| [`zip<R>(it: Iterator<R>): Iterator<(T, R)>`](../zip.md) | 将两个迭代器合并成一个（长度取决于短的那个迭代器）。 |
