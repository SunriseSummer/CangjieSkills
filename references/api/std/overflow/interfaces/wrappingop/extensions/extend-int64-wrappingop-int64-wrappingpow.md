<!-- cj-doc kind="api-extension" level="6" id="std.overflow.interface.wrappingop.extension.extend-int64-wrappingop-int64-wrappingpow" parent="std.overflow.interface.wrappingop" -->
# extend Int64 <: WrappingOp<Int64> & WrappingPow

[← WrappingOp<T>](../index.md)

`extend Int64 <: WrappingOp<Int64> & WrappingPow`

为 Int64 实现 WrappingOp 和 WrappingPow 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`wrappingAdd(y: Int64): Int64`](../wrappingadd.md) | 使用高位截断策略的加法运算。 |
| [`wrappingDec(): Int64`](../wrappingdec.md) | 使用高位截断策略的自减运算。 |
| [`wrappingDiv(y: Int64): Int64`](../wrappingdiv.md) | 使用高位截断策略的除法运算。 |
| [`wrappingInc(): Int64`](../wrappinginc.md) | 使用高位截断策略的自增运算。 |
| [`wrappingMod(y: Int64): Int64`](../wrappingmod.md) | 使用高位截断策略的取余运算。 |
| [`wrappingMul(y: Int64): Int64`](../wrappingmul.md) | 使用高位截断策略的乘法运算。 |
| [`wrappingNeg(): Int64`](../wrappingneg.md) | 使用高位截断策略的负号运算。 |
| [`wrappingPow(y: UInt64): Int64`](../wrappingpow.md) | 使用高位截断策略的幂运算。 |
| [`wrappingShl(y: UInt64): Int64`](../wrappingshl.md) | 使用高位截断策略的左移运算。 |
| [`wrappingShr(y: UInt64): Int64`](../wrappingshr.md) | 使用高位截断策略的右移运算。 |
| [`wrappingSub(y: Int64): Int64`](../wrappingsub.md) | 使用高位截断策略的减法运算。 |
