<!-- cj-doc kind="api-type" level="5" id="std.time.class.timezone" parent="std.time" -->
# TimeZone

[← std.time](../../index.md)

`TimeZone <: ToString & Equatable<TimeZone>`

TimeZone 表示时区，记录了某一地区在不同时间较零时区的时间偏移，提供了从系统加载时区、自定义时区等功能。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`Local: TimeZone`](field-local.md) | 获取本地时区。 |
| [`UTC: TimeZone`](field-utc.md) | 获取 UTC 时区。 |
| [`id: String`](prop-id.md) | 获取当前 TimeZone 实例所关联的时区 ID。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(id: String, offset: Duration)`](init.md) | 使用指定的时区 ID 和偏移量构造一个自定义 TimeZone 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static load(id: String): TimeZone`](load.md) | 从系统中加载参数 `id` 指定的时区。 |
| [`static loadFromPaths(id: String, tzpaths: Array<String>): TimeZone`](loadfrompaths.md) | 根据参数 `tzpaths` 指定的时区文件目录，加载参数 `id` 指定的时区。 |
| [`static loadFromTZData(id: String, data: Array<UInt8>): TimeZone`](loadfromtzdata.md) | 使用指定的时区 ID 和时区数据构造一个自定义 TimeZone 实例。 |
| [`toString(): String`](tostring.md) | 获取本 TimeZone 实例时区 ID 的字符串表示。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(r: TimeZone): Bool`](operator-ne.md) | 判断当前 TimeZone 实例的引用是否不等于 `r` 的引用。 |
| [`operator ==(r: TimeZone): Bool`](operator-eq.md) | 判断当前 TimeZone 实例的引用是否等于 `r` 的引用。 |
