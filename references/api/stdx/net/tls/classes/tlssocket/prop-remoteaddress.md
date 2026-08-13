<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.class.tlssocket.prop-remoteaddress" parent="stdx.net.tls.class.tlssocket" -->
# TlsSocket.remoteAddress

[← TlsSocket](index.md)

## 签名

```cangjie role=signature
public override prop remoteAddress: SocketAddress
```

读取 TlsSocket 的远端地址。

## 契约

类型：SocketAddress

异常：

- SocketException - 本端建连的底层 TCP 套接字关闭，抛出异常。
- TlsException - 本端配置为 TLS 的套接字已关闭时，抛出异常。
