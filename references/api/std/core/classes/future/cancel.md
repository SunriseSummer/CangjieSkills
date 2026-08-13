<!-- cj-doc kind="api-member" level="6" id="std.core.class.future.cancel" parent="std.core.class.future" -->
# Future<T>.cancel

[← Future<T>](index.md)

## 签名

```cangjie role=signature
public func cancel(): Unit
```

给当前 Future 实例对应的仓颉线程发送取消请求。

## 契约

功能：给当前 Future 实例对应的仓颉线程发送取消请求。该方法不会立即停止线程执行，仅发送请求，相应地，Thread 类的函数 `hasPendingCancellation` 可用于检查线程是否存在取消请求，开发者可以通过该检查来自行决定是否提前终止线程以及如何终止线程。
