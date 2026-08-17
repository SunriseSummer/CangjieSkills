<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.common.interface.tlsconnection.handshake" parent="stdx.net.tls.common.interface.tlsconnection" -->
# TlsConnection.handshake

[← TlsConnection](index.md)

## 签名

```cangjie role=signature
func handshake(timeout!: ?Duration): TlsHandshakeResult
```

进行 TLS 握手，返回握手结果。

## 参数

- timeout!: ?Duration - 握手超时时间。

## 返回值

- TlsHandshakeResult - 握手结果。

