<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.class.concurrentlinkedqueue.iterator" parent="std.collection.concurrent.class.concurrentlinkedqueue" -->
# ConcurrentLinkedQueue<E>.iterator

[← ConcurrentLinkedQueue<E>](index.md)

## 签名

```cangjie role=signature
public func iterator(): Iterator<E>
```

获取当前队列的迭代器，用于遍历当前队列。

## 契约

> **说明：**
>
> 遍历操作不会删除队列中的元素。
> 遍历操作不保证原子性，如果有其他线程并发修改当前队列，不保遍历得到的元素是当前队列某一时刻的静态切片。

返回值：

- Iterator\<E> - 当前队列的迭代器。
