<!-- cj-doc kind="api-type" level="5" id="std.collection.class.arraystack" parent="std.collection" -->
# ArrayStack<T>

[← std.collection](../../index.md)

`ArrayStack<T> <: Stack<T>`

ArrayStack 是一种基于数组 Array 实现的栈 Stack 数据结构。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`capacity: Int64`](prop-capacity.md) | 栈的容量大小。 |
| [`size: Int64`](prop-size.md) | 栈中元素的数量。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个空的 ArrayStack，其初始容量为 8。 |
| [`init(capacity: Int64)`](init.md) | 构造一个空的 ArrayStack，其初始容量为指定的值。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`add(element: T): Unit`](add.md) | 在栈顶添加元素。 |
| [`clear(): Unit`](clear.md) | 清空当前的 ArrayStack。 |
| [`isEmpty(): Bool`](isempty.md) | 判断此 ArrayStack 是否为空。 |
| [`iterator(): Iterator<T>`](iterator.md) | 返回此 ArrayStack 中元素的迭代器，其顺序为出栈的顺序。 |
| [`peek(): ?T`](peek.md) | 获取栈顶的元素，该操作不会做出栈操作，只查看栈顶的元素。 |
| [`remove(): ?T`](remove.md) | 出栈操作，删除栈顶的元素并且返回这个元素。 |
| [`reserve(additional: Int64): Unit`](reserve.md) | 为当前 ArrayStack 扩容相应的空间。 |
| [`toArray(): Array<T>`](toarray.md) | 返回一个数组，其中元素为栈中的元素，顺序为栈的出栈顺序。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<T> ArrayStack<T> <: ToString where T <: ToString`](extensions/extend-t-arraystack-t-tostring-where-t-tostring.md) | 为 ArrayStack 扩展 ToString 接口，支持转字符串操作。 |
