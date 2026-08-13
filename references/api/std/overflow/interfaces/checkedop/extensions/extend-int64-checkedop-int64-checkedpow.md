<!-- cj-doc kind="api-extension" level="6" id="std.overflow.interface.checkedop.extension.extend-int64-checkedop-int64-checkedpow" parent="std.overflow.interface.checkedop" -->
# extend Int64 <: CheckedOp<Int64> & CheckedPow

[← CheckedOp<T>](../index.md)

`extend Int64 <: CheckedOp<Int64> & CheckedPow`

为 Int64 实现 CheckedOp 和 CheckedPow 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`checkedAdd(y: Int64): ?Int64`](../checkedadd.md) | 使用返回 Option 策略的加法运算。 |
| [`checkedDec(): ?Int64`](../checkeddec.md) | 使用返回 Option 策略的自减运算。 |
| [`checkedDiv(y: Int64): ?Int64`](../checkeddiv.md) | 使用返回 Option 策略的除法运算。 |
| [`checkedInc(): ?Int64`](../checkedinc.md) | 使用返回 Option 策略的自增运算。 |
| [`checkedMod(y: Int64): ?Int64`](../checkedmod.md) | 使用返回 Option 策略的取余运算。 |
| [`checkedMul(y: Int64): ?Int64`](../checkedmul.md) | 使用返回 Option 策略的乘法运算。 |
| [`checkedNeg(): ?Int64`](../checkedneg.md) | 使用返回 Option 策略的负号运算。 |
| [`checkedPow(y: UInt64): ?Int64`](../checkedpow.md) | 使用返回 Option 策略的幂运算。 |
| [`checkedShl(y: UInt64): ?Int64`](../checkedshl.md) | 使用返回 Option 策略的左移运算。 |
| [`checkedShr(y: UInt64): ?Int64`](../checkedshr.md) | 使用返回 Option 策略的右移运算。 |
| [`checkedSub(y: Int64): ?Int64`](../checkedsub.md) | 使用返回 Option 策略的减法运算。 |
