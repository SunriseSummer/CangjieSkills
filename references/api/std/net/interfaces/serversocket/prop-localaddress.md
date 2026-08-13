<!-- cj-doc kind="api-member" level="6" id="std.net.interface.serversocket.prop-localaddress" parent="std.net.interface.serversocket" -->
# ServerSocket.localAddress

[← ServerSocket](index.md)

## 签名

```cangjie role=signature
prop localAddress: SocketAddress
```

读取 `Socket` 将要或已经被绑定的本地地址。

## 契约

类型：SocketAddress

异常：

- SocketException - 当 `Socket` 已经被关闭时，抛出异常。
