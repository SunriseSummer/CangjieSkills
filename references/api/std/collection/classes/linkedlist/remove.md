<!-- cj-doc kind="api-member" level="6" id="std.collection.class.linkedlist.remove" parent="std.collection.class.linkedlist" -->
# LinkedList<T>.remove

[← LinkedList<T>](index.md)

## 签名

```cangjie role=signature
public func remove(node: LinkedListNode<T>): T
```

删除链表中指定节点。

## 契约

参数：

- node: LinkedListNode\<T> - 要被删除的节点。

返回值：

- T - 被删除的节点的值。

异常：

- IllegalArgumentException - 如果指定的节点不属于该链表，则抛此异常。
