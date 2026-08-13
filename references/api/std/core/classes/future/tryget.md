<!-- cj-doc kind="api-member" level="6" id="std.core.class.future.tryget" parent="std.core.class.future" -->
# Future<T>.tryGet

[← Future<T>](index.md)

## 签名

```cangjie role=signature
public func tryGet(): Option<T>
```

尝试获取执行结果，不会阻塞当前线程。

## 契约

功能：尝试获取执行结果，不会阻塞当前线程。如果相应的线程未完成，则该函数返回 `None`。

返回值：

- Option\<T> - 如果当前仓颉线程未完成返回 `None`，否则返回执行结果。
