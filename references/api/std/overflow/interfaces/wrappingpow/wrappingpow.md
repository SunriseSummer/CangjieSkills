<!-- cj-doc kind="api-member" level="6" id="std.overflow.interface.wrappingpow.wrappingpow" parent="std.overflow.interface.wrappingpow" -->
# WrappingPow.wrappingPow

[← WrappingPow](index.md)

## 签名

```cangjie role=signature
func wrappingPow(y: UInt64): Int64
```

使用高位截断策略的幂运算。

## 契约

当运算出现溢出时，高位截断，否则返回运算结果。

参数：

- y: UInt64 - 指数。

返回值：

- Int64 - 幂运算结果。
