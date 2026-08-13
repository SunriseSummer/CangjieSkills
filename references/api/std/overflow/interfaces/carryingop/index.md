<!-- cj-doc kind="api-type" level="5" id="std.overflow.interface.carryingop" parent="std.overflow" -->
# CarryingOp<T>

[← std.overflow](../../index.md)

`CarryingOp<T>`

提供返回整数运算是否发生了截断以及运算结果的接口。

## 方法

| 签名 | 功能 |
|---|---|
| [`carryingAdd(y: T): (Bool, T)`](carryingadd.md) | 返回一个元组，元组的第一个元素表示加法运算是否发生了截断，发生截断时为 `true`，元组的第二个元素是运算的结果。 |
| [`carryingDec(): (Bool, T)`](carryingdec.md) | 返回一个元组，元组的第一个元素表示自减运算是否发生了截断，发生截断时为 `true`，元组的第二个元素是运算的结果。 |
| [`carryingDiv(y: T): (Bool, T)`](carryingdiv.md) | 返回一个元组，元组的第一个元素表示除法运算是否发生了截断，发生截断时为 `true`，元组的第二个元素是运算的结果。 |
| [`carryingInc(): (Bool, T)`](carryinginc.md) | 返回一个元组，元组的第一个元素表示自增运算是否发生了截断，发生截断时为 `true`，元组的第二个元素是运算的结果。 |
| [`carryingMod(y: T): (Bool, T)`](carryingmod.md) | 返回一个元组，元组的第一个元素表示取余运算是否发生了截断，发生截断时为 `true`，元组的第二个元素是运算的结果。 |
| [`carryingMul(y: T): (Bool, T)`](carryingmul.md) | 返回一个元组，元组的第一个元素表示乘法运算是否发生了截断，发生截断时为 `true`，元组的第二个元素是运算的结果。 |
| [`carryingNeg(): (Bool, T)`](carryingneg.md) | 返回一个元组，元组的第一个元素表示负号运算是否发生了截断，发生截断时为 `true`，元组的第二个元素是运算的结果。 |
| [`carryingShl(y: UInt64): (Bool, T)`](carryingshl.md) | 返回一个元组，元组的第一个元素表示左移运算是否发生了截断，发生截断时为 `true`，元组的第二个元素是运算的结果。 |
| [`carryingShr(y: UInt64): (Bool, T)`](carryingshr.md) | 返回一个元组，元组的第一个元素表示右移运算是否发生了截断，发生截断时为 `true`，元组的第二个元素是运算的结果。 |
| [`carryingSub(y: T): (Bool, T)`](carryingsub.md) | 返回一个元组，元组的第一个元素表示减法运算是否发生了截断，发生截断时为 `true`，元组的第二个元素是运算的结果。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Int16 <: CarryingOp<Int16>`](extensions/extend-int16-carryingop-int16.md) | 为 Int16 实现 CarryingOp 接口。 |
| [`extend Int32 <: CarryingOp<Int32>`](extensions/extend-int32-carryingop-int32.md) | 为 Int32 实现 CarryingOp 接口。 |
| [`extend Int64 <: CarryingOp<Int64> & CarryingPow`](extensions/extend-int64-carryingop-int64-carryingpow.md) | 为 Int64 实现 CarryingOp 接口和 CarryingPow 接口。 |
| [`extend Int8 <: CarryingOp<Int8>`](extensions/extend-int8-carryingop-int8.md) | 为 Int8 实现 CarryingOp 接口。 |
| [`extend IntNative <: CarryingOp<IntNative>`](extensions/extend-intnative-carryingop-intnative.md) | 为 IntNative 实现 CarryingOp 接口。 |
| [`extend UInt16 <: CarryingOp<UInt16>`](extensions/extend-uint16-carryingop-uint16.md) | 为 UInt16 实现 CarryingOp 接口。 |
| [`extend UInt32 <: CarryingOp<UInt32>`](extensions/extend-uint32-carryingop-uint32.md) | 为 UInt32 实现 CarryingOp 接口。 |
| [`extend UInt64 <: CarryingOp<UInt64>`](extensions/extend-uint64-carryingop-uint64.md) | 为 UInt64 实现 CarryingOp 接口。 |
| [`extend UInt8 <: CarryingOp<UInt8>`](extensions/extend-uint8-carryingop-uint8.md) | 为 UInt8 实现 CarryingOp 接口。 |
| [`extend UIntNative <: CarryingOp<UIntNative>`](extensions/extend-uintnative-carryingop-uintnative.md) | 为 UIntNative 实现 CarryingOp 接口。 |
