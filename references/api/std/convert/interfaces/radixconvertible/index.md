<!-- cj-doc kind="api-type" level="5" id="std.convert.interface.radixconvertible" parent="std.convert" -->
# RadixConvertible<T>

[← std.convert](../../index.md)

`RadixConvertible<T>`

本接口提供了统一的方法，以支持将指定进制的字符串解析为特定类型。

## 方法

| 签名 | 功能 |
|---|---|
| [`static parse(value: String, radix!: Int64): T`](parse.md) | 从指定进制字符串中解析特定类型。 |
| [`static tryParse(value: String, radix!: Int64): Option<T>`](tryparse.md) | 从指定进制字符串中解析特定类型。 |
| [`toString(radix!: Int64): String`](tostring.md) | 返回指定进制形式字符串。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Int16 <: RadixConvertible<Int16>`](extensions/extend-int16-radixconvertible-int16.md) | 此扩展主要用于实现将 Int16 类型字面量的字符串转换为 Int16 值的相关操作函数。 |
| [`extend Int32 <: RadixConvertible<Int32>`](extensions/extend-int32-radixconvertible-int32.md) | 此扩展主要用于实现将 Int32 类型字面量的字符串转换为 Int32 值的相关操作函数。 |
| [`extend Int64 <: RadixConvertible<Int64>`](extensions/extend-int64-radixconvertible-int64.md) | 此扩展主要用于实现将 Int64 类型字面量的字符串转换为 Int64 值的相关操作函数。 |
| [`extend Int8 <: RadixConvertible<Int8>`](extensions/extend-int8-radixconvertible-int8.md) | 此扩展主要用于实现将 Int8 类型字面量的字符串转换为 Int8 值的相关操作函数。 |
| [`extend UInt16 <: RadixConvertible<UInt16>`](extensions/extend-uint16-radixconvertible-uint16.md) | 此扩展主要用于实现将 UInt16 类型字面量的字符串转换为 UInt16 值的相关操作函数。 |
| [`extend UInt32 <: RadixConvertible<UInt32>`](extensions/extend-uint32-radixconvertible-uint32.md) | 此扩展主要用于实现将 UInt32 类型字面量的字符串转换为 UInt32 值的相关操作函数。 |
| [`extend UInt64 <: RadixConvertible<UInt64>`](extensions/extend-uint64-radixconvertible-uint64.md) | 此扩展主要用于实现将 UInt64 类型字面量的字符串转换为 UInt64 值的相关操作函数。 |
| [`extend UInt8 <: RadixConvertible<UInt8>`](extensions/extend-uint8-radixconvertible-uint8.md) | 此扩展主要用于实现将 UInt8 类型字面量的字符串转换为 UInt8 值的相关操作函数。 |
