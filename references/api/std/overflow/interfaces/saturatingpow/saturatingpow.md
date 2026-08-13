<!-- cj-doc kind="api-member" level="6" id="std.overflow.interface.saturatingpow.saturatingpow" parent="std.overflow.interface.saturatingpow" -->
# SaturatingPow.saturatingPow

[← SaturatingPow](index.md)

## 签名

```cangjie role=signature
func saturatingPow(y: UInt64): Int64
```

使用饱和策略的幂运算。

## 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

参数：

- y: UInt64 - 指数。

返回值：

- Int64 - 幂运算结果。
