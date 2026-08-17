<!-- cj-doc kind="api-member" level="6" id="std.collection.class.linkedlist.filtermap" parent="std.collection.class.linkedlist" -->
# LinkedList<T>.filterMap

[← LinkedList<T>](index.md)

## 签名

```cangjie role=signature
public func filterMap<R>(transform: (T) -> ?R): LinkedList<R>
```

同时进行筛选操作和映射操作，返回一个新 LinkedList。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- transform: (T) -> ?R - 给定的映射函数。函数返回值为 Some 对应 filter 的 predicate 为 true，反之表示 false。

## 返回值

- LinkedList<R> - 返回一个筛选和映射后的新链表。

