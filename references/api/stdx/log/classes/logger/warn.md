<!-- cj-doc kind="api-member" level="6" id="stdx.log.class.logger.warn" parent="stdx.log.class.logger" -->
# Logger.warn

[← Logger](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func warn(String, Array<Attr>)

### 签名

```cangjie role=signature
public func warn(message: String, attrs: Array<Attr>): Unit
```

打印 WARN 级别的日志的便捷函数。

### 契约

参数：

- message: String - 日志消息。
- attrs: Array\<Attr> - 日志数据键值对。

## func warn(() -> String, Array<Attr>)

### 签名

```cangjie role=signature
public func warn(message: () -> String, attrs: Array<Attr>): Unit
```

打印 WARN 级别的日志的便捷函数。

### 契约

参数：

- message: () -> String - 日志消息。
- attrs: Array\<Attr> - 日志数据键值对。
