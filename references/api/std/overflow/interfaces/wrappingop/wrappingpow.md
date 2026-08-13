<!-- cj-doc kind="api-member" level="7" id="std.overflow.interface.wrappingop.wrappingpow" parent="std.overflow.interface.wrappingop.extension.extend-int64-wrappingop-int64-wrappingpow" -->
# WrappingOp<T>.wrappingPow

[← extend Int64 <: WrappingOp<Int64> & WrappingPow](extensions/extend-int64-wrappingop-int64-wrappingpow.md)

## 签名

```cangjie role=signature
public func wrappingPow(y: UInt64): Int64
```

使用高位截断策略的幂运算。

## 契约

当运算出现溢出时，高位截断，否则返回运算结果。

参数：

- y: UInt64 - 指数。

返回值：

- Int64 - 幂运算结果。
