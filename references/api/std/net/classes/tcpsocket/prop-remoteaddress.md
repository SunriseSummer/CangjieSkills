<!-- cj-doc kind="api-member" level="6" id="std.net.class.tcpsocket.prop-remoteaddress" parent="std.net.class.tcpsocket" -->
# TcpSocket.remoteAddress

[← TcpSocket](index.md)

## 签名

```cangjie role=signature
public override prop remoteAddress: SocketAddress
```

读取 `Socket` 已经或将要连接的远端地址。

## 契约

类型：SocketAddress

异常：

- SocketException - 当 `Socket` 已经被关闭时，抛出异常。
