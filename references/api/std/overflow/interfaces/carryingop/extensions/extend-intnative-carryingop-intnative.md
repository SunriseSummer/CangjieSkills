<!-- cj-doc kind="api-extension" level="6" id="std.overflow.interface.carryingop.extension.extend-intnative-carryingop-intnative" parent="std.overflow.interface.carryingop" -->
# extend IntNative <: CarryingOp<IntNative>

[← CarryingOp<T>](../index.md)

`extend IntNative <: CarryingOp<IntNative>`

为 IntNative 实现 CarryingOp 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`carryingAdd(y: IntNative): (Bool, IntNative)`](../carryingadd.md) | 使用 wrapping 策略的加法运算。 |
| [`carryingDec(): (Bool, IntNative)`](../carryingdec.md) | 使用 wrapping 策略的自减运算。 |
| [`carryingDiv(y: IntNative): (Bool, IntNative)`](../carryingdiv.md) | 使用 wrapping 策略的除法运算。 |
| [`carryingInc(): (Bool, IntNative)`](../carryinginc.md) | 使用 wrapping 策略的自增运算。 |
| [`carryingMod(y: IntNative): (Bool, IntNative)`](../carryingmod.md) | 使用 wrapping 策略的取余运算。 |
| [`carryingMul(y: IntNative): (Bool, IntNative)`](../carryingmul.md) | 使用 wrapping 策略的乘法运算。 |
| [`carryingNeg(): (Bool, IntNative)`](../carryingneg.md) | 使用 wrapping 策略的负号运算。 |
| [`carryingShl(y: UInt64): (Bool, IntNative)`](../carryingshl.md) | 使用 wrapping 策略的左移运算。 |
| [`carryingShr(y: UInt64): (Bool, IntNative)`](../carryingshr.md) | 使用 wrapping 策略的右移运算。 |
| [`carryingSub(y: IntNative): (Bool, IntNative)`](../carryingsub.md) | 使用 wrapping 策略的减法运算。 |
