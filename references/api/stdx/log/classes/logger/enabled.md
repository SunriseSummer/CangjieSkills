<!-- cj-doc kind="api-member" level="6" id="stdx.log.class.logger.enabled" parent="stdx.log.class.logger" -->
# Logger.enabled

[← Logger](index.md)

## 签名

```cangjie role=signature
public func enabled(level: LogLevel): Bool
```

确定是否记录指定日志级别的日志消息。

## 契约

这个函数允许调用者提前判断日志是否会被丢弃，以避免耗时的日志消息参数计算。

参数：

- level: LogLevel - 日志级别。

返回值：

- Bool - 如果指定的日志级别处于使能状态，则返回 `true`；否则，返回 `false`。
