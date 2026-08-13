<!-- cj-doc kind="api-extension" level="6" id="std.overflow.interface.carryingop.extension.extend-uint8-carryingop-uint8" parent="std.overflow.interface.carryingop" -->
# extend UInt8 <: CarryingOp<UInt8>

[← CarryingOp<T>](../index.md)

`extend UInt8 <: CarryingOp<UInt8>`

为 UInt8 实现 CarryingOp 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`carryingAdd(y: UInt8): (Bool, UInt8)`](../carryingadd.md) | 使用 wrapping 策略的加法运算。 |
| [`carryingDec(): (Bool, UInt8)`](../carryingdec.md) | 使用 wrapping 策略的自减运算。 |
| [`carryingDiv(y: UInt8): (Bool, UInt8)`](../carryingdiv.md) | 使用 wrapping 策略的除法运算。 |
| [`carryingInc(): (Bool, UInt8)`](../carryinginc.md) | 使用 wrapping 策略的自增运算。 |
| [`carryingMod(y: UInt8): (Bool, UInt8)`](../carryingmod.md) | 使用 wrapping 策略的取余运算。 |
| [`carryingMul(y: UInt8): (Bool, UInt8)`](../carryingmul.md) | 使用 wrapping 策略的乘法运算。 |
| [`carryingNeg(): (Bool, UInt8)`](../carryingneg.md) | 使用 wrapping 策略的负号运算。 |
| [`carryingShl(y: UInt64): (Bool, UInt8)`](../carryingshl.md) | 使用 wrapping 策略的左移运算。 |
| [`carryingShr(y: UInt64): (Bool, UInt8)`](../carryingshr.md) | 使用 wrapping 策略的右移运算。 |
| [`carryingSub(y: UInt8): (Bool, UInt8)`](../carryingsub.md) | 使用 wrapping 策略的减法运算。 |
