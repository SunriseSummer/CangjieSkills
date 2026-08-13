<!-- cj-doc kind="api-type" level="5" id="std.math.interface.integer" parent="std.math" -->
# Integer<T>

[← std.math](../../index.md)

`Integer<T> <: Number<T>`

本接口提供了整数类型相关的方法。

## 方法

| 签名 | 功能 |
|---|---|
| [`static isSigned(): Bool`](issigned.md) | 判断类型是否是有符号的。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !(): T`](operator-not.md) | 位运算符，按位取反。 |
| [`operator %(rhs: T): T`](operator-mod.md) | 算术运算符，计算余数。 |
| [`operator &(rhs: T): T`](operator-bitand.md) | 位运算符，按位与。 |
| [`operator <<(n: Int64): T`](operator-shl.md) | 位运算符，按位左移。 |
| [`operator >>(n: Int64): T`](operator-shr.md) | 位运算符，按位右移。 |
| [`operator ^(rhs: T): T`](operator-bitxor.md) | 位运算符，按位异或。 |
| [`operator \|(rhs: T): T`](operator-bitor.md) | 位运算符，按位或。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Int16 <: Integer<Int16>`](extensions/extend-int16-integer-int16.md) | 为 Int16 类型扩展 Integer<T> 接口。 |
| [`extend Int32 <: Integer<Int32>`](extensions/extend-int32-integer-int32.md) | 为 Int32 类型扩展 Integer<T> 接口。 |
| [`extend Int64 <: Integer<Int64>`](extensions/extend-int64-integer-int64.md) | 为 Int64 类型扩展 Integer<T> 接口。 |
| [`extend Int8 <: Integer<Int8>`](extensions/extend-int8-integer-int8.md) | 为 Int8 类型扩展 Integer<T> 接口。 |
| [`extend IntNative <: Integer<IntNative>`](extensions/extend-intnative-integer-intnative.md) | 为 IntNative 类型扩展 Integer<T> 接口。 |
| [`extend UInt16 <: Integer<UInt16>`](extensions/extend-uint16-integer-uint16.md) | 为 UInt16 类型扩展 Integer<T> 接口。 |
| [`extend UInt32 <: Integer<UInt32>`](extensions/extend-uint32-integer-uint32.md) | 为 UInt32 类型扩展 Integer<T> 接口。 |
| [`extend UInt64 <: Integer<UInt64>`](extensions/extend-uint64-integer-uint64.md) | 为 UInt64 类型扩展 Integer<T> 接口。 |
| [`extend UInt8 <: Integer<UInt8>`](extensions/extend-uint8-integer-uint8.md) | 为 UInt8 类型扩展 Integer<T> 接口。 |
| [`extend UIntNative <: Integer<UIntNative>`](extensions/extend-uintnative-integer-uintnative.md) | 为 UIntNative 类型扩展 Integer<T> 接口。 |
