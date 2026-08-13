<!-- cj-doc kind="api-member" level="6" id="std.collection.class.linkedlist.backward" parent="std.collection.class.linkedlist" -->
# LinkedList<T>.backward

[← LinkedList<T>](index.md)

## 签名

```cangjie role=signature
public func backward(mark: LinkedListNode<T>): Iterator<T>
```

获取一个从 mark 节点开始，到所对应链表的头部节点的所有元素的迭代器。

## 契约

参数：

- mark: LinkedListNode\<T> - 开始的元素节点。

返回值：

- Iterator\<T> - 对应元素的迭代器。

异常：

- IllegalStateException - 如果该节点不属于任何链表实例，抛此异常。
