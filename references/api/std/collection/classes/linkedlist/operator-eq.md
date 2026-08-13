<!-- cj-doc kind="api-member" level="7" id="std.collection.class.linkedlist.operator-eq" parent="std.collection.class.linkedlist.extension.extend-t-linkedlist-t-equatable-linkedlist-t-where-t-equatable-t" -->
# LinkedList<T>.==

[← extend<T> LinkedList<T> <: Equatable<LinkedList<T>> where T <: Equatable<T>](extensions/extend-t-linkedlist-t-equatable-linkedlist-t-where-t-equatable-t.md)

## 签名

```cangjie role=signature
public operator func ==(right: LinkedList<T>): Bool
```

判断当前实例与参数指向的 LinkedList<T> 实例是否相等。

## 契约

两个 LinkedList\<T> 相等指的是其中包含的元素完全相等。

参数：

- right: LinkedList\<T> - 被比较的对象。

返回值：

- Bool - 如果相等，则返回 true，否则返回 false。
