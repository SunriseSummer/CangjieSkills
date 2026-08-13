<!-- cj-doc kind="api-type" level="5" id="stdx.log.struct.loglevel" parent="stdx.log" -->
# LogLevel

[← stdx.log](../../index.md)

`LogLevel <: ToString & Comparable<LogLevel>`

LogLevel 为日志级别结构体。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`ALL: LogLevel = LogLevel("ALL", -0x8000_0000)`](field-all.md) | 获取一个日志打印级别的静态常量实例，等级为所有。 |
| [`DEBUG: LogLevel = LogLevel("DEBUG", 2000)`](field-debug.md) | 获取一个日志打印级别的静态常量实例，等级为调试。 |
| [`ERROR: LogLevel = LogLevel("ERROR", 5000)`](field-error.md) | 获取一个日志打印级别的静态常量实例，等级为错误。 |
| [`FATAL: LogLevel = LogLevel("FATAL", 6000)`](field-fatal.md) | 获取一个日志打印级别的静态常量实例，等级为严重错误。 |
| [`INFO: LogLevel = LogLevel("INFO", 3000)`](field-info.md) | 获取一个日志打印级别的静态常量实例，等级为通知。 |
| [`OFF: LogLevel = LogLevel("OFF", 0x7FFF_FFFF)`](field-off.md) | 获取一个日志打印级别的静态常量实例，等级为禁用。 |
| [`TRACE: LogLevel = LogLevel("TRACE", 1000)`](field-trace.md) | 获取一个日志打印级别的静态常量实例，等级为跟踪。 |
| [`WARN: LogLevel = LogLevel("WARN", 4000)`](field-warn.md) | 获取一个日志打印级别的静态常量实例，等级为警告。 |
| [`name: String`](field-name.md) | 日志级别名。 |
| [`value: Int32`](field-value.md) | 日志级别值。 |
| [`init(name: String, value: Int32)`](field-init-name.md) | 常量构造函数，创建 LogLevel 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`compare(rhs: LogLevel): Ordering`](compare.md) | 判断当前 LogLevel 类型实例与参数指向的 LogLevel 类型实例的大小关系。 |
| [`toString(): String`](tostring.md) | 获取日志级别对应的名称。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator ==(rhs: LogLevel): Bool`](operator-eq.md) | 比较日志级别高低。 |
| [`operator !=(rhs: LogLevel): Bool`](operator-ne.md) | 比较日志级别高低。 |
| [`operator >=(rhs: LogLevel): Bool`](operator-ge.md) | 比较日志级别高低。 |
| [`operator <=(rhs: LogLevel): Bool`](operator-le.md) | 比较日志级别高低。 |
| [`operator >(rhs: LogLevel): Bool`](operator-gt.md) | 比较日志级别高低。 |
| [`operator <(rhs: LogLevel): Bool`](operator-lt.md) | 比较日志级别高低。 |
