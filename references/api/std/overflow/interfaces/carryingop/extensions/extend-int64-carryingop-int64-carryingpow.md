<!-- cj-doc kind="api-extension" level="6" id="std.overflow.interface.carryingop.extension.extend-int64-carryingop-int64-carryingpow" parent="std.overflow.interface.carryingop" -->
# extend Int64 <: CarryingOp<Int64> & CarryingPow

[← CarryingOp<T>](../index.md)

`extend Int64 <: CarryingOp<Int64> & CarryingPow`

为 Int64 实现 CarryingOp 接口和 CarryingPow 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`carryingAdd(y: Int64): (Bool, Int64)`](../carryingadd.md) | 使用 wrapping 策略的加法运算。 |
| [`carryingDec(): (Bool, Int64)`](../carryingdec.md) | 使用 wrapping 策略的自减运算。 |
| [`carryingDiv(y: Int64): (Bool, Int64)`](../carryingdiv.md) | 使用 wrapping 策略的除法运算。 |
| [`carryingInc(): (Bool, Int64)`](../carryinginc.md) | 使用 wrapping 策略的自增运算。 |
| [`carryingMod(y: Int64): (Bool, Int64)`](../carryingmod.md) | 使用 wrapping 策略的取余运算。 |
| [`carryingMul(y: Int64): (Bool, Int64)`](../carryingmul.md) | 使用 wrapping 策略的乘法运算。 |
| [`carryingNeg(): (Bool, Int64)`](../carryingneg.md) | 使用 wrapping 策略的负号运算。 |
| [`carryingPow(y: UInt64): (Bool, Int64)`](../carryingpow.md) | 使用 wrapping 策略的幂运算。 |
| [`carryingShl(y: UInt64): (Bool, Int64)`](../carryingshl.md) | 使用 wrapping 策略的左移运算。 |
| [`carryingShr(y: UInt64): (Bool, Int64)`](../carryingshr.md) | 使用 wrapping 策略的右移运算。 |
| [`carryingSub(y: Int64): (Bool, Int64)`](../carryingsub.md) | 使用 wrapping 策略的减法运算。 |
