<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.class.tlssocket.prop-socket" parent="stdx.net.tls.class.tlssocket" -->
# TlsSocket.socket

[← TlsSocket](index.md)

## 签名

```cangjie role=signature
public prop socket: StreamingSocket
```

TlsSocket 创建所使用的 StreamingSocket。

## 契约

类型：StreamingSocket

异常：

- TlsException - 本端配置为 TLS 套接字已关闭时，抛出异常。
