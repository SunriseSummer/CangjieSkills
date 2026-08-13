<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.class.concurrentlinkedqueue.remove" parent="std.collection.concurrent.class.concurrentlinkedqueue" -->
# ConcurrentLinkedQueue<E>.remove

[← ConcurrentLinkedQueue<E>](index.md)

## 签名

```cangjie role=signature
public func remove(): Option<E>
```

获取并删除队首元素。

## 契约

返回值：

- Option\<E> - 成功删除则返回队首元素，队列为空则返回 None。
