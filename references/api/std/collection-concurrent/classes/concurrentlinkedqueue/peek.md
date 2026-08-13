<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.class.concurrentlinkedqueue.peek" parent="std.collection.concurrent.class.concurrentlinkedqueue" -->
# ConcurrentLinkedQueue<E>.peek

[← ConcurrentLinkedQueue<E>](index.md)

## 签名

```cangjie role=signature
public func peek(): Option<E>
```

获取队首元素，不会删除该元素。

## 契约

返回值：

- Option\<E> - 成功获取则返回队首元素，队列为空则返回 None。
