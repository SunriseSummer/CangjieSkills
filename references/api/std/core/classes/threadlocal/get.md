<!-- cj-doc kind="api-member" level="6" id="std.core.class.threadlocal.get" parent="std.core.class.threadlocal" -->
# ThreadLocal<T>.get

[← ThreadLocal<T>](index.md)

## 签名

```cangjie role=signature
public func get(): ?T
```

获得仓颉线程局部变量的值。

## 契约

返回值：

- ?T - 如果当前线程局部变量不为空值，返回该值，如果为空值，返回 `None`。
