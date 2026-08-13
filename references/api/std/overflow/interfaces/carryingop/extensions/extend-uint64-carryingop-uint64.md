<!-- cj-doc kind="api-extension" level="6" id="std.overflow.interface.carryingop.extension.extend-uint64-carryingop-uint64" parent="std.overflow.interface.carryingop" -->
# extend UInt64 <: CarryingOp<UInt64>

[← CarryingOp<T>](../index.md)

`extend UInt64 <: CarryingOp<UInt64>`

为 UInt64 实现 CarryingOp 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`carryingAdd(y: UInt64): (Bool, UInt64)`](../carryingadd.md) | 使用 wrapping 策略的加法运算。 |
| [`carryingDec(): (Bool, UInt64)`](../carryingdec.md) | 使用 wrapping 策略的自减运算。 |
| [`carryingDiv(y: UInt64): (Bool, UInt64)`](../carryingdiv.md) | 使用 wrapping 策略的除法运算。 |
| [`carryingInc(): (Bool, UInt64)`](../carryinginc.md) | 使用 wrapping 策略的自增运算。 |
| [`carryingMod(y: UInt64): (Bool, UInt64)`](../carryingmod.md) | 使用 wrapping 策略的取余运算。 |
| [`carryingMul(y: UInt64): (Bool, UInt64)`](../carryingmul.md) | 使用 wrapping 策略的乘法运算。 |
| [`carryingNeg(): (Bool, UInt64)`](../carryingneg.md) | 使用 wrapping 策略的负号运算。 |
| [`carryingShl(y: UInt64): (Bool, UInt64)`](../carryingshl.md) | 使用 wrapping 策略的左移运算。 |
| [`carryingShr(y: UInt64): (Bool, UInt64)`](../carryingshr.md) | 使用 wrapping 策略的右移运算。 |
| [`carryingSub(y: UInt64): (Bool, UInt64)`](../carryingsub.md) | 使用 wrapping 策略的减法运算。 |
