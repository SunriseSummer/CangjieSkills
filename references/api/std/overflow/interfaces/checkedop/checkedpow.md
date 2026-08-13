<!-- cj-doc kind="api-member" level="7" id="std.overflow.interface.checkedop.checkedpow" parent="std.overflow.interface.checkedop.extension.extend-int64-checkedop-int64-checkedpow" -->
# CheckedOp<T>.checkedPow

[← extend Int64 <: CheckedOp<Int64> & CheckedPow](extensions/extend-int64-checkedop-int64-checkedpow.md)

## 签名

```cangjie role=signature
public func checkedPow(y: UInt64): ?Int64
```

使用返回 Option 策略的幂运算。

## 契约

当运算出现溢出时，返回 ?Int64.None，否则返回运算结果。

参数：

- y: UInt64 - 指数。

返回值：

- ?Int64 - 幂运算结果。
