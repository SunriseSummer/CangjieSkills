<!-- cj-doc kind="api-member" level="7" id="std.overflow.interface.saturatingop.saturatingpow" parent="std.overflow.interface.saturatingop.extension.extend-int64-saturatingop-int64-saturatingpow" -->
# SaturatingOp<T>.saturatingPow

[← extend Int64 <: SaturatingOp<Int64> & SaturatingPow](extensions/extend-int64-saturatingop-int64-saturatingpow.md)

## 签名

```cangjie role=signature
public func saturatingPow(y: UInt64): Int64
```

使用饱和策略的幂运算。

## 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

参数：

- y: UInt64 - 指数。

返回值：

- Int64 - 幂运算结果。
