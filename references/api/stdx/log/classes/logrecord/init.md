<!-- cj-doc kind="api-member" level="6" id="stdx.log.class.logrecord.init" parent="stdx.log.class.logrecord" -->
# LogRecord.init

[← LogRecord](index.md)

## 签名

```cangjie role=signature
public init(time: DateTime, level: LogLevel, msg: String, attrs: Array<Attr>)
```

创建一个 LogRecord 实例，指定时间戳，日志打印级别，日志消息和日志数据键值对。

## 契约

参数：

- time: DateTime - 记录日志时的时间戳
- level: LogLevel - 日志级别。
- msg: String - 日志消息。
- attrs: Array\<Attr> - 日志数据键值对。
