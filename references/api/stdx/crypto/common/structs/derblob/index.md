<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.common.struct.derblob" parent="stdx.crypto.common" -->
# DerBlob

[← stdx.crypto.common](../../index.md)

`struct DerBlob <: Equatable<DerBlob> & Hashable`

Crypto 支持配置二进制证书流，用户读取二进制证书数据并创建 DerBlob 对象后可将其解析成 X509Certificate / X509CertificateRequest / PublicKey / PrivateKey 对象。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`prop body: Array<Byte>`](prop-body.md) | DerBlob 对象中的字符序列。 |
| [`prop size: Int64`](prop-size.md) | DerBlob 对象中字符序列的大小。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(content: Array<Byte>)`](init.md) | 构造 DerBlob 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`override func hashCode(): Int64`](hashcode.md) | 返回 DerBlob 对象哈希值。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`override operator func !=(other: DerBlob): Bool`](operator-ne.md) | 判不等。 |
| [`override operator func ==(other: DerBlob): Bool`](operator-eq.md) | 判等。 |

