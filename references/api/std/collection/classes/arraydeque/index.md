<!-- cj-doc kind="api-type" level="5" id="std.collection.class.arraydeque" parent="std.collection" -->
# ArrayDeque<T>

[← std.collection](../../index.md)

`ArrayDeque<T> <: Deque<T>`

ArrayDeque 是双端队列（deque）实现类，可以在双端队列的两端进行元素的插入和删除操作。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`capacity: Int64`](prop-capacity.md) | 获取此双端队列的容量。 |
| [`first: ?T`](prop-first.md) | 获取双端队列的头部元素。 |
| [`last: ?T`](prop-last.md) | 获取双端队列的尾部元素。 |
| [`size: Int64`](prop-size.md) | 返回此双端队列中的元素个数。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个空的双端队列，其容量大小为默认值 8。 |
| [`init(capacity: Int64)`](init.md) | 构造一个具有指定容量的双端队列，当 capacity 小于默认容量 8 时，构造的 ArrayDeque 初始容量为 8 。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`addFirst(element: T): Unit`](addfirst.md) | 在此双端队列头部插入元素。 |
| [`addLast(element: T): Unit`](addlast.md) | 在此双端队列尾部插入元素。 |
| [`clear(): Unit`](clear.md) | 清空此双端队列中的所有元素。 |
| [`isEmpty(): Bool`](isempty.md) | 判断此双端队列是否为空。 |
| [`iterator(): Iterator<T>`](iterator.md) | 获取此双端队列中元素的迭代器，其顺序为从前到后的顺序。 |
| [`removeFirst(): ?T`](removefirst.md) | 删除双端队列中的头部元素并返回该值，如果此双端队列为空，返回 `None`。 |
| [`removeLast(): ?T`](removelast.md) | 删除双端队列中的尾部元素并返回该值，如果此双端队列为空，返回 `None`。 |
| [`reserve(additional: Int64): Unit`](reserve.md) | 增加此双端队列的容量。 |
| [`toArray(): Array<T>`](toarray.md) | 返回一个数组，其包含此双端队列中的所有元素，且顺序为从前到后的顺序。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<T> ArrayDeque<T> <: ToString where T <: ToString`](extensions/extend-t-arraydeque-t-tostring-where-t-tostring.md) | 为 ArrayDeque<T> 扩展 ToString 接口，支持转字符串操作。 |
