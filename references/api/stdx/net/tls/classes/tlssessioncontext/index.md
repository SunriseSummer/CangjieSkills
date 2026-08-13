<!-- cj-doc kind="api-type" level="5" id="stdx.net.tls.class.tlssessioncontext" parent="stdx.net.tls" -->
# TlsSessionContext

[← stdx.net.tls](../../index.md)

`TlsSessionContext <: Equatable<TlsSessionContext> & ToString`

该类表示 TLS 会话上下文，给客户端提供信息，确保客户端所连接的服务端仍为相同实例，用于连接复用时，验证客户端合法性。

## 方法

| 签名 | 功能 |
|---|---|
| [`static fromName(name: String): TlsSessionContext`](fromname.md) | 通过名称创建 TlsSessionContext 实例。 |
| [`override toString(): String`](tostring.md) | 生成会话上下文名称字符串。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`override operator !=(other: TlsSessionContext): Bool`](operator-ne.md) | 判断两 TlsSessionContext 实例名称是否不同。 |
| [`override operator ==(other: TlsSessionContext): Bool`](operator-eq.md) | 判断两 TlsSessionContext 实例名称是否相同。 |
