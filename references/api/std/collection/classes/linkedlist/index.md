<!-- cj-doc kind="api-type" level="5" id="std.collection.class.linkedlist" parent="std.collection" -->
# LinkedList<T>

[← std.collection](../../index.md)

`LinkedList<T> <: Collection<T>`

实现双向链表的数据结构。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`first: ?T`](prop-first.md) | 链表中第一个元素的值，如果是空链表则返回 None。 |
| [`firstNode: ?LinkedListNode<T>`](prop-firstnode.md) | 获取链表中的第一个元素的节点。 |
| [`last: ?T`](prop-last.md) | 链表中最后一个元素的值，如果是空链表则返回 None。 |
| [`lastNode: ?LinkedListNode<T>`](prop-lastnode.md) | 获取链表中的最后一个元素的节点。 |
| [`size: Int64`](prop-size.md) | 链表中的元素数量。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个空的链表。 |
| [`init(elements: Array<T>)`](init.md) | 按照数组的遍历顺序构造一个包含指定集合元素的 LinkedList 实例。 |
| [`init(elements: Collection<T>)`](init.md) | 按照集合迭代器返回元素的顺序构造一个包含指定集合元素的链表。 |
| [`init(size: Int64, initElement: (Int64)-> T)`](init.md) | 创建一个包含 size 个元素，且第 n 个元素满足 (Int64)-> T 条件的链表。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`addAfter(node: LinkedListNode<T>, element: T): LinkedListNode<T>`](addafter.md) | 在链表中指定节点的后面插入一个元素，并且返回该元素的节点。 |
| [`addBefore(node: LinkedListNode<T>, element: T): LinkedListNode<T>`](addbefore.md) | 在链表中指定节点的前面插入一个元素，并且返回该元素的节点。 |
| [`addFirst(element: T): LinkedListNode<T>`](addfirst.md) | 在链表的头部位置插入一个元素，并且返回该元素的节点。 |
| [`addLast(element: T): LinkedListNode<T>`](addlast.md) | 在链表的尾部位置添加一个元素，并且返回该元素的节点。 |
| [`backward(mark: LinkedListNode<T>): Iterator<T>`](backward.md) | 获取一个从 mark 节点开始，到所对应链表的头部节点的所有元素的迭代器。 |
| [`clear(): Unit`](clear.md) | 删除链表中的所有元素。 |
| [`forward(mark: LinkedListNode<T>): Iterator<T>`](forward.md) | 获取一个从 mark 节点开始，到所对应链表的尾部节点的所有元素的迭代器。 |
| [`isEmpty(): Bool`](isempty.md) | 返回此链表是否为空链表的判断。 |
| [`iterator(): Iterator<T>`](iterator.md) | 返回当前集合中元素的迭代器，其顺序是从链表的第一个节点到链表的最后一个节点。 |
| [`nodeAt(index: Int64): Option<LinkedListNode<T>>`](nodeat.md) | 获取链表中的第 index 个元素的节点，编号从 0 开始。 |
| [`remove(node: LinkedListNode<T>): T`](remove.md) | 删除链表中指定节点。 |
| [`removeFirst() : ?T`](removefirst.md) | 移除链表的第一个元素，并返回该元素的值。 |
| [`removeIf(predicate: (T)-> Bool): Unit`](removeif.md) | 删除此链表中满足给定 lambda 表达式或函数的所有元素。 |
| [`removeLast() : ?T`](removelast.md) | 移除链表的最后一个元素，并返回该元素的值。 |
| [`reverse(): Unit`](reverse.md) | 反转此链表中的元素顺序。 |
| [`splitOff(node: LinkedListNode<T>): LinkedList<T>`](splitoff.md) | 从指定的节点 node 开始，将链表分割为两个链表，如果分割成功，node 不在当前的链表内，而是作为首个节点存在于新的链表内部。 |
| [`toArray(): Array<T>`](toarray.md) | 返回一个数组，数组包含该链表中的所有元素，并且顺序与链表的顺序相同。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<T> LinkedList<T> <: Equatable<LinkedList<T>> where T <: Equatable<T>`](extensions/extend-t-linkedlist-t-equatable-linkedlist-t-where-t-equatable-t.md) | 为 LinkedList<T> 类型扩展 Equatable<LinkedList<T>> 接口，支持判等操作。 |
| [`extend<T> LinkedList<T> <: ToString where T <: ToString`](extensions/extend-t-linkedlist-t-tostring-where-t-tostring.md) | 为 LinkedList<T> 扩展 ToString 接口，支持转字符串操作。 |
