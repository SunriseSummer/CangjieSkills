<!-- cj-doc kind="api-type" level="5" id="stdx.net.tls.class.defaulttlskit" parent="stdx.net.tls" -->
# DefaultTlsKit

[← stdx.net.tls](../../index.md)

`class DefaultTlsKit <: TlsKit`

TlsKit 的默认实现。用于获取 TLS 服务端、客户端连接和服务端会话。

## 方法

| 签名 | 功能 |
|---|---|
| [`func getTlsClient(socket: StreamingSocket, config: TlsConfig, session!: ?TlsSession): TlsConnection`](gettlsclient.md) | 根据传入的 StreamingSocket 实例创建客户端 TLS 连接，该连接可用于 TLS 握手。 |
| [`func getTlsServer(socket: StreamingSocket, config: TlsConfig, session!: ?TlsSession): TlsConnection`](gettlsserver.md) | 根据传入的 StreamingSocket 实例创建服务端 TLS 连接，该连接可用于 TLS 握手。 |
| [`func getTlsServerSession(name: String): TlsSession`](gettlsserversession.md) | 通过名称创建 TlsSession 实例，该名称用于区分 TLS 服务器。 |

