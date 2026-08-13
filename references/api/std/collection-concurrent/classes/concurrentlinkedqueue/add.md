<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.class.concurrentlinkedqueue.add" parent="std.collection.concurrent.class.concurrentlinkedqueue" -->
# ConcurrentLinkedQueue<E>.add

[← ConcurrentLinkedQueue<E>](index.md)

## 签名

```cangjie role=signature
public func add(element: E): Bool
```

非阻塞的入队操作，将元素添加到队列尾部。

## 契约

> **注意：**
>
> 该函数不会返回 false。

参数：

- element: E - 要添加的元素。

返回值：

- Bool - 成功添加元素则返回 true。
