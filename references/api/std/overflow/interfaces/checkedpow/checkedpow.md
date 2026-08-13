<!-- cj-doc kind="api-member" level="6" id="std.overflow.interface.checkedpow.checkedpow" parent="std.overflow.interface.checkedpow" -->
# CheckedPow.checkedPow

[← CheckedPow](index.md)

## 签名

```cangjie role=signature
func checkedPow(y: UInt64): ?Int64
```

使用返回 Option 策略的幂运算。

## 契约

当运算出现溢出时，返回 ?Int64.None，否则返回运算结果。

参数：

- y: UInt64 - 指数。

返回值：

- ?Int64 - 幂运算结果。
