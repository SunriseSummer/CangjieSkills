<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.class.arrayblockingqueue.peek" parent="std.collection.concurrent.class.arrayblockingqueue" -->
# ArrayBlockingQueue<E>.peek

[← ArrayBlockingQueue<E>](index.md)

## 签名

```cangjie role=signature
public func peek(): Option<E>
```

非阻塞的获取队首元素。

## 契约

返回值：

- Option\<E> - 返回队首元素，队列为空时返回 None。
