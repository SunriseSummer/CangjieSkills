# 仓颉语言时间日期 Skill

## 1. DateTime

- 来自 `std.time.*`
- 不可变的日期时间类型，携带时区信息

| 构造/静态方法 | 说明 |
|--------------|------|
| `DateTime.now()` | 获取当前时间 |
| `DateTime.of(year:, month:, dayOfMonth:, hour:, minute:, second:, nanosecond:, timeZone:)` | 从各分量构造 |
| `DateTime.parse(string, pattern)` | 从字符串解析 |

| 属性 | 类型/说明 |
|------|----------|
| `year`, `dayOfMonth`, `hour`, `minute`, `second`, `nanosecond`, `dayOfYear` | Int64 |
| `month` | `Month` 枚举 |
| `dayOfWeek` | `DayOfWeek` 枚举 |
| `zoneId`, `zoneOffset` | 时区标识与偏移 |
| `isoWeek` | 返回 `(year, week)` 元组 |

| 方法 | 说明 |
|------|------|
| `format(fmt: String): String` | 按模式格式化为字符串 |
| `inUTC(): DateTime` | 转换为 UTC |
| `inTimeZone(timeZone: TimeZone): DateTime` | 转换到指定时区 |
| `addYears(n: Int64): DateTime` / `addMonths(n: Int64): DateTime` / `addDays(n: Int64): DateTime` | 日期算术 |
| `addHours(n: Int64): DateTime` / `addMinutes(n: Int64): DateTime` / `addSeconds(n: Int64): DateTime` / `addNanoseconds(n: Int64): DateTime` | 时间算术 |
| `toString(): String` | 返回 ISO 8601 格式字符串 |

- 支持比较：`==`, `!=`, `<`, `>`, `<=`, `>=`

```cangjie
package test_proj
import std.time.*

main() {
    let datetime = DateTime.of(
        year: 2024, month: May, dayOfMonth: 22,
        hour: 12, minute: 34, second: 56,
        nanosecond: 789000000,
        timeZone: TimeZone.load("Asia/Shanghai")
    )
    println("year=${datetime.year}, month=${datetime.month}, day=${datetime.dayOfMonth}")
    println("hour=${datetime.hour}, min=${datetime.minute}, sec=${datetime.second}")
    println("dayOfWeek=${datetime.dayOfWeek}, dayOfYear=${datetime.dayOfYear}")
    println("toString: ${datetime}")
}
```

---

## 2. 格式化与解析

| 模式符号 | 说明 | 示例 |
|---------|------|------|
| `yyyy` | 4 位年份 | 2024 |
| `MM` | 2 位月份 | 05 |
| `dd` | 2 位日期 | 22 |
| `HH` | 24 小时制 | 12 |
| `mm` | 分钟 | 34 |
| `ss` | 秒 | 56 |
| `SSS` / `SSSSSSSSS` | 亚秒（毫秒/纳秒） | 789 |
| `OO` | 时区偏移 | +08:00 |
| `z` | 时区名称 | CST |

```cangjie
package test_proj
import std.time.*

main() {
    let pattern = "yyyy/MM/dd HH:mm:ssSSS OO"
    let datetime = DateTime.of(year: 2024, month: May, dayOfMonth: 22,
        hour: 12, minute: 34, second: 56, nanosecond: 789000000,
        timeZone: TimeZone.load("Asia/Shanghai"))
    let str = datetime.format(pattern)
    println(str)                            // 2024/05/22 12:34:56789 +08:00
    println(DateTime.parse(str, pattern))   // 解析回 DateTime
}
```

---

## 3. 时区转换

| API | 说明 |
|-----|------|
| `TimeZone.Local` | 本地时区 |
| `TimeZone.UTC` | UTC 时区 |
| `TimeZone.load(id: String): TimeZone` | 按 IANA 名称加载时区 |
| `datetime.inUTC(): DateTime` | 转为 UTC |
| `datetime.inTimeZone(timeZone: TimeZone): DateTime` | 转为指定时区 |

```cangjie
package test_proj
import std.time.*

main() {
    let datetime = DateTime.of(year: 2024, month: May, dayOfMonth: 22, hour: 12,
        timeZone: TimeZone.load("Asia/Shanghai"))
    println("CST: ${datetime}")
    println("UTC: ${datetime.inUTC()}")
    println("EDT: ${datetime.inTimeZone(TimeZone.load("America/New_York"))}")
}
```

---

## 4. MonoTime — 单调时钟

- 用于精确测量时间间隔，不受系统时钟调整影响
- `MonoTime.now()` 获取当前单调时钟
- 两个 `MonoTime` 相减得到 `Duration`

```cangjie
package test_proj
import std.time.*

const count = 10000

main() {
    let start = MonoTime.now()
    for (_ in 0..count) {
        DateTime.now()
    }
    let end = MonoTime.now()
    let result = end - start
    println("total cost: ${result.toNanoseconds()}ns")
}
```

---

## 5. Duration（来自 core 包）

- `Duration` 在 `std.core` 中，自动导入无需额外 import
- 常量：`Duration.second`、`Duration.millisecond`、`Duration.nanosecond` 等
- 支持算术：`+`、`-`、`*`

| 方法 | 说明 |
|------|------|
| `toNanoseconds()` | 转换为纳秒 |
| `toMicroseconds()` | 转换为微秒 |
| `toMilliseconds()` | 转换为毫秒 |
| `toSeconds()` | 转换为秒 |

---

## 6. 枚举类型（Month, DayOfWeek）

| 枚举 | 值 |
|------|---|
| `Month` | `January`(`Jan`) ~ `December`(`Dec`) |
| `DayOfWeek` | `Sunday` ~ `Saturday` |

- **注意**：在代码中直接使用裸标识符，如 `May`，而非 `Month.May`

---

## 7. 异常类型

| 异常 | 说明 |
|------|------|
| `InvalidDataException` | 解析格式不匹配或数据无效 |
| `TimeZoneNotFoundException` | 时区名称无法识别 |

---

## 8. 关键规则速查

1. `DateTime` 不可变，所有修改方法返回新实例
2. `Month` 枚举用裸标识符：`May` 而非 `Month.May`
3. `MonoTime` 用于性能测量，不受系统时钟调整影响
4. `Duration` 来自 `std.core`，自动导入，无需 import
5. `format` / `parse` 的模式字符串必须一致才能互相转换
6. `TimeZone.load` 使用 IANA 时区名称（如 `"Asia/Shanghai"`）
7. 时区转换不改变绝对时刻，只改变显示的本地时间
