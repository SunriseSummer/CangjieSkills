<!-- cj-doc kind="api-type" level="5" id="stdx.net.tls.enum.signaturealgorithm" parent="stdx.net.tls" -->
# SignatureAlgorithm

[← stdx.net.tls](../../index.md)

`SignatureAlgorithm <: ToString & Equatable<SignatureAlgorithm>`

签名算法类型，签名算法用于确保传输数据的身份验证、完整性和真实性。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`SignatureAndHashAlgorithm(SignatureType, HashType)`](value-signatureandhashalgorithm-signaturetype-hashtype.md) | 表明哪个签名和哈希算法对会被用于数字签名，自 TLS 1.2 及以后版本，包含签名和哈希算法类型。 |
| [`SignatureScheme(SignatureSchemeType)`](value-signaturescheme-signatureschemetype.md) | 签名方案，自 TLS 1.3 及以后版本，业界更为推荐的指定签名算法的方式。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toString():String`](tostring.md) | 转换签名算法的字符串表示。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(other: SignatureAlgorithm) : Bool`](operator-ne.md) | 判断签名算法类型是否不同。 |
| [`operator ==(other: SignatureAlgorithm) : Bool`](operator-eq.md) | 判断签名算法类型是否相同。 |
