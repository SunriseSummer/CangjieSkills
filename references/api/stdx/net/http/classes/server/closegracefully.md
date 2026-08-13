<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.server.closegracefully" parent="stdx.net.http.class.server" -->
# Server.closeGracefully

[← Server](index.md)

## 签名

```cangjie role=signature
public func closeGracefully(): Unit
```

关闭服务器，服务器关闭后将不再对请求进行读取，当前正在进行处理的服务器待处理结束后进行关闭。
