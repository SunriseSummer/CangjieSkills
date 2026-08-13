<!-- cj-doc kind="api-type" level="5" id="stdx.net.tls.struct.ciphersuite" parent="stdx.net.tls" -->
# CipherSuite

[← stdx.net.tls](../../index.md)

`CipherSuite <: ToString & Equatable<CipherSuite>`

TLS 中的密码套件。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`static allSupported: Array<CipherSuite>`](prop-allsupported.md) | 返回所有支持的密码套件。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toString(): String`](tostring.md) | 返回密码套件名称。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(that: CipherSuite): Bool`](operator-ne.md) | 判断两个密码套件是否不等。 |
| [`operator ==(that: CipherSuite): Bool`](operator-eq.md) | 判断两个密码套件是否相等。 |
