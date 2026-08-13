<!-- cj-doc kind="api-member" level="6" id="std.time.struct.datetime.of" parent="std.time.struct.datetime" -->
# DateTime.of

[← DateTime](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func of(Int64, Int64, Int64, Int64, Int64, Int64, Int64, TimeZone)

### 签名

```cangjie role=signature
public static func of(
    year!: Int64,
    month!: Int64,
    dayOfMonth!: Int64,
    hour!: Int64 = 0,
    minute!: Int64 = 0,
    second!: Int64 = 0,
    nanosecond!: Int64 = 0,
    timeZone!: TimeZone = TimeZone.Local
): DateTime
```

根据参数指定的年、月、日、时、分、秒、纳秒、时区构造 DateTime 实例。

### 契约

参数：

- year!: Int64 - 年，范围 [-999,999,999, 999,999,999]。
- month!: Int64 - 月，范围 [1, 12]。
- dayOfMonth!: Int64 - 日，范围 [1, 31]，最大取值需要跟 month 匹配，可能是 28、29、30、31。
- hour!: Int64 - 时，范围 [0, 23]。
- minute!: Int64 - 分，范围 [0, 59]。
- second!: Int64 - 秒，范围 [0, 59]。
- nanosecond!: Int64 - 纳秒，范围 [0, 999,999,999]。
- timeZone!: TimeZone - 时区。

返回值：

- DateTime - 根据指定参数构造的 DateTime 实例。

异常：

- IllegalArgumentException - 当参数值超出指定范围，抛出异常。

## static func of(Int64, Month, Int64, Int64, Int64, Int64, Int64, TimeZone)

### 签名

```cangjie role=signature
public static func of(
    year!: Int64,
    month!: Month,
    dayOfMonth!: Int64,
    hour!: Int64 = 0,
    minute!: Int64 = 0,
    second!: Int64 = 0,
    nanosecond!: Int64 = 0,
    timeZone!: TimeZone = TimeZone.Local
): DateTime
```

根据参数指定的年、月、日、时、分、秒、纳秒、时区构造 DateTime 实例。

### 契约

参数：

- year!: Int64 - 年，范围 [-999,999,999, 999,999,999]。
- month!: Month - 月，Month 类型。
- dayOfMonth!: Int64 - 日，范围 [1, 31]，最大取值需要跟 month 匹配，可能是 28、29、30、31。
- hour!: Int64 - 时，范围 [0, 23]。
- minute!: Int64 - 分，范围 [0, 59]。
- second!: Int64 - 秒，范围 [0, 59]。
- nanosecond!: Int64 - 纳秒，范围 [0, 999,999,999]。
- timeZone!: TimeZone - 时区。

返回值：

- DateTime - 根据指定参数构造的 DateTime 实例。

异常：

- IllegalArgumentException - 当参数值超出指定范围，抛出异常。
