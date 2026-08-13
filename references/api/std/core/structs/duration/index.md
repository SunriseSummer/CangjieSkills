<!-- cj-doc kind="api-type" level="5" id="std.core.struct.duration" parent="std.core" -->
# Duration

[← std.core](../../index.md)

`Duration <: ToString & Hashable & Comparable<Duration>`

Duration 表示时间间隔，是一个描述一段时间的时间类型，提供了常用的静态实例，以及计算、比较等功能。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`day: Duration = Duration(24 * 60 * 60, 0)`](field-day.md) | 表示 1 天时间间隔的 Duration 实例。 |
| [`hour: Duration = Duration(60 * 60, 0)`](field-hour.md) | 表示 1 小时时间间隔的 Duration 实例。 |
| [`Max: Duration = Duration(0x7FFF_FFFF_FFFF_FFFF, 999999999)`](field-max.md) | 表示最大时间间隔的 Duration 实例。 |
| [`microsecond: Duration = Duration(0, 1000u32)`](field-microsecond.md) | 表示 1 微秒时间间隔的 Duration 实例。 |
| [`millisecond: Duration = Duration(0, 1000000u32)`](field-millisecond.md) | 表示 1 毫秒时间间隔的 Duration 实例。 |
| [`Min: Duration = Duration(-0x8000_0000_0000_0000, 0)`](field-min.md) | 表示最小时间间隔的 Duration 实例。 |
| [`minute: Duration = Duration(60, 0)`](field-minute.md) | 表示 1 分钟时间间隔的 Duration 实例。 |
| [`nanosecond: Duration = Duration(0, 1)`](field-nanosecond.md) | 表示 1 纳秒时间间隔的 Duration 实例。 |
| [`second: Duration = Duration(1, 0)`](field-second.md) | 表示 1 秒时间间隔的 Duration 实例。 |
| [`Zero: Duration = Duration(0, 0)`](field-zero.md) | 表示 0 纳秒时间间隔的 Duration 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`abs(): Duration`](abs.md) | 返回一个新的 Duration 实例，其值大小为当前 Duration 实例绝对值。 |
| [`compare(rhs: Duration): Ordering`](compare.md) | 比较当前 Duration 实例与另一个 Duration 实例的关系，如果大于，返回 Ordering.GT；如果等于，返回 Ordering.EQ；如果小于，返回 Ordering.LT。 |
| [`hashCode(): Int64`](hashcode.md) | 获得当前 Duration 实例的哈希值。 |
| [`toDays(): Int64`](todays.md) | 获得当前 Duration 实例以天为单位的整数大小。 |
| [`toHours(): Int64`](tohours.md) | 获得当前 Duration 实例以小时为单位的整数大小。 |
| [`toMicroseconds(): Int64`](tomicroseconds.md) | 获得当前 Duration 实例以微秒为单位的整数大小。 |
| [`toMilliseconds(): Int64`](tomilliseconds.md) | 获得当前 Duration 实例以毫秒为单位的整数大小。 |
| [`toMinutes(): Int64`](tominutes.md) | 获得当前 Duration 实例以分钟为单位的整数大小。 |
| [`toNanoseconds(): Int64`](tonanoseconds.md) | 获得当前 Duration 实例以纳秒为单位的整数大小，向绝对值小的方向取整。 |
| [`toSeconds(): Int64`](toseconds.md) | 获得当前 Duration 实例以秒为单位的整数大小。 |
| [`toString(): String`](tostring.md) | 获得当前 Duration 实例的字符串表示，格式形如："1d2h3m4s5ms6us7ns"，表示“1 天 2 小时 3 分钟 4 秒 5 毫秒 6 微秒 7 纳秒”。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(r: Duration): Bool`](operator-ne.md) | 判断当前 Duration 实例是否不等于 `r`。 |
| [`operator *(r: Float64): Duration`](operator-mul.md) | 实现 Duration 类型与 Float64 类型的乘法，即 Duration * Float64 运算。 |
| [`operator *(r: Int64): Duration`](operator-mul.md) | 实现 Duration 类型与 Int64 类型的乘法，即 Duration * Int64 运算。 |
| [`operator +(r: Duration): Duration`](operator-add.md) | 实现 Duration 类型之间的加法，即 Duration + Duration 运算。 |
| [`operator -(r: Duration): Duration`](operator-sub.md) | 实现 Duration 类型之间的减法，即 Duration - Duration 运算。 |
| [`operator /(r: Duration): Float64`](operator-div.md) | 实现 Duration 类型与 Duration 类型的除法，即 Duration / Duration 运算。 |
| [`operator /(r: Float64): Duration`](operator-div.md) | 实现 Duration 类型与 Float64 类型的除法，即 Duration / Float64 运算。 |
| [`operator /(r: Int64): Duration`](operator-div.md) | 实现 Duration 类型与 Int64 类型的除法，即 Duration / Int64 运算。 |
| [`operator <(r: Duration): Bool`](operator-lt.md) | 判断当前 Duration 实例是否小于 `r`。 |
| [`operator <=(r: Duration): Bool`](operator-le.md) | 判断当前 Duration 实例是否小于等于 `r`。 |
| [`operator ==(r: Duration): Bool`](operator-eq.md) | 判断当前 Duration 实例是否等于 `r`。 |
| [`operator >(r: Duration): Bool`](operator-gt.md) | 判断当前 Duration 实例是否大于 `r`。 |
| [`operator >=(r: Duration): Bool`](operator-ge.md) | 判断当前 Duration 实例是否大于等于 `r`。 |
