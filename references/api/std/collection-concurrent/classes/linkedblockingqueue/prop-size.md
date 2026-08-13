<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.class.linkedblockingqueue.prop-size" parent="std.collection.concurrent.class.linkedblockingqueue" -->
# LinkedBlockingQueue<E>.size

[← LinkedBlockingQueue<E>](index.md)

## 签名

```cangjie role=signature
public prop size: Int64
```

返回此 LinkedBlockingQueue 的元素个数。

## 契约

> **注意：**
>
> 此方法不保证并发场景下的原子性，建议在环境中没有其他线程并发地修改 LinkedBlockingQueue 时调用。

类型：Int64
