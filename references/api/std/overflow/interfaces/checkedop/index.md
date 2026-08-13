<!-- cj-doc kind="api-type" level="5" id="std.overflow.interface.checkedop" parent="std.overflow" -->
# CheckedOp<T>

[← std.overflow](../../index.md)

`CheckedOp<T>`

当整数运算出现溢出，返回 `None`。

## 方法

| 签名 | 功能 |
|---|---|
| [`checkedAdd(y: T): ?T`](checkedadd.md) | 使用返回 Option 策略的加法运算。 |
| [`checkedDec(): ?T`](checkeddec.md) | 使用返回 Option 策略的自减运算。 |
| [`checkedDiv(y: T): ?T`](checkeddiv.md) | 使用返回 Option 策略的除法运算。 |
| [`checkedInc(): ?T`](checkedinc.md) | 使用返回 Option 策略的自增运算。 |
| [`checkedMod(y: T): ?T`](checkedmod.md) | 使用返回 Option 策略的取余运算。 |
| [`checkedMul(y: T): ?T`](checkedmul.md) | 使用返回 Option 策略的乘法运算。 |
| [`checkedNeg(): ?T`](checkedneg.md) | 使用返回 Option 策略的负号运算。 |
| [`checkedShl(y: UInt64): ?T`](checkedshl.md) | 使用返回 Option 策略的左移运算。 |
| [`checkedShr(y: UInt64): ?T`](checkedshr.md) | 使用返回 Option 策略的右移运算。 |
| [`checkedSub(y: T): ?T`](checkedsub.md) | 使用返回 Option 策略的减法运算。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Int16 <: CheckedOp<Int16>`](extensions/extend-int16-checkedop-int16.md) | 为 Int16 实现 CheckedOp 接口。 |
| [`extend Int32 <: CheckedOp<Int32>`](extensions/extend-int32-checkedop-int32.md) | 为 Int32 实现 CheckedOp 接口。 |
| [`extend Int64 <: CheckedOp<Int64> & CheckedPow`](extensions/extend-int64-checkedop-int64-checkedpow.md) | 为 Int64 实现 CheckedOp 和 CheckedPow 接口。 |
| [`extend Int8 <: CheckedOp<Int8>`](extensions/extend-int8-checkedop-int8.md) | 为 Int8 实现 CheckedOp 接口。 |
| [`extend IntNative <: CheckedOp<IntNative>`](extensions/extend-intnative-checkedop-intnative.md) | 为 IntNative 实现 CheckedOp 接口。 |
| [`extend UInt16 <: CheckedOp<UInt16>`](extensions/extend-uint16-checkedop-uint16.md) | 为 UInt16 实现 CheckedOp 接口。 |
| [`extend UInt32 <: CheckedOp<UInt32>`](extensions/extend-uint32-checkedop-uint32.md) | 为 UInt32 实现 CheckedOp 接口。 |
| [`extend UInt64 <: CheckedOp<UInt64>`](extensions/extend-uint64-checkedop-uint64.md) | 为 UInt64 实现 CheckedOp 接口。 |
| [`extend UInt8 <: CheckedOp<UInt8>`](extensions/extend-uint8-checkedop-uint8.md) | 为 UInt8 实现 CheckedOp 接口。 |
| [`extend UIntNative <: CheckedOp<UIntNative>`](extensions/extend-uintnative-checkedop-uintnative.md) | 为 UIntNative 实现 CheckedOp 接口。 |
