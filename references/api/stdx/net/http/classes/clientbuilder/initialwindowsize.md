<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.clientbuilder.initialwindowsize" parent="stdx.net.http.class.clientbuilder" -->
# ClientBuilder.initialWindowSize

[← ClientBuilder](index.md)

## 签名

```cangjie role=signature
public func initialWindowSize(size: UInt32): ClientBuilder
```

配置客户端 HTTP/2 流控窗口初始值。

## 契约

参数：

- size: UInt32 - 默认值 65535 ， 取值范围为 0 至 2^31 - 1。

返回值：

- ClientBuilder - 当前 ClientBuilder 实例的引用。
