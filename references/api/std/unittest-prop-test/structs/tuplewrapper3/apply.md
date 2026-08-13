<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.struct.tuplewrapper3.apply" parent="std.unittest.prop_test.struct.tuplewrapper3" -->
# TupleWrapper3<T0, T1, T2>.apply

[← TupleWrapper3<T0, T1, T2>](index.md)

## 签名

```cangjie role=signature
public func apply<R>(f: (T0, T1,T2) -> R): R
```

执行闭包函数。

## 契约

参数：

- f: (T0, T1,T2) -> R - 待执行的闭包。

返回值：

- R - 闭包的执行结果。
