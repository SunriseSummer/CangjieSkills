<!-- cj-doc kind="api-member" level="6" id="std.collection.class.linkedlistnode.prop-prev" parent="std.collection.class.linkedlistnode" -->
# LinkedListNode<T>.prev

[← LinkedListNode<T>](index.md)

## 签名

```cangjie role=signature
public prop prev: Option<LinkedListNode<T>>
```

获取当前节点的前一个节点，如果没有则返回 None。

## 契约

类型：Option\<LinkedListNode\<T>>

异常：

- IllegalStateException - 如果该节点不属于任何链表实例，抛此异常。
