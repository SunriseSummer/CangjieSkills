<!-- cj-doc kind="api-extension" level="6" id="std.overflow.interface.carryingop.extension.extend-uint32-carryingop-uint32" parent="std.overflow.interface.carryingop" -->
# extend UInt32 <: CarryingOp<UInt32>

[← CarryingOp<T>](../index.md)

`extend UInt32 <: CarryingOp<UInt32>`

为 UInt32 实现 CarryingOp 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`carryingAdd(y: UInt32): (Bool, UInt32)`](../carryingadd.md) | 使用 wrapping 策略的加法运算。 |
| [`carryingDec(): (Bool, UInt32)`](../carryingdec.md) | 使用 wrapping 策略的自减运算。 |
| [`carryingDiv(y: UInt32): (Bool, UInt32)`](../carryingdiv.md) | 使用 wrapping 策略的除法运算。 |
| [`carryingInc(): (Bool, UInt32)`](../carryinginc.md) | 使用 wrapping 策略的自增运算。 |
| [`carryingMod(y: UInt32): (Bool, UInt32)`](../carryingmod.md) | 使用 wrapping 策略的取余运算。 |
| [`carryingMul(y: UInt32): (Bool, UInt32)`](../carryingmul.md) | 使用 wrapping 策略的乘法运算。 |
| [`carryingNeg(): (Bool, UInt32)`](../carryingneg.md) | 使用 wrapping 策略的负号运算。 |
| [`carryingShl(y: UInt64): (Bool, UInt32)`](../carryingshl.md) | 使用 wrapping 策略的左移运算。 |
| [`carryingShr(y: UInt64): (Bool, UInt32)`](../carryingshr.md) | 使用 wrapping 策略的右移运算。 |
| [`carryingSub(y: UInt32): (Bool, UInt32)`](../carryingsub.md) | 使用 wrapping 策略的减法运算。 |
