<!-- cj-doc kind="api-member" level="6" id="std.core.class.threadlocal.set" parent="std.core.class.threadlocal" -->
# ThreadLocal<T>.set

[← ThreadLocal<T>](index.md)

## 签名

```cangjie role=signature
public func set(value: ?T): Unit
```

通过 value 设置仓颉线程局部变量的值，如果传入 `None`，该局部变量的值将被删除，在线程后续操作中将无法获取。

## 契约

参数：

- value: ?T - 需要设置的局部变量的值。
