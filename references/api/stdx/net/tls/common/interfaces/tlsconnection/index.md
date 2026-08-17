<!-- cj-doc kind="api-type" level="5" id="stdx.net.tls.common.interface.tlsconnection" parent="stdx.net.tls.common" -->
# TlsConnection

[← stdx.net.tls.common](../../index.md)

`interface TlsConnection <: StreamingSocket`

TLS 连接接口，用于适配不同的 TLS 实现。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`prop handshakeResult: ?TlsHandshakeResult`](prop-handshakeresult.md) | 获取 TLS 握手结果。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`func handshake(timeout!: ?Duration): TlsHandshakeResult`](handshake.md) | 进行 TLS 握手，返回握手结果。 |

