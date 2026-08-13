<!-- cj-doc kind="api-member" level="6" id="std.net.class.unixdatagramsocket.prop-localaddress" parent="std.net.class.unixdatagramsocket" -->
# UnixDatagramSocket.localAddress

[← UnixDatagramSocket](index.md)

## 签名

```cangjie role=signature
public override prop localAddress: SocketAddress
```

读取 `socket` 将要或已经绑定的本地地址。

## 契约

类型：SocketAddress

异常：

- SocketException - 当 `socket` 已经关闭时，抛出异常。
