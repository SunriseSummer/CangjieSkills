<!-- cj-doc kind="api-member" level="6" id="std.collection.class.linkedlist.removeif" parent="std.collection.class.linkedlist" -->
# LinkedList<T>.removeIf

[← LinkedList<T>](index.md)

## 签名

```cangjie role=signature
public func removeIf(predicate: (T)-> Bool): Unit
```

删除此链表中满足给定 lambda 表达式或函数的所有元素。

## 契约

参数：

- predicate: (T) ->Bool - 对于要删除的元素，返回值为 true。

异常：

- ConcurrentModificationException - 当 `predicate` 中增删或者修改 LinkedList 内节点时，抛出异常。
