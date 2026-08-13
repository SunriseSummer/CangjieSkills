<!-- cj-doc kind="api-type" level="5" id="stdx.net.tls.struct.tlssession" parent="stdx.net.tls" -->
# TlsSession

[← stdx.net.tls](../../index.md)

`TlsSession <: Equatable<TlsSession> & ToString & Hashable`

此结构体表示已建立的客户端会话。

## 方法

| 签名 | 功能 |
|---|---|
| [`override hashCode(): Int64`](hashcode.md) | 生成会话 id 的哈希值。 |
| [`override toString(): String`](tostring.md) | 生成会话 id 的字符串。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`override operator !=(other: TlsSession): Bool`](operator-ne.md) | 判断会话 id 是否不同。 |
| [`override operator ==(other: TlsSession): Bool`](operator-eq.md) | 判断会话 id 是否相同。 |
