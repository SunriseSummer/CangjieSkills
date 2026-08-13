<!-- cj-doc kind="api-type" level="5" id="std.overflow.interface.saturatingop" parent="std.overflow" -->
# SaturatingOp<T>

[← std.overflow](../../index.md)

`SaturatingOp<T>`

当整数运算出现溢出，饱和处理。

## 方法

| 签名 | 功能 |
|---|---|
| [`saturatingAdd(y: T): T`](saturatingadd.md) | 使用饱和策略的加法运算。 |
| [`saturatingDec(): T`](saturatingdec.md) | 使用饱和策略的自减运算。 |
| [`saturatingDiv(y: T): T`](saturatingdiv.md) | 使用饱和策略的除法运算。 |
| [`saturatingInc(): T`](saturatinginc.md) | 使用饱和策略的自增运算。 |
| [`saturatingMod(y: T): T`](saturatingmod.md) | 使用饱和策略的取余运算。 |
| [`saturatingMul(y: T): T`](saturatingmul.md) | 使用饱和策略的乘法运算。 |
| [`saturatingNeg(): T`](saturatingneg.md) | 使用饱和策略的负号运算。 |
| [`saturatingShl(y: UInt64): T`](saturatingshl.md) | 使用饱和策略的左移运算。 |
| [`saturatingShr(y: UInt64): T`](saturatingshr.md) | 使用饱和策略的右移运算。 |
| [`saturatingSub(y: T): T`](saturatingsub.md) | 使用饱和策略的减法运算。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Int16 <: SaturatingOp<Int16>`](extensions/extend-int16-saturatingop-int16.md) | 为 Int16 实现 SaturatingOp 接口。 |
| [`extend Int32 <: SaturatingOp<Int32>`](extensions/extend-int32-saturatingop-int32.md) | 为 Int32 实现 SaturatingOp 接口。 |
| [`extend Int64 <: SaturatingOp<Int64> & SaturatingPow`](extensions/extend-int64-saturatingop-int64-saturatingpow.md) | 为 Int64 实现 SaturatingOp 和 SaturatingPow 接口。 |
| [`extend Int8 <: SaturatingOp<Int8>`](extensions/extend-int8-saturatingop-int8.md) | 为 Int8 实现 SaturatingOp 接口。 |
| [`extend IntNative <: SaturatingOp<IntNative>`](extensions/extend-intnative-saturatingop-intnative.md) | 为 IntNative 实现 SaturatingOp 接口。 |
| [`extend UInt16 <: SaturatingOp<UInt16>`](extensions/extend-uint16-saturatingop-uint16.md) | 为 UInt16 实现 SaturatingOp 接口。 |
| [`extend UInt32 <: SaturatingOp<UInt32>`](extensions/extend-uint32-saturatingop-uint32.md) | 为 UInt32 实现 SaturatingOp 接口。 |
| [`extend UInt64 <: SaturatingOp<UInt64>`](extensions/extend-uint64-saturatingop-uint64.md) | 为 UInt64 实现 SaturatingOp 接口。 |
| [`extend UInt8 <: SaturatingOp<UInt8>`](extensions/extend-uint8-saturatingop-uint8.md) | 为 UInt8 实现 SaturatingOp 接口。 |
| [`extend UIntNative <: SaturatingOp<UIntNative>`](extensions/extend-uintnative-saturatingop-uintnative.md) | 为 UIntNative 实现 SaturatingOp 接口。 |
