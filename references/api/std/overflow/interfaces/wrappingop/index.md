<!-- cj-doc kind="api-type" level="5" id="std.overflow.interface.wrappingop" parent="std.overflow" -->
# WrappingOp<T>

[← std.overflow](../../index.md)

`WrappingOp<T>`

当整数运算出现溢出，高位截断。

## 方法

| 签名 | 功能 |
|---|---|
| [`wrappingAdd(y: T): T`](wrappingadd.md) | 使用高位截断策略的加法运算。 |
| [`wrappingDec(): T`](wrappingdec.md) | 使用高位截断策略的自减运算。 |
| [`wrappingDiv(y: T): T`](wrappingdiv.md) | 使用高位截断策略的除法运算。 |
| [`wrappingInc(): T`](wrappinginc.md) | 使用高位截断策略的自增运算。 |
| [`wrappingMod(y: T): T`](wrappingmod.md) | 使用高位截断策略的取余运算。 |
| [`wrappingMul(y: T): T`](wrappingmul.md) | 使用高位截断策略的乘法运算。 |
| [`wrappingNeg(): T`](wrappingneg.md) | 使用高位截断策略的负号运算。 |
| [`wrappingShl(y: UInt64): T`](wrappingshl.md) | 使用高位截断策略的左移运算。 |
| [`wrappingShr(y: UInt64): T`](wrappingshr.md) | 使用高位截断策略的右移运算。 |
| [`wrappingSub(y: T): T`](wrappingsub.md) | 使用高位截断策略的减法运算。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Int16 <: WrappingOp<Int16>`](extensions/extend-int16-wrappingop-int16.md) | 为 Int16 实现 WrappingOp 接口。 |
| [`extend Int32 <: WrappingOp<Int32>`](extensions/extend-int32-wrappingop-int32.md) | 为 Int32 实现 WrappingOp 接口。 |
| [`extend Int64 <: WrappingOp<Int64> & WrappingPow`](extensions/extend-int64-wrappingop-int64-wrappingpow.md) | 为 Int64 实现 WrappingOp 和 WrappingPow 接口。 |
| [`extend Int8 <: WrappingOp<Int8>`](extensions/extend-int8-wrappingop-int8.md) | 为 Int8 实现 WrappingOp 接口。 |
| [`extend IntNative <: WrappingOp<IntNative>`](extensions/extend-intnative-wrappingop-intnative.md) | 为 IntNative 实现 WrappingOp 接口。 |
| [`extend UInt16 <: WrappingOp<UInt16>`](extensions/extend-uint16-wrappingop-uint16.md) | 为 UInt16 实现 WrappingOp 接口。 |
| [`extend UInt32 <: WrappingOp<UInt32>`](extensions/extend-uint32-wrappingop-uint32.md) | 为 UInt32 实现 WrappingOp 接口。 |
| [`extend UInt64 <: WrappingOp<UInt64>`](extensions/extend-uint64-wrappingop-uint64.md) | 为 UInt64 实现 WrappingOp 接口。 |
| [`extend UInt8 <: WrappingOp<UInt8>`](extensions/extend-uint8-wrappingop-uint8.md) | 为 UInt8 实现 WrappingOp 接口。 |
| [`extend UIntNative <: WrappingOp<UIntNative>`](extensions/extend-uintnative-wrappingop-uintnative.md) | 为 UIntNative 实现 WrappingOp 接口。 |
