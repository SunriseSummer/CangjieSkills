<!-- cj-doc kind="api-type" level="5" id="stdx.net.tls.common.interface.tlshandshakeresult" parent="stdx.net.tls.common" -->
# TlsHandshakeResult

[← stdx.net.tls.common](../../index.md)

`interface TlsHandshakeResult`

TLS 握手结果接口。用于获取 TLS 握手过程中协商得到的信息。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`prop alpnProtocol: String`](prop-alpnprotocol.md) | 获取应用层协议。例如 “http/1.1"、"h2"。 |
| [`prop cipherSuite: String`](prop-ciphersuite.md) | 获取 TLS 加密套件。 |
| [`prop peerCertificate: Array<Certificate>`](prop-peercertificate.md) | 获取对端证书。 |
| [`prop serverName: String`](prop-servername.md) | 获取服务端主机名称。 |
| [`prop session: ?TlsSession`](prop-session.md) | 获取 TLS 会话。客户端可在握手成功后捕获当前会话，后续可重用该会话。 |
| [`prop version: TlsVersion`](prop-version.md) | 获取 TLS 版本。 |

