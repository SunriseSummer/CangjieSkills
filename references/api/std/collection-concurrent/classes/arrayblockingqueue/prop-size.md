<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.class.arrayblockingqueue.prop-size" parent="std.collection.concurrent.class.arrayblockingqueue" -->
# ArrayBlockingQueue<E>.size

[← ArrayBlockingQueue<E>](index.md)

## 签名

```cangjie role=signature
public prop size: Int64
```

返回此 ArrayBlockingQueue 的元素个数。

## 契约

> **注意：**
>
> 此方法不保证并发场景下的原子性，建议在环境中没有其他线程并发地修改 ArrayBlockingQueue 时调用。

类型：Int64
