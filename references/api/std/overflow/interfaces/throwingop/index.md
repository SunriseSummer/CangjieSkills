<!-- cj-doc kind="api-type" level="5" id="std.overflow.interface.throwingop" parent="std.overflow" -->
# ThrowingOp<T>

[← std.overflow](../../index.md)

`ThrowingOp<T>`

当整数运算出现溢出，抛出异常。

## 方法

| 签名 | 功能 |
|---|---|
| [`throwingAdd(y: T): T`](throwingadd.md) | 使用抛出异常策略的加法运算。 |
| [`throwingDec(): T`](throwingdec.md) | 使用抛出异常策略的自减运算。 |
| [`throwingDiv(y: T): T`](throwingdiv.md) | 使用抛出异常策略的除法运算。 |
| [`throwingInc(): T`](throwinginc.md) | 使用抛出异常策略的自增运算。 |
| [`throwingMod(y: T): T`](throwingmod.md) | 使用抛出异常策略的取余运算。 |
| [`throwingMul(y: T): T`](throwingmul.md) | 使用抛出异常策略的乘法运算。 |
| [`throwingNeg(): T`](throwingneg.md) | 使用抛出异常策略的负号运算。 |
| [`throwingShl(y: UInt64): T`](throwingshl.md) | 使用抛出异常策略的左移运算。 |
| [`throwingShr(y: UInt64): T`](throwingshr.md) | 右移运算。 |
| [`throwingSub(y: T): T`](throwingsub.md) | 使用抛出异常策略的减法运算。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Int16 <: ThrowingOp<Int16>`](extensions/extend-int16-throwingop-int16.md) | 为 Int16 实现 ThrowingOp 接口。 |
| [`extend Int32 <: ThrowingOp<Int32>`](extensions/extend-int32-throwingop-int32.md) | 为 Int32 实现 ThrowingOp 接口。 |
| [`extend Int64 <: ThrowingOp<Int64> & ThrowingPow`](extensions/extend-int64-throwingop-int64-throwingpow.md) | 为 Int64 实现 ThrowingOp 和 ThrowingPow 接口。 |
| [`extend Int8 <: ThrowingOp<Int8>`](extensions/extend-int8-throwingop-int8.md) | 为 Int8 实现 ThrowingOp 接口。 |
| [`extend IntNative <: ThrowingOp<IntNative>`](extensions/extend-intnative-throwingop-intnative.md) | 为 IntNative 实现 ThrowingOp 接口。 |
| [`extend UInt16 <: ThrowingOp<UInt16>`](extensions/extend-uint16-throwingop-uint16.md) | 为 UInt16 实现 ThrowingOp 接口。 |
| [`extend UInt32 <: ThrowingOp<UInt32>`](extensions/extend-uint32-throwingop-uint32.md) | 为 UInt32 实现 ThrowingOp 接口。 |
| [`extend UInt64 <: ThrowingOp<UInt64>`](extensions/extend-uint64-throwingop-uint64.md) | 为 UInt64 实现 ThrowingOp 接口。 |
| [`extend UInt8 <: ThrowingOp<UInt8>`](extensions/extend-uint8-throwingop-uint8.md) | 为 UInt8 实现 ThrowingOp 接口。 |
| [`extend UIntNative <: ThrowingOp<UIntNative>`](extensions/extend-uintnative-throwingop-uintnative.md) | 为 UIntNative 实现 ThrowingOp 接口。 |
