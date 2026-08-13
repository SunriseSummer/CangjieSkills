<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.clientbuilder.connector" parent="stdx.net.http.class.clientbuilder" -->
# ClientBuilder.connector

[← ClientBuilder](index.md)

## 签名

```cangjie role=signature
public func connector(c: (SocketAddress) -> StreamingSocket): ClientBuilder
```

客户端调用此函数获取到服务器的连接。

## 契约

参数：

- c: (SocketAddress) ->StreamingSocket - 入参为 SocketAddress 实例，返回值类型为 StreamingSocket 的函数类型。

返回值：

- ClientBuilder - 当前 ClientBuilder 实例的引用。
