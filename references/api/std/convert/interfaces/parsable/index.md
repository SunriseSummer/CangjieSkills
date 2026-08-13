<!-- cj-doc kind="api-type" level="5" id="std.convert.interface.parsable" parent="std.convert" -->
# Parsable<T>

[← std.convert](../../index.md)

`Parsable<T>`

本接口提供了统一的方法，以支持将字符串解析为特定类型。

## 方法

| 签名 | 功能 |
|---|---|
| [`static parse(value: String): T`](parse/index.md) | 从字符串中解析特定类型。 |
| [`static tryParse(value: String): Option<T>`](tryparse/index.md) | 从字符串中解析特定类型。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Bool <: Parsable<Bool>`](extensions/extend-bool-parsable-bool.md) | 此扩展主要用于实现将 Bool 类型字面量的字符串转换为 Bool 值的相关操作函数。 |
| [`extend Float16 <: Parsable<Float16>`](extensions/extend-float16-parsable-float16.md) | 此扩展主要用于实现将 Float16 类型字面量的字符串转换为 Float16 值的相关操作函数。 |
| [`extend Float32 <: Parsable<Float32>`](extensions/extend-float32-parsable-float32.md) | 此扩展主要用于实现将 Float32 类型字面量的字符串转换为 Float32 值的相关操作函数。 |
| [`extend Float64 <: Parsable<Float64>`](extensions/extend-float64-parsable-float64.md) | 此扩展主要用于实现将 Float64 类型字面量的字符串转换为 Float64 值的相关操作函数。 |
| [`extend Int16 <: Parsable<Int16>`](extensions/extend-int16-parsable-int16.md) | 此扩展主要用于实现将 Int16 类型字面量的字符串转换为 Int16 值的相关操作函数。 |
| [`extend Int32 <: Parsable<Int32>`](extensions/extend-int32-parsable-int32.md) | 此扩展主要用于实现将 Int32 类型字面量的字符串转换为 Int32 值的相关操作函数。 |
| [`extend Int64 <: Parsable<Int64>`](extensions/extend-int64-parsable-int64.md) | 此扩展主要用于实现将 Int64 类型字面量的字符串转换为 Int64 值的相关操作函数。 |
| [`extend Int8 <: Parsable<Int8>`](extensions/extend-int8-parsable-int8.md) | 此扩展主要用于实现将 Int8 类型字面量的字符串转换为 Int8 值的相关操作函数。 |
| [`extend Rune <: Parsable<Rune>`](extensions/extend-rune-parsable-rune.md) | 此扩展主要用于实现将 Rune 类型字面量的字符串转换为 Rune 值的相关操作函数。 |
| [`extend UInt16 <: Parsable<UInt16>`](extensions/extend-uint16-parsable-uint16.md) | 此扩展主要用于实现将 UInt16 类型字面量的字符串转换为 UInt16 值的相关操作函数。 |
| [`extend UInt32 <: Parsable<UInt32>`](extensions/extend-uint32-parsable-uint32.md) | 此扩展主要用于实现将 UInt32 类型字面量的字符串转换为 UInt32 值的相关操作函数。 |
| [`extend UInt64 <: Parsable<UInt64>`](extensions/extend-uint64-parsable-uint64.md) | 此扩展主要用于实现将 UInt64 类型字面量的字符串转换为 UInt64 值的相关操作函数。 |
| [`extend UInt8 <: Parsable<UInt8>`](extensions/extend-uint8-parsable-uint8.md) | 此扩展主要用于实现将 UInt8 类型字面量的字符串转换为 UInt8 值的相关操作函数。 |
