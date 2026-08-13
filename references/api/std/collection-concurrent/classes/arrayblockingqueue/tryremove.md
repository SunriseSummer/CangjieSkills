<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.class.arrayblockingqueue.tryremove" parent="std.collection.concurrent.class.arrayblockingqueue" -->
# ArrayBlockingQueue<E>.tryRemove

[← ArrayBlockingQueue<E>](index.md)

## 签名

```cangjie role=signature
public func tryRemove(): Option<E>
```

非阻塞的出队操作，获得队首元素并删除。

## 契约

返回值：

- Option\<E> - 返回队首元素，队列为空时返回 None。
