<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.class.linkedblockingqueue.peek" parent="std.collection.concurrent.class.linkedblockingqueue" -->
# LinkedBlockingQueue<E>.peek

[← LinkedBlockingQueue<E>](index.md)

## 签名

```cangjie role=signature
public func peek(): Option<E>
```

获取队首元素。

## 契约

> **注意：**
>
> 该函数是非阻塞的。

返回值：

- Option\<E> - 返回队首元素，队列为空时返回 None。
