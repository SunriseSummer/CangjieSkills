<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.x509.struct.signature" parent="stdx.crypto.x509" -->
# Signature

[← stdx.crypto.x509](../../index.md)

`Signature <: Equatable<Signature> & Hashable`

数字证书的签名，用来验证身份的正确性。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`signatureValue: DerBlob`](prop-signaturevalue.md) | 返回证书签名的二进制。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`override hashCode(): Int64`](hashcode.md) | 返回证书签名哈希值。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`override operator !=(other: Signature): Bool`](operator-ne.md) | 判不等。 |
| [`override operator ==(other: Signature): Bool`](operator-eq.md) | 判等。 |
