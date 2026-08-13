<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.class.concurrentlinkedqueue.toarray" parent="std.collection.concurrent.class.concurrentlinkedqueue" -->
# ConcurrentLinkedQueue<E>.toArray

[← ConcurrentLinkedQueue<E>](index.md)

## 签名

```cangjie role=signature
public func toArray(): Array<E>
```

将当前队列中所有元素按顺序存入数组，先入队的元素在数组下标较小的位置。

## 契约

> **说明：**
>
> 该操作不会删除队列中的元素。
> 该操作不保证原子性，如果有其他线程并发修改当前队列，不保证该操作得到的数组是当前队列某一时刻的静态切片。

返回值：

- Array\<E> - 得到的数组，里面的元素为当前队列中的元素。
