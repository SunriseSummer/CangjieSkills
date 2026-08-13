<!-- cj-doc kind="api-package" level="4" id="std.time" parent="api.std" -->
# std.time

[← std 包索引](../index.md)

提供日期时间、时间间隔、单调时间、时区及其计算和比较。

包路径：`std.time`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`DateTimeFormat`](classes/datetimeformat/index.md) | 提供时间格式的功能，用于解析和生成 DateTime 。 |
| [`TimeZone <: ToString & Equatable<TimeZone>`](classes/timezone/index.md) | TimeZone 表示时区，记录了某一地区在不同时间较零时区的时间偏移，提供了从系统加载时区、自定义时区等功能。 |
| [`InvalidDataException <: Exception`](classes/invaliddataexception/index.md) | InvalidDataException 表示加载时区时的异常。 |
| [`TimeParseException <: Exception`](classes/timeparseexception/index.md) | TimeParseException 表示解析时间字符串时的异常。 |

## 结构体

| 声明 | 功能 |
|---|---|
| [`DateTime <: ToString & Hashable & Comparable<DateTime> & Formattable & Parsable<DateTime>`](structs/datetime/index.md) | DateTime 表示日期时间，是一个描述某一时间点的时间类型，提供了基于时区的日期时间读取、计算、比较、转换，以及序列化和反序列化等功能。 |
| [`MonoTime <: Hashable & Comparable<MonoTime>`](structs/monotime/index.md) | 单调时钟时间点，用于比较先后和测量经过时间；两个 `MonoTime` 相减得到 `Duration`，不会受系统日期、时区或校时影响。 |

## 枚举

| 声明 | 功能 |
|---|---|
| [`DayOfWeek <: ToString & Equatable<DayOfWeek>`](enums/dayofweek/index.md) | DayOfWeek 表示一周中的某一天，提供了与 Int64 类型转换，相等性判别以及获取枚举值的字符串表示的功能。 |
| [`Month <: ToString & Equatable<Month>`](enums/month/index.md) | Month 用以表示月份，表示一年中的某一月，提供了与 Int64 类型转换和计算，相等性判别以及获取枚举值的字符串表示的功能。 |
