<!-- cj-doc kind="api-type" level="5" id="std.convert.interface.formattable" parent="std.convert" -->
# Formattable

[← std.convert](../../index.md)

`Formattable`

`format(fmt)` 使用 `[flags][width][.precision][specifier]` 格式化整数、浮点数和 Rune；`-` 左对齐，宽度默认右对齐，`.precision` 控制整数补零或浮点小数位。

## 关键契约

格式串结构为 `[flags][width][.precision][specifier]`：

- `-` 表示左对齐；未指定时在给定宽度内右对齐，`0` 用零补齐，`+` 总是显示符号，`#` 为二/八/十六进制添加前缀。
- 整数的 precision 表示最少数字位数，浮点数的 precision 表示小数位数。
- 整数 specifier 常用 `b`、`o`、`x`/`X`；浮点数常用 `e`/`E`、`f`/`F`、`g`/`G`。
- 这些成员由 `std.convert` 扩展提供，点调用前必须导入该包。

## 方法

| 签名 | 功能 |
|---|---|
| [`format(fmt: String): String`](format/index.md) | 根据格式化参数将当前实例格式化为对应格式的字符串。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Float16 <: Formattable`](extensions/extend-float16-formattable.md) | 为 Float16 扩展 Formattable 接口，以实现将 Float16 实例转换为格式化字符串。 |
| [`extend Float32 <: Formattable`](extensions/extend-float32-formattable.md) | 为 Float32 扩展 Formattable 接口，以实现将 Float32 实例转换为格式化字符串。 |
| [`extend Float64 <: Formattable`](extensions/extend-float64-formattable.md) | 为 Float64 扩展 Formattable 接口，以实现将 Float64 实例转换为格式化字符串。 |
| [`extend Int16 <: Formattable`](extensions/extend-int16-formattable.md) | 为 Int16 扩展 Formattable 接口，以实现将 Int16 实例转换为格式化字符串。 |
| [`extend Int32 <: Formattable`](extensions/extend-int32-formattable.md) | 为 Int32 扩展 Formattable 接口，以实现将 Int32 实例转换为格式化字符串。 |
| [`extend Int64 <: Formattable`](extensions/extend-int64-formattable.md) | 为 Int64 扩展 Formattable 接口，以实现将 Int64 实例转换为格式化字符串。 |
| [`extend Int8 <: Formattable`](extensions/extend-int8-formattable.md) | 为 Int8 扩展 Formattable 接口，以实现将 Int8 实例转换为格式化字符串。 |
| [`extend Rune <: Formattable`](extensions/extend-rune-formattable.md) | 为 Rune 扩展 Formattable 接口，以实现将 Rune 实例转换为格式化字符串。 |
| [`extend UInt16 <: Formattable`](extensions/extend-uint16-formattable.md) | 为 UInt16 扩展 Formattable 接口，以实现将 UInt16 实例转换为格式化字符串。 |
| [`extend UInt32 <: Formattable`](extensions/extend-uint32-formattable.md) | 为 UInt32 扩展 Formattable 接口，以实现将 UInt32 实例转换为格式化字符串。 |
| [`extend UInt64 <: Formattable`](extensions/extend-uint64-formattable.md) | 为 UInt64 扩展 Formattable 接口，以实现将 UInt64 实例转换为格式化字符串。 |
| [`extend UInt8 <: Formattable`](extensions/extend-uint8-formattable.md) | 为 UInt8 扩展 Formattable 接口，以实现将 UInt8 实例转换为格式化字符串。 |
