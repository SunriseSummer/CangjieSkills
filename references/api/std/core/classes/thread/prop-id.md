<!-- cj-doc kind="api-member" level="6" id="std.core.class.thread.prop-id" parent="std.core.class.thread" -->
# Thread.id

[← Thread](index.md)

## 签名

```cangjie role=signature
public prop id: Int64
```

获取当前执行线程的标识，以 Int64 表示，所有存活的线程都有不同标识，但不保证当线程执行结束后复用它的标识。

## 契约

类型：Int64
