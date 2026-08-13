<!-- cj-doc kind="api-member" level="6" id="std.net.class.unixserversocket.prop-localaddress" parent="std.net.class.unixserversocket" -->
# UnixServerSocket.localAddress

[← UnixServerSocket](index.md)

## 签名

```cangjie role=signature
public override prop localAddress: SocketAddress
```

读取 `Socket` 将要或已经被绑定的本地地址。

## 契约

类型：SocketAddress

异常：

- SocketException - 当 `Socket` 已经被关闭时，抛出异常。
