<!-- cj-doc kind="api-member" level="6" id="std.collection.class.linkedlist.splitoff" parent="std.collection.class.linkedlist" -->
# LinkedList<T>.splitOff

[← LinkedList<T>](index.md)

## 签名

```cangjie role=signature
public func splitOff(node: LinkedListNode<T>): LinkedList<T>
```

从指定的节点 node 开始，将链表分割为两个链表，如果分割成功，node 不在当前的链表内，而是作为首个节点存在于新的链表内部。

## 契约

参数：

- node: LinkedListNode\<T> - 要分割的位置。

返回值：

- LinkedList\<T> - 原链表分割后新产生的链表。

异常：

- IllegalArgumentException - 如果指定的节点不属于该链表，则抛此异常。
