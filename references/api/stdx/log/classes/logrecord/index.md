<!-- cj-doc kind="api-type" level="5" id="stdx.log.class.logrecord" parent="stdx.log" -->
# LogRecord

[← stdx.log](../../index.md)

`LogRecord`

日志消息的“负载”。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(time: DateTime, level: LogLevel, msg: String, attrs: Array<Attr>)`](init.md) | 创建一个 LogRecord 实例，指定时间戳，日志打印级别，日志消息和日志数据键值对。 |

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut attrs: Array<Attr>`](prop-attrs.md) | 获取或设置日志数据键值对。 |
| [`level: LogLevel`](prop-level.md) | 获取日志打印级别，只有级别小于等于该值的日志会被打印。 |
| [`mut message: String`](prop-message.md) | 获取或设置日志消息。 |
| [`time: DateTime`](prop-time.md) | 获取日志打印时的时间戳。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`clone(): LogRecord`](clone.md) | 创建当前对象的副本。 |
