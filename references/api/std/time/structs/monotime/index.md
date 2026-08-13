<!-- cj-doc kind="api-type" level="5" id="std.time.struct.monotime" parent="std.time" -->
# MonoTime

[← std.time](../../index.md)

`MonoTime <: Hashable & Comparable<MonoTime>`

单调时钟时间点，用于比较先后和测量经过时间；两个 `MonoTime` 相减得到 `Duration`，不会受系统日期、时区或校时影响。

## 方法

| 签名 | 功能 |
|---|---|
| [`static now(): MonoTime`](now.md) | 获取与当前时间对应的 MonoTime。 |
| [`compare(rhs: MonoTime): Ordering`](compare.md) | 判断一个 MonoTime 实例与参数 `rhs` 的大小关系。 |
| [`hashCode(): Int64`](hashcode.md) | 获取当前 MonoTime 实例的哈希值。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(r: MonoTime): Bool`](operator-ne.md) | 判断当前 MonoTime 实例是否不等于 `r`。 |
| [`operator +(r: Duration): MonoTime`](operator-add.md) | 实现 MonoTime 类型和 Duration 类型加法，即 MonoTime + Duration 运算。 |
| [`operator -(r: Duration): MonoTime`](operator-sub.md) | 实现 MonoTime 类型和 Duration 类型减法，即 MonoTime - Duration 运算。 |
| [`operator -(r: MonoTime): Duration`](operator-sub.md) | 实现 MonoTime 类型之间的减法，即 MonoTime - MonoTime 运算。 |
| [`operator <(r: MonoTime): Bool`](operator-lt.md) | 判断当前 MonoTime 实例是否早于 `r`。 |
| [`operator <=(r: MonoTime): Bool`](operator-le.md) | 判断当前 MonoTime 实例是否早于或等于 `r`。 |
| [`operator ==(r: MonoTime): Bool`](operator-eq.md) | 判断当前 MonoTime 实例是否等于 `r`。 |
| [`operator >(r: MonoTime): Bool`](operator-gt.md) | 判断当前 MonoTime 实例是否晚于 `r`。 |
| [`operator >=(r: MonoTime): Bool`](operator-ge.md) | 判断当前 MonoTime 实例是否晚于或等于 `r`。 |
