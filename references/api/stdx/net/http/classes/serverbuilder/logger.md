<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.serverbuilder.logger" parent="stdx.net.http.class.serverbuilder" -->
# ServerBuilder.logger

[← ServerBuilder](index.md)

## 签名

```cangjie role=signature
public func logger(logger: Logger): ServerBuilder
```

设定服务器的 logger，默认 logger 级别为 INFO，logger 内容将写入 标准输出。

## 契约

功能：设定服务器的 logger，默认 logger 级别为 INFO，logger 内容将写入 标准输出。

参数：

- logger: Logger - 需要是线程安全的，默认使用内置线程安全 logger。

返回值：

- ServerBuilder - 当前 ServerBuilder 的引用。
