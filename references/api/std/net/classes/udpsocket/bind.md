<!-- cj-doc kind="api-member" level="6" id="std.net.class.udpsocket.bind" parent="std.net.class.udpsocket" -->
# UdpSocket.bind

[← UdpSocket](index.md)

## 签名

```cangjie role=signature
public func bind(): Unit
```

绑定本地端口失败后需要 `close` 套接字，不支持多次重试。

## 契约

异常：

- SocketException - 当因系统原因绑定失败时，抛出异常。
