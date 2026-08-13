<!-- cj-doc kind="api-member" level="7" id="std.collection.class.linkedlist.operator-ne" parent="std.collection.class.linkedlist.extension.extend-t-linkedlist-t-equatable-linkedlist-t-where-t-equatable-t" -->
# LinkedList<T>.!=

[← extend<T> LinkedList<T> <: Equatable<LinkedList<T>> where T <: Equatable<T>](extensions/extend-t-linkedlist-t-equatable-linkedlist-t-where-t-equatable-t.md)

## 签名

```cangjie role=signature
public operator func !=(right: LinkedList<T>): Bool
```

判断当前实例与参数指向的 LinkedList<T> 实例是否不等。

## 契约

参数：

- right: LinkedList\<T> - 被比较的对象。

返回值：

- Bool - 如果不等，则返回 true，否则返回 false。
