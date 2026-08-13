<!-- cj-doc kind="api-member" level="6" id="std.net.interface.streamingsocket.prop-localaddress" parent="std.net.interface.streamingsocket" -->
# StreamingSocket.localAddress

[← StreamingSocket](index.md)

## 签名

```cangjie role=signature
prop localAddress: SocketAddress
```

读取 `Socket` 将要或已经被绑定的本地地址。

## 契约

类型：SocketAddress

异常：

- SocketException - 当 `Socket` 已经被关闭或无可用的本地地址（本地地址未配置并且套接字未连接）时，抛出异常。
