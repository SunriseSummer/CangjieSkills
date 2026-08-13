<!-- cj-doc kind="api-member" level="7" id="std.overflow.interface.throwingop.throwingpow" parent="std.overflow.interface.throwingop.extension.extend-int64-throwingop-int64-throwingpow" -->
# ThrowingOp<T>.throwingPow

[← extend Int64 <: ThrowingOp<Int64> & ThrowingPow](extensions/extend-int64-throwingop-int64-throwingpow.md)

## 签名

```cangjie role=signature
public func throwingPow(y: UInt64): Int64
```

使用抛出异常策略的幂运算。

## 契约

当运算出现溢出时，抛出异常，否则返回运算结果。

参数：

- y: UInt64 - 指数。

返回值：

- Int64 - 幂运算结果。

异常：

- OverflowException - 当幂运算出现溢出时，抛出异常。
