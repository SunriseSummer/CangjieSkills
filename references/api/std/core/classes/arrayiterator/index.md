<!-- cj-doc kind="api-type" level="5" id="std.core.class.arrayiterator" parent="std.core" -->
# ArrayIterator<T>

[← std.core](../../index.md)

`ArrayIterator<T> <: Iterator<T>`

数组迭代器，迭代功能详述见 Iterable 和 Iterator 说明。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(data: Array<T>)`](init.md) | 给定一个 Array 数组实例，创建其对应的迭代器，用来迭代遍历该数组实例中全部对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`next(): Option<T>`](next.md) | 返回数组迭代器中的下一个值。 |
