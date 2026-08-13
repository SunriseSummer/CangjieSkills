<!-- cj-doc kind="api-type" level="5" id="std.collection.class.arrayqueue" parent="std.collection" -->
# ArrayQueue<T>

[← std.collection](../../index.md)

`ArrayQueue<T> <: Queue<T>`

基于数组实现的循环队列数据结构。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`capacity: Int64`](prop-capacity.md) | 获取此队列的容量。 |
| [`size: Int64`](prop-size.md) | 返回此队列中的元素个数。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个空的队列，其容量大小为默认值 8。 |
| [`init(capacity: Int64)`](init.md) | 构造一个具有指定容量的队列，当 capacity 小于默认容量 8 时，构造的 ArrayQueue 初始容量为 8 。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`add(element: T): Unit`](add.md) | 在此队列尾部插入元素。 |
| [`clear(): Unit`](clear.md) | 清空此队列中的所有元素。 |
| [`isEmpty(): Bool`](isempty.md) | 判断此队列是否为空。 |
| [`iterator(): Iterator<T>`](iterator.md) | 获取此队列中元素的迭代器，其顺序为从前到后的顺序。 |
| [`peek():?T`](peek.md) | 查看此队列头部元素。 |
| [`remove(): ?T`](remove.md) | 删除队列中的头部元素并返回该值，如果此队列为空，返回 `None`。 |
| [`reserve(additional: Int64): Unit`](reserve.md) | 增加此队列的容量。 |
| [`toArray(): Array<T>`](toarray.md) | 返回一个数组，其包含此队列中的所有元素，且顺序为从前到后的顺序。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<T> ArrayQueue<T> <: ToString where T <: ToString`](extensions/extend-t-arrayqueue-t-tostring-where-t-tostring.md) | 为 ArrayQueue<T> 扩展 ToString 接口，支持转字符串操作。 |
