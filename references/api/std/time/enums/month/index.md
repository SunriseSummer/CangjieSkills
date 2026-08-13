<!-- cj-doc kind="api-type" level="5" id="std.time.enum.month" parent="std.time" -->
# Month

[← std.time](../../index.md)

`Month <: ToString & Equatable<Month>`

Month 用以表示月份，表示一年中的某一月，提供了与 Int64 类型转换和计算，相等性判别以及获取枚举值的字符串表示的功能。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`April`](value-april.md) | 构造一个表示四月的 Month 实例。 |
| [`August`](value-august.md) | 构造一个表示八月的 Month 实例。 |
| [`December`](value-december.md) | 构造一个表示十二月的 Month 实例。 |
| [`February`](value-february.md) | 构造一个表示二月的 Month 实例。 |
| [`January`](value-january.md) | 构造一个表示一月的 Month 实例。 |
| [`July`](value-july.md) | 构造一个表示七月的 Month 实例。 |
| [`June`](value-june.md) | 构造一个表示六月的 Month 实例。 |
| [`March`](value-march.md) | 构造一个表示三月的 Month 实例。 |
| [`May`](value-may.md) | 构造一个表示五月的 Month 实例。 |
| [`November`](value-november.md) | 构造一个表示十一月的 Month 实例。 |
| [`October`](value-october.md) | 构造一个表示十月的 Month 实例。 |
| [`September`](value-september.md) | 构造一个表示九月的 Month 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static of(mon: Int64): Month`](of.md) | 获取参数 `mon` 对应 Month 类型实例。 |
| [`toInteger(): Int64`](tointeger.md) | 获取当前 Month 实例的整数表示，一月至十二月分别表示为 1 至 12。 |
| [`toString(): String`](tostring.md) | 返回当前 Month 实例的字符串表示，如 "January" 表示一月。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(r: Month): Bool`](operator-ne.md) | 判断当前 Month 实例和 `r` 是否不为同一个月。 |
| [`operator +(n: Int64): Month`](operator-add.md) | 计算基于当前日历月份 `n` 个月之后（n 为正数时）的日历月份。 |
| [`operator -(n: Int64): Month`](operator-sub.md) | 计算基于当前日历月份 `n` 个前之后（n 为正数时）的日历月份。 |
| [`operator ==(r: Month): Bool`](operator-eq.md) | 判断当前 Month 实例和 `r` 是否表示同一个月。 |
