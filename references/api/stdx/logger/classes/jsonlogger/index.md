<!-- cj-doc kind="api-type" level="5" id="stdx.logger.class.jsonlogger" parent="stdx.logger" -->
# JsonLogger

[← stdx.logger](../../index.md)

`JsonLogger <: Logger`

此类实现了输出 `JSON` 格式的日志打印功能，形如 `{"time":"2024-07-27T11:51:59+08:00","level":"INFO","msg":"foo","name":"bar"}`。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(output: OutputStream)`](init.md) | 创建 JsonLogger 对象。 |

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut level: LogLevel`](prop-level.md) | 获取和修改日志打印级别。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`close(): Unit`](close.md) | 关闭 Logger。 |
| [`isClosed(): Bool`](isclosed.md) | 判断当前 Logger 是否关闭。 |
| [`log(record: LogRecord): Unit`](log.md) | 打印日志的通用函数。 |
| [`withAttrs(attrs: Array<Attr>): Logger`](withattrs.md) | 创建当前对象的副本，新的副本会包含指定的属性。 |
