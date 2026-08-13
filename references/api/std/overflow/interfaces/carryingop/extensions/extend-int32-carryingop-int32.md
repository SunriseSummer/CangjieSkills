<!-- cj-doc kind="api-extension" level="6" id="std.overflow.interface.carryingop.extension.extend-int32-carryingop-int32" parent="std.overflow.interface.carryingop" -->
# extend Int32 <: CarryingOp<Int32>

[← CarryingOp<T>](../index.md)

`extend Int32 <: CarryingOp<Int32>`

为 Int32 实现 CarryingOp 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`carryingAdd(y: Int32): (Bool, Int32)`](../carryingadd.md) | 使用 wrapping 策略的加法运算。 |
| [`carryingDec(): (Bool, Int32)`](../carryingdec.md) | 使用 wrapping 策略的自减运算。 |
| [`carryingDiv(y: Int32): (Bool, Int32)`](../carryingdiv.md) | 使用 wrapping 策略的除法运算。 |
| [`carryingInc(): (Bool, Int32)`](../carryinginc.md) | 使用 wrapping 策略的自增运算。 |
| [`carryingMod(y: Int32): (Bool, Int32)`](../carryingmod.md) | 使用 wrapping 策略的取余运算。 |
| [`carryingMul(y: Int32): (Bool, Int32)`](../carryingmul.md) | 使用 wrapping 策略的乘法运算。 |
| [`carryingNeg(): (Bool, Int32)`](../carryingneg.md) | 使用 wrapping 策略的负号运算。 |
| [`carryingShl(y: UInt64): (Bool, Int32)`](../carryingshl.md) | 使用 wrapping 策略的左移运算。 |
| [`carryingShr(y: UInt64): (Bool, Int32)`](../carryingshr.md) | 使用 wrapping 策略的右移运算。 |
| [`carryingSub(y: Int32): (Bool, Int32)`](../carryingsub.md) | 使用 wrapping 策略的减法运算。 |
