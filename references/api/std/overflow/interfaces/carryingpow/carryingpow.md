<!-- cj-doc kind="api-member" level="6" id="std.overflow.interface.carryingpow.carryingpow" parent="std.overflow.interface.carryingpow" -->
# CarryingPow.carryingPow

[← CarryingPow](index.md)

## 签名

```cangjie role=signature
func carryingPow(y: UInt64): (Bool, Int64)
```

使用 wrapping 策略的幂运算。

## 契约

当运算出现溢出时，返回 `true` 和运算结果，否则返回 `false` 和运算结果。

参数：

- y: UInt64 - 指数。

返回值：

- (Bool, Int64) - 返回一个元组，元组的第一个元素表示运算是否发生了截断，发生截断时为 `true`，元组的第二个元素是运算的结果。
