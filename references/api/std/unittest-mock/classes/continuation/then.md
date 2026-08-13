<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.continuation.then" parent="std.unittest.mock.class.continuation" -->
# Continuation<A>.then

[← Continuation<A>](index.md)

## 签名

```cangjie role=signature
func then(): A
```

当链中的先前操作完成时，返回 ActionSelector 的子类对象。

## 契约

返回值：

- A - ActionSelector的子类对象实例。

异常：

- MockFrameworkException - 当先前的操作未得到满足时，将抛出异常。
