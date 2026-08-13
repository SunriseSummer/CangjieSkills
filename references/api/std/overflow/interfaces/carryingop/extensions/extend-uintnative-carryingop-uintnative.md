<!-- cj-doc kind="api-extension" level="6" id="std.overflow.interface.carryingop.extension.extend-uintnative-carryingop-uintnative" parent="std.overflow.interface.carryingop" -->
# extend UIntNative <: CarryingOp<UIntNative>

[← CarryingOp<T>](../index.md)

`extend UIntNative <: CarryingOp<UIntNative>`

为 UIntNative 实现 CarryingOp 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`carryingAdd(y: UIntNative): (Bool, UIntNative)`](../carryingadd.md) | 使用 wrapping 策略的加法运算。 |
| [`carryingDec(): (Bool, UIntNative)`](../carryingdec.md) | 使用 wrapping 策略的自减运算。 |
| [`carryingDiv(y: UIntNative): (Bool, UIntNative)`](../carryingdiv.md) | 使用 wrapping 策略的除法运算。 |
| [`carryingInc(): (Bool, UIntNative)`](../carryinginc.md) | 使用 wrapping 策略的自增运算。 |
| [`carryingMod(y: UIntNative): (Bool, UIntNative)`](../carryingmod.md) | 使用 wrapping 策略的取余运算。 |
| [`carryingMul(y: UIntNative): (Bool, UIntNative)`](../carryingmul.md) | 使用 wrapping 策略的乘法运算。 |
| [`carryingNeg(): (Bool, UIntNative)`](../carryingneg.md) | 使用 wrapping 策略的负号运算。 |
| [`carryingShl(y: UInt64): (Bool, UIntNative)`](../carryingshl.md) | 使用 wrapping 策略的左移运算。 |
| [`carryingShr(y: UInt64): (Bool, UIntNative)`](../carryingshr.md) | 使用 wrapping 策略的右移运算。 |
| [`carryingSub(y: UIntNative): (Bool, UIntNative)`](../carryingsub.md) | 使用 wrapping 策略的减法运算。 |
