<!-- cj-doc kind="api-extension" level="6" id="std.overflow.interface.carryingop.extension.extend-uint16-carryingop-uint16" parent="std.overflow.interface.carryingop" -->
# extend UInt16 <: CarryingOp<UInt16>

[← CarryingOp<T>](../index.md)

`extend UInt16 <: CarryingOp<UInt16>`

为 UInt16 实现 CarryingOp 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`carryingAdd(y: UInt16): (Bool, UInt16)`](../carryingadd.md) | 使用 wrapping 策略的加法运算。 |
| [`carryingDec(): (Bool, UInt16)`](../carryingdec.md) | 使用 wrapping 策略的自减运算。 |
| [`carryingDiv(y: UInt16): (Bool, UInt16)`](../carryingdiv.md) | 使用 wrapping 策略的除法运算。 |
| [`carryingInc(): (Bool, UInt16)`](../carryinginc.md) | 使用 wrapping 策略的自增运算。 |
| [`carryingMod(y: UInt16): (Bool, UInt16)`](../carryingmod.md) | 使用 wrapping 策略的取余运算。 |
| [`carryingMul(y: UInt16): (Bool, UInt16)`](../carryingmul.md) | 使用 wrapping 策略的乘法运算。 |
| [`carryingNeg(): (Bool, UInt16)`](../carryingneg.md) | 使用 wrapping 策略的负号运算。 |
| [`carryingShl(y: UInt64): (Bool, UInt16)`](../carryingshl.md) | 使用 wrapping 策略的左移运算。 |
| [`carryingShr(y: UInt64): (Bool, UInt16)`](../carryingshr.md) | 使用 wrapping 策略的右移运算。 |
| [`carryingSub(y: UInt16): (Bool, UInt16)`](../carryingsub.md) | 使用 wrapping 策略的减法运算。 |
