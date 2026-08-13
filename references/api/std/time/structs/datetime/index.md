<!-- cj-doc kind="api-type" level="5" id="std.time.struct.datetime" parent="std.time" -->
# DateTime

[← std.time](../../index.md)

`DateTime <: ToString & Hashable & Comparable<DateTime> & Formattable & Parsable<DateTime>`

DateTime 表示日期时间，是一个描述某一时间点的时间类型，提供了基于时区的日期时间读取、计算、比较、转换，以及序列化和反序列化等功能。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`static UnixEpoch: DateTime`](prop-unixepoch.md) | 获取 Unix 时间纪元，即表示零时区 `1970 年 1 月 1 日 0 时 0 分 0 秒 0 纳秒` 的 DateTime 实例。 |
| [`date: (Int64, Month, Int64)`](prop-date.md) | 获取 DateTime 实例的年份、月份和当前月第几日。 |
| [`dayOfMonth: Int64`](prop-dayofmonth.md) | 获取 DateTime 实例基于当前月第几日。 |
| [`dayOfWeek: DayOfWeek`](prop-dayofweek.md) | 获取 DateTime 实例基于当前周的第几日。 |
| [`dayOfYear: Int64`](prop-dayofyear.md) | 获取 DateTime 实例基于当前年份的第几日。 |
| [`hour: Int64`](prop-hour.md) | 获取 DateTime 实例的小时。 |
| [`isoWeek: (Int64, Int64)`](prop-isoweek.md) | 获取 DateTime 实例基于 ISO8601 标准的年份和基于年的周数。 |
| [`minute: Int64`](prop-minute.md) | 获取 DateTime 实例的分钟。 |
| [`month: Month`](prop-month.md) | 获取 DateTime 实例的月份。 |
| [`nanosecond: Int64`](prop-nanosecond.md) | 获取 DateTime 实例的纳秒。 |
| [`second: Int64`](prop-second.md) | 获取 DateTime 实例的秒。 |
| [`time: (Int64, Int64, Int64)`](prop-time.md) | 获取 DateTime 实例的时、分、秒。 |
| [`year: Int64`](prop-year.md) | 获取 DateTime 实例的年份。 |
| [`zone: TimeZone`](prop-zone.md) | 获取 DateTime 实例所关联的时区。 |
| [`zoneId: String`](prop-zoneid.md) | 获取 DateTime 实例所关联的 TimeZone 实例的时区 ID。 |
| [`zoneOffset: Duration`](prop-zoneoffset.md) | 获取 DateTime 实例所关联的 TimeZone 实例的时间偏移。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static fromUnixTimeStamp(d: Duration): DateTime`](fromunixtimestamp.md) | 获取自 UnixEpoch 开始，参数 `d` 指定时间间隔后的日期时间。 |
| [`static now(timeZone!: TimeZone = TimeZone.Local): DateTime`](now.md) | 获取参数 `timeZone` 指定时区的当前时间。 |
| [`static nowUTC(): DateTime`](nowutc.md) | 获取 UTC 时区的当前时间。 |
| [`static of( year!: Int64, month!: Int64, dayOfMonth!: Int64, hour!: Int64 = 0, minute!: Int64 = 0, second!: Int64 = 0, nanosecond!: Int64 = 0, timeZone!: TimeZone = TimeZone.Local ): DateTime`](of.md) | 根据参数指定的年、月、日、时、分、秒、纳秒、时区构造 DateTime 实例。 |
| [`static of( year!: Int64, month!: Month, dayOfMonth!: Int64, hour!: Int64 = 0, minute!: Int64 = 0, second!: Int64 = 0, nanosecond!: Int64 = 0, timeZone!: TimeZone = TimeZone.Local ): DateTime`](of.md) | 根据参数指定的年、月、日、时、分、秒、纳秒、时区构造 DateTime 实例。 |
| [`static ofEpoch(second!: Int64, nanosecond!: Int64): DateTime`](ofepoch.md) | 根据入参 `second` 和 `nanosecond` 构造 DateTime 实例。 |
| [`static ofUTC( year!: Int64, month!: Int64, dayOfMonth!: Int64, hour!: Int64 = 0, minute!: Int64 = 0, second!: Int64 = 0, nanosecond!: Int64 = 0 ): DateTime`](ofutc.md) | 根据参数指定的年、月、日、时、分、秒、纳秒构造 `UTC` 时区 DateTime 实例。 |
| [`static ofUTC( year!: Int64, month!: Month, dayOfMonth!: Int64, hour!: Int64 = 0, minute!: Int64 = 0, second!: Int64 = 0, nanosecond!: Int64 = 0 ): DateTime`](ofutc.md) | 根据参数指定的年、月、日、时、分、秒、纳秒构造 `UTC` 时区 DateTime 实例。 |
| [`static parse(str: String): DateTime`](parse.md) | 从参数 `str` 中解析得到时间，解析成功时返回 DateTime 实例。 |
| [`static parse(str: String, format: String): DateTime`](parse.md) | 根据 `format` 指定的时间格式，从字符串 `str` 中解析得到时间，解析成功时返回 DateTime 实例。 |
| [`static tryParse(str: String): Option<DateTime>`](tryparse.md) | 从参数 `str` 中解析得到时间，解析成功时返回 Option<DateTime> 实例。 |
| [`addDays(n: Int64): DateTime`](adddays.md) | 获取 DateTime 实例 `n` 天之后的时间，返回新的 DateTime 实例。 |
| [`addHours(n: Int64): DateTime`](addhours.md) | 获取 DateTime 实例 `n` 小时之后的时间，返回新的 DateTime 实例。 |
| [`addMinutes(n: Int64): DateTime`](addminutes.md) | 获取 DateTime 实例 `n` 分钟之后的时间，返回新的 DateTime 实例。 |
| [`addMonths(n: Int64): DateTime`](addmonths.md) | 获取 DateTime 实例 `n` 月之后的时间，返回新的 DateTime 实例。 |
| [`addNanoseconds(n: Int64): DateTime`](addnanoseconds.md) | 获取 DateTime 实例 `n` 纳秒之后的时间，返回新的 DateTime 实例。 |
| [`addSeconds(n: Int64): DateTime`](addseconds.md) | 获取 DateTime 实例 `n` 秒之后的时间，返回新的 DateTime 实例。 |
| [`addWeeks(n: Int64): DateTime`](addweeks.md) | 获取 DateTime 实例 `n` 周之后的时间，返回新的 DateTime 实例。 |
| [`addYears(n: Int64): DateTime`](addyears.md) | 获取 DateTime 实例 `n` 年之后的时间，返回新的 DateTime 实例。 |
| [`compare(rhs: DateTime): Ordering`](compare.md) | 判断一个 DateTime 实例与参数 `rhs` 的大小关系。 |
| [`format(fmt: String): String`](format.md) | 返回一个表示 DateTime 实例的字符串，其格式由参数 `fmt` 指定。 |
| [`hashCode(): Int64`](hashcode.md) | 获取 DateTime 实例的哈希值。 |
| [`inLocal(): DateTime`](inlocal.md) | 获取 DateTime 实例在本地时区的时间。 |
| [`inTimeZone(timeZone: TimeZone): DateTime`](intimezone.md) | 获取 DateTime 实例在参数 `timeZone` 指定时区的时间。 |
| [`inUTC(): DateTime`](inutc.md) | 获取 DateTime 实例在 `UTC` 时区的时间。 |
| [`toString(): String`](tostring.md) | 返回一个表示 DateTime 实例的字符串，其格式为 `RFC3339` 中 `date-time` 格式，如果时间包含纳秒信息（不为零），会打印出小数秒。 |
| [`toUnixTimeStamp(): Duration`](tounixtimestamp.md) | 获取当前实例自 UnixEpoch 的时间间隔。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(r: DateTime): Bool`](operator-ne.md) | 判断当前 DateTime 实例是否不等于 `r`。 |
| [`operator +(r: Duration): DateTime`](operator-add.md) | 实现 DateTime 类型和 Duration 类型加法，即 DateTime + Duration 运算。 |
| [`operator -(r: DateTime): Duration`](operator-sub.md) | 实现 DateTime 类型之间的减法，即 DateTime - DateTime 运算。 |
| [`operator -(r: Duration): DateTime`](operator-sub.md) | 实现 DateTime 类型和 Duration 类型减法，即 DateTime - Duration 运算。 |
| [`operator <(r: DateTime): Bool`](operator-lt.md) | 判断当前 DateTime 实例是否早于 `r`（指向更早的 UTC 时间的 DateTime 更小）。 |
| [`operator <=(r: DateTime): Bool`](operator-le.md) | 判断当前 DateTime 实例是否早于或等于 `r`（指向更早的 UTC 时间的 DateTime 更小）。 |
| [`operator ==(r: DateTime): Bool`](operator-eq.md) | 判断当前 DateTime 实例是否等于 `r`。 |
| [`operator >(r: DateTime): Bool`](operator-gt.md) | 判断当前 DateTime 实例是否晚于 `r`（指向更晚的 UTC 时间的 DateTime 更大）。 |
| [`operator >=(r: DateTime): Bool`](operator-ge.md) | 判断当前 DateTime 实例是否晚于或等于 `r`（指向更晚的 UTC 时间的 DateTime 更大）。 |
