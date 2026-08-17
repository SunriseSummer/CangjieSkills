<!-- cj-doc kind="api-member" level="6" id="std.collection.class.linkedlist.flatmap" parent="std.collection.class.linkedlist" -->
# LinkedList<T>.flatMap

[← LinkedList<T>](index.md)

## 签名

```cangjie role=signature
public func flatMap<R>(transform: (T) -> LinkedList<R>): LinkedList<R>
```

对链表中的每个元素应用一个转换闭包（transform），该闭包返回一个新的链表，然后将所有返回的链表“压平”（flatten）并连接成一个单一的结果链表。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- transform: (T) -> LinkedList<R> - 给定的映射函数。

## 返回值

- LinkedList<R> -  被“映射（map）”和“压平（flatten）”后的新链表。

