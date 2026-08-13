<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.serverbuilder.httpkeepalivetimeout" parent="stdx.net.http.class.serverbuilder" -->
# ServerBuilder.httpKeepAliveTimeout

[← ServerBuilder](index.md)

## 签名

```cangjie role=signature
public func httpKeepAliveTimeout(timeout: Duration): ServerBuilder
```

HTTP/1.1 专用，设定服务端连接保活时长，该时长内客户端未再次发送请求，服务端将关闭长连接，默认不进行限制。

## 契约

参数：

- timeout: Duration - 设定保持长连接的超时时间，如果传入负的 Duration 将被替换为 Duration.Zero。

返回值：

- ServerBuilder - 当前 ServerBuilder 的引用。
