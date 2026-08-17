<!-- cj-doc kind="api-type" level="5" id="stdx.net.tls.class.tlsserversession" parent="stdx.net.tls" -->
# TlsServerSession

[← stdx.net.tls](../../index.md)

`class TlsServerSession <: TlsSession & Equatable<TlsServerSession> & ToString`

该类表示 TLS 会话上下文，给客户端提供信息，确保客户端所连接的服务端仍为相同实例，用于连接复用时，验证客户端合法性。

## 方法

| 签名 | 功能 |
|---|---|
| [`static func fromName(name: String): TlsServerSession`](fromname.md) | 通过名称创建 TlsServerSession 实例。 |
| [`override func toString(): String`](tostring.md) | 生成会话上下文名称字符串。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`override operator func !=(other: TlsServerSession): Bool`](operator-ne.md) | 判断两 TlsServerSession 实例名称是否不同。 |
| [`override operator func ==(other: TlsServerSession): Bool`](operator-eq.md) | 判断两 TlsServerSession 实例名称是否相同。 |

