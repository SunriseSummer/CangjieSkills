<!-- cj-doc kind="api-member" level="6" id="std.collection.class.linkedlist.nodeat" parent="std.collection.class.linkedlist" -->
# LinkedList<T>.nodeAt

[← LinkedList<T>](index.md)

## 签名

```cangjie role=signature
public func nodeAt(index: Int64): Option<LinkedListNode<T>>
```

获取链表中的第 index 个元素的节点，编号从 0 开始。

## 契约

该函数的时间复杂度为 O(n)。

参数：

- index: Int64 - 指定获取第 index 个元素的节点。

返回值：

- Option\<LinkedListNode\<T>> - 编号为 index 的节点，如果没有则返回 None。
