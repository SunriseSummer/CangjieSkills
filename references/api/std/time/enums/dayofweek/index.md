<!-- cj-doc kind="api-type" level="5" id="std.time.enum.dayofweek" parent="std.time" -->
# DayOfWeek

[← std.time](../../index.md)

`DayOfWeek <: ToString & Equatable<DayOfWeek>`

DayOfWeek 表示一周中的某一天，提供了与 Int64 类型转换，相等性判别以及获取枚举值的字符串表示的功能。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`Friday`](value-friday.md) | 构造一个表示周五的 DayOfWeek 实例。 |
| [`Monday`](value-monday.md) | 构造一个表示周一的 DayOfWeek 实例。 |
| [`Saturday`](value-saturday.md) | 构造一个表示周六的 DayOfWeek 实例。 |
| [`Sunday`](value-sunday.md) | 构造一个表示周日的 DayOfWeek 实例。 |
| [`Thursday`](value-thursday.md) | 构造一个表示周四的 DayOfWeek 实例。 |
| [`Tuesday`](value-tuesday.md) | 构造一个表示周二的 DayOfWeek 实例。 |
| [`Wednesday`](value-wednesday.md) | 构造一个表示周三的 DayOfWeek 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static of(dayOfWeek: Int64): DayOfWeek`](of.md) | 获取参数 `dayOfWeek` 对应的 DayOfWeek 实例。 |
| [`toInteger(): Int64`](tointeger.md) | 获取当前 DayOfWeek 实例的整数表示，周日表示为 0，周一至周六表示为 1 至 6。 |
| [`toString(): String`](tostring.md) | 返回当前 DayOfWeek 实例的字符串表示，如 "Monday" 表示周一。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(r: DayOfWeek): Bool`](operator-ne.md) | 判断当前 DayOfWeek 和 `r` 是否不为一周中的同一天。 |
| [`operator +(n: Int64): DayOfWeek`](operator-add.md) | 计算基于当前实例 `n` 天之后（n 为正数时）的表示值。 |
| [`operator -(n: Int64): DayOfWeek`](operator-sub.md) | 计算基于当前实例 `n` 天之前（n 为正数时）的表示值。 |
| [`operator ==(r: DayOfWeek): Bool`](operator-eq.md) | 判断当前 DayOfWeek 和 `r` 是否表示一周中的同一天。 |
