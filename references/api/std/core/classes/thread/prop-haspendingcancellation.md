<!-- cj-doc kind="api-member" level="6" id="std.core.class.thread.prop-haspendingcancellation" parent="std.core.class.thread" -->
# Thread.hasPendingCancellation

[← Thread](index.md)

## 签名

```cangjie role=signature
public prop hasPendingCancellation: Bool
```

线程是否存在取消请求，即是否通过 future.cancel() 发送过取消请求，常见使用方为 Thread.currentThread.hasPendingCancellation。

## 契约

类型：Bool
