<!-- cj-doc kind="api-type" level="5" id="stdx.net.tls.class.tlsclientsession" parent="stdx.net.tls" -->
# TlsClientSession

[← stdx.net.tls](../../index.md)

`class TlsClientSession <: TlsSession & Equatable<TlsClientSession> & ToString & Hashable`

此结构体表示已建立的客户端会话。此结构体实例用户不可创建，其内部结构对用户不可见。

## 方法

| 签名 | 功能 |
|---|---|
| [`override func hashCode(): Int64`](hashcode.md) | 生成会话 id 哈希值。 |
| [`override func toString(): String`](tostring.md) | 生成会话 id 字符串。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`override operator func !=(other: TlsClientSession): Bool`](operator-ne.md) | 判断会话 id 是否不同。 |
| [`override operator func ==(other: TlsClientSession): Bool`](operator-eq.md) | 判断会话 id 是否相同。 |

