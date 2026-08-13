<!-- cj-doc kind="api-type" level="5" id="stdx.log.class.logger" parent="stdx.log" -->
# Logger

[← stdx.log](../../index.md)

`abstract Logger <: Resource`

此抽象类提供基础的日志打印和管理功能。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`open mut level: LogLevel`](prop-level.md) | 获取和修改日志打印级别。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`debug(message: String, attrs: Array<Attr>): Unit`](debug.md) | 打印 DEBUG 级别的日志的便捷函数。 |
| [`debug(message: () -> String, attrs: Array<Attr>): Unit`](debug.md) | 打印 DEBUG 级别的日志的便捷函数。 |
| [`enabled(level: LogLevel): Bool`](enabled.md) | 确定是否记录指定日志级别的日志消息。 |
| [`error(message: String, attrs: Array<Attr>): Unit`](error.md) | 打印 ERROR 级别的日志的便捷函数。 |
| [`error(message: () -> String, attrs: Array<Attr>): Unit`](error.md) | 打印 ERROR 级别的日志的便捷函数。 |
| [`fatal(message: String, attrs: Array<Attr>): Unit`](fatal.md) | 打印 FATAL 级别的日志的便捷函数。 |
| [`fatal(message: () -> String, attrs: Array<Attr>): Unit`](fatal.md) | 打印 FATAL 级别的日志的便捷函数。 |
| [`info(message: String, attrs: Array<Attr>): Unit`](info.md) | 打印 INFO 级别的日志的便捷函数。 |
| [`info(message: () -> String, attrs: Array<Attr>): Unit`](info.md) | 打印 INFO 级别的日志的便捷函数。 |
| [`open log(level: LogLevel, message: String, attrs: Array<Attr>): Unit`](log.md) | 打印日志的通用函数，需指定日志级别。 |
| [`open log(level: LogLevel, message: () -> String, attrs: Array<Attr>): Unit`](log.md) | 打印日志的通用函数，需指定日志级别。 |
| [`open log(record: LogRecord): Unit`](log.md) | 打印日志的通用函数。 |
| [`trace(message: String, attrs: Array<Attr>): Unit`](trace.md) | 打印 TRACE 级别的日志的便捷函数。 |
| [`trace(message: () -> String, attrs: Array<Attr>): Unit`](trace.md) | 打印 TRACE 级别的日志的便捷函数。 |
| [`warn(message: String, attrs: Array<Attr>): Unit`](warn.md) | 打印 WARN 级别的日志的便捷函数。 |
| [`warn(message: () -> String, attrs: Array<Attr>): Unit`](warn.md) | 打印 WARN 级别的日志的便捷函数。 |
| [`open withAttrs(attrs: Array<Attr>): Logger`](withattrs.md) | 创建当前对象的副本，新的副本会包含指定的属性。 |
