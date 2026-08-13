<!-- cj-doc kind="api-member" level="6" id="std.net.interface.streamingsocket.prop-remoteaddress" parent="std.net.interface.streamingsocket" -->
# StreamingSocket.remoteAddress

[← StreamingSocket](index.md)

## 签名

```cangjie role=signature
prop remoteAddress: SocketAddress
```

读取 `Socket` 将要或已经连接的远端地址。

## 契约

类型：SocketAddress

异常：

- SocketException - 当 `Socket` 已经被关闭时，抛出异常。
