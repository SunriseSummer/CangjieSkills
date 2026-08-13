<!-- cj-doc kind="api-type" level="5" id="stdx.log.class.nooplogger" parent="stdx.log" -->
# NoopLogger

[← stdx.log](../../index.md)

`NoopLogger <: Logger`

Logger 的 NO-OP（无操作）实现，会丢弃所有的日志。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 创建一个 NoopLogger 实例。 |

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut level: LogLevel`](prop-level.md) | 永远只能获取到 OFF 日志打印级别，设置日志打印级别不会生效。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`close(): Unit`](close.md) | NOOP 实现。 |
| [`isClosed(): Bool`](isclosed.md) | NOOP 实现。 |
| [`log(level: LogLevel, message: String, attrs: Array<Attr>): Unit`](log.md) | NOOP 实现。 |
| [`log(level: LogLevel, message: () -> String, attrs: Array<Attr>): Unit`](log.md) | NOOP 实现。 |
| [`log(record: LogRecord): Unit`](log.md) | NOOP 实现。 |
| [`withAttrs(attrs: Array<Attr>): Logger`](withattrs.md) | NOOP 实现。 |
