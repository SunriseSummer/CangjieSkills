<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.struct.tuplewrapper2.apply" parent="std.unittest.prop_test.struct.tuplewrapper2" -->
# TupleWrapper2<T0, T1>.apply

[← TupleWrapper2<T0, T1>](index.md)

## 签名

```cangjie role=signature
public func apply<R>(f: (T0, T1) -> R): R
```

执行闭包函数。

## 契约

参数：

- f: (T0, T1) -> R - 待执行的闭包。

返回值：

- R - 闭包的执行结果。
