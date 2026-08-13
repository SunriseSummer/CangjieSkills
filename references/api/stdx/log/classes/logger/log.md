<!-- cj-doc kind="api-member" level="6" id="stdx.log.class.logger.log" parent="stdx.log.class.logger" -->
# Logger.log

[← Logger](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## func log(LogLevel, String, Array<Attr>)

### 签名

```cangjie role=signature
public open func log(level: LogLevel, message: String, attrs: Array<Attr>): Unit
```

打印日志的通用函数，需指定日志级别。

### 契约

参数：

- level: LogLevel - 日志级别。
- message: String - 日志消息。
- attrs: Array\<Attr> - 日志数据键值对。

## func log(LogLevel, () -> String, Array<Attr>)

### 签名

```cangjie role=signature
public open func log(level: LogLevel, message: () -> String, attrs: Array<Attr>): Unit
```

打印日志的通用函数，需指定日志级别。

### 契约

参数：

- level: LogLevel - 日志级别。
- message: () -> String - 日志消息。
- attrs: Array\<Attr> - 日志数据键值对。

## func log(LogRecord)

### 签名

```cangjie role=signature
public open func log(record: LogRecord): Unit
```

打印日志的通用函数。

### 契约

参数：

- record: LogRecord - 日志级别。
