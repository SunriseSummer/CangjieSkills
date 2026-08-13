<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.x509.enum.signaturealgorithm" parent="stdx.crypto.x509" -->
# SignatureAlgorithm

[← stdx.crypto.x509](../../index.md)

`SignatureAlgorithm <: Equatable<SignatureAlgorithm> & ToString`

证书签名算法（Signature Algorithm）是用于数字证书签名的算法，它是一种将数字证书中的公钥和其他信息进行加密的算法，以确保数字证书的完整性和真实性。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`DSAWithSHA1`](value-dsawithsha1.md) | DSAwithSHA1 签名算法。 |
| [`DSAWithSHA256`](value-dsawithsha256.md) | DSAwithSHA256 签名算法。 |
| [`ECDSAWithSHA1`](value-ecdsawithsha1.md) | ECDSAwithSHA1 签名算法。 |
| [`ECDSAWithSHA256`](value-ecdsawithsha256.md) | ECDSAwithSHA256 签名算法。 |
| [`ECDSAWithSHA384`](value-ecdsawithsha384.md) | ECDSAwithSHA384 签名算法。 |
| [`ECDSAWithSHA512`](value-ecdsawithsha512.md) | ECDSAwithSHA512 签名算法。 |
| [`MD2WithRSA`](value-md2withrsa.md) | MD2withRSA 签名算法。 |
| [`MD5WithRSA`](value-md5withrsa.md) | MD5withRSA 签名算法。 |
| [`SHA1WithRSA`](value-sha1withrsa.md) | SHA1withRSA 签名算法。 |
| [`SHA256WithRSA`](value-sha256withrsa.md) | SHA256withRSA 签名算法。 |
| [`SHA384WithRSA`](value-sha384withrsa.md) | SHA384withRSA 签名算法。 |
| [`SHA512WithRSA`](value-sha512withrsa.md) | SHA512withRSA 签名算法。 |
| [`UnknownSignatureAlgorithm`](value-unknownsignaturealgorithm.md) | 未知签名算法。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`override toString(): String`](tostring.md) | 生成证书签名算法名称字符串。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`override operator !=(other: SignatureAlgorithm): Bool`](operator-ne.md) | 判不等。 |
| [`override operator ==(other: SignatureAlgorithm): Bool`](operator-eq.md) | 判等。 |
