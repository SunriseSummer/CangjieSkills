<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.class.arrayblockingqueue.tryadd" parent="std.collection.concurrent.class.arrayblockingqueue" -->
# ArrayBlockingQueue<E>.tryAdd

[← ArrayBlockingQueue<E>](index.md)

## 签名

```cangjie role=signature
public func tryAdd(element: E): Bool
```

非阻塞的入队操作，将元素添加到队列尾部。

## 契约

参数：

- element: E - 要添加的元素。

返回值：

- Bool - 成功添加返回 true；如果队列满了，添加失败返回 false。
