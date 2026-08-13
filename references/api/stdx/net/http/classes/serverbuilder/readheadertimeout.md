<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.serverbuilder.readheadertimeout" parent="stdx.net.http.class.serverbuilder" -->
# ServerBuilder.readHeaderTimeout

[← ServerBuilder](index.md)

## 签名

```cangjie role=signature
public func readHeaderTimeout(timeout: Duration): ServerBuilder
```

设定服务端读取客户端发送一个请求的请求头最大时长，超过该时长将不再进行读取并关闭连接，默认不进行限制。

## 契约

参数：

- timeout: Duration - 设定的读请求头超时时间，如果传入负的 Duration 将被替换为 Duration.Zero。

返回值：

- ServerBuilder - 当前 ServerBuilder 的引用。
