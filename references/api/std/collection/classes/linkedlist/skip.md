<!-- cj-doc kind="api-member" level="6" id="std.collection.class.linkedlist.skip" parent="std.collection.class.linkedlist" -->
# LinkedList<T>.skip

[← LinkedList<T>](index.md)

## 签名

```cangjie role=signature
public func skip(count: Int64): LinkedList<T>
```

跳过特定个数元素并返回一个新链表。

当 count 小于等于 0 时，抛出异常。当 count 等于 0 时，相当没有跳过任何元素，返回包含源链表所有元素的新链表。当 count 大于 0 小于源链表的大小时，跳过前 count 个元素，返回包含剩下的元素的新链表。当 count 大于等于源链表的大小时，返回空链表。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- count: Int64 - 要跳过的个数。

## 返回值

- LinkedList<T> - 返回一个跳过指定数量元素的新链表。

## 异常

- IllegalArgumentException - 当 count < 0 时，抛出异常。

