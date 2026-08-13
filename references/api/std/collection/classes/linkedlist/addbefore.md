<!-- cj-doc kind="api-member" level="6" id="std.collection.class.linkedlist.addbefore" parent="std.collection.class.linkedlist" -->
# LinkedList<T>.addBefore

[← LinkedList<T>](index.md)

## 签名

```cangjie role=signature
public func addBefore(node: LinkedListNode<T>, element: T): LinkedListNode<T>
```

在链表中指定节点的前面插入一个元素，并且返回该元素的节点。

## 契约

参数：

- node: LinkedListNode\<T> - 指定的节点。
- element: T - 要添加到链表中的元素。

返回值：

- LinkedListNode\<T> - 指向被插入元素的节点。

异常：

- IllegalArgumentException - 如果指定的节点不属于该链表，则抛此异常。
