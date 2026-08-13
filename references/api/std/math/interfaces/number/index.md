<!-- cj-doc kind="api-type" level="5" id="std.math.interface.number" parent="std.math" -->
# Number<T>

[← std.math](../../index.md)

`Number<T>`

提供数值类型相关的方法。

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator *(rhs: T): T`](operator-mul.md) | 算术运算符，计算乘法。 |
| [`operator +(rhs: T): T`](operator-add.md) | 算术运算符，计算加法。 |
| [`operator -(): T`](operator-sub.md) | 算术运算符，计算取负的值。 |
| [`operator -(rhs: T): T`](operator-sub.md) | 算术运算符，计算减法。 |
| [`operator /(rhs: T): T`](operator-div.md) | 算术运算符，计算除法。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Float16 <: Number<Float16>`](extensions/extend-float16-number-float16.md) | 为 Float16 类型扩展 Number<T> 接口。 |
| [`extend Float32 <: Number<Float32>`](extensions/extend-float32-number-float32.md) | 为 Float32 类型扩展 Number<T> 接口。 |
| [`extend Float64 <: Number<Float64>`](extensions/extend-float64-number-float64.md) | 为 Float64 类型扩展 Number<T> 接口。 |
| [`extend Int16 <: Number<Int16>`](extensions/extend-int16-number-int16.md) | 为 Int16 类型扩展 Number<T> 接口。 |
| [`extend Int32 <: Number<Int32>`](extensions/extend-int32-number-int32.md) | 为 Int32 类型扩展 Number<T> 接口。 |
| [`extend Int64 <: Number<Int64>`](extensions/extend-int64-number-int64.md) | 为 Int64 类型扩展 Number<T> 接口。 |
| [`extend Int8 <: Number<Int8>`](extensions/extend-int8-number-int8.md) | 为 Int8 类型扩展 Number<T> 接口。 |
| [`extend IntNative <: Number<IntNative>`](extensions/extend-intnative-number-intnative.md) | 为 IntNative 类型扩展 Number<T> 接口。 |
| [`extend UInt16 <: Number<UInt16>`](extensions/extend-uint16-number-uint16.md) | 为 UInt16 类型扩展 Number<T> 接口。 |
| [`extend UInt32 <: Number<UInt32>`](extensions/extend-uint32-number-uint32.md) | 为 UInt32 类型扩展 Number<T> 接口。 |
| [`extend UInt64 <: Number<UInt64>`](extensions/extend-uint64-number-uint64.md) | 为 UInt64 类型扩展 Number<T> 接口。 |
| [`extend UInt8 <: Number<UInt8>`](extensions/extend-uint8-number-uint8.md) | 为 UInt8 类型扩展 Number<T> 接口。 |
| [`extend UIntNative <: Number<UIntNative>`](extensions/extend-uintnative-number-uintnative.md) | 为 UIntNative 类型扩展 Number<T> 接口。 |
