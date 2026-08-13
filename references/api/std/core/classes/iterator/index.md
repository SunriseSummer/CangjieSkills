<!-- cj-doc kind="api-type" level="5" id="std.core.class.iterator" parent="std.core" -->
# Iterator<T>

[← std.core](../../index.md)

`abstract Iterator<T> <: Iterable<T>`

该类表示迭代器，提供 `next` 方法支持对容器内的成员进行迭代遍历。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 Iterator<T> 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`iterator() : Iterator<T>`](iterator.md) | 返回迭代器自身。 |
| [`next(): Option<T>`](next.md) | 获取迭代过程中的下一个元素。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<T> Iterator<T>`](extensions/extend-t-iterator-t.md) | 扩展 Iterator<T> 类型。 |
| [`extend<T> Iterator<T> where T <: Comparable<T>`](extensions/extend-t-iterator-t-where-t-comparable-t.md) | 为 Iterator<T> 类型扩展 Comparable<T> 接口，支持比较操作。 |
| [`extend<T> Iterator<T> where T <: Equatable<T>`](extensions/extend-t-iterator-t-where-t-equatable-t.md) | 为 Iterator<T> 类型扩展 扩展 Equatable<T> 接口，支持判等操作。 |
