<!-- cj-doc kind="api-member" level="6" id="std.net.class.udpsocket.prop-remoteaddress" parent="std.net.class.udpsocket" -->
# UdpSocket.remoteAddress

[← UdpSocket](index.md)

## 签名

```cangjie role=signature
public override prop remoteAddress: ?SocketAddress
```

读取 `Socket` 已经连接的远端地址，当 `Socket` 未连接时返回 `None`。

## 契约

类型：?SocketAddress

异常：

- SocketException - 当 `Socket` 已经被关闭时，抛出异常。
