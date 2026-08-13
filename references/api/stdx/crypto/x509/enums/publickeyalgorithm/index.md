<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.x509.enum.publickeyalgorithm" parent="stdx.crypto.x509" -->
# PublicKeyAlgorithm

[← stdx.crypto.x509](../../index.md)

`PublicKeyAlgorithm <: Equatable<PublicKeyAlgorithm> & ToString`

数字证书中包含的公钥信息，目前支持的种类有：RSA、DSA、ECDSA。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`DSA`](value-dsa.md) | DSA 公钥算法。 |
| [`ECDSA`](value-ecdsa.md) | ECDSA 公钥算法。 |
| [`RSA`](value-rsa.md) | RSA 公钥算法。 |
| [`UnknownPublicKeyAlgorithm`](value-unknownpublickeyalgorithm.md) | 未知公钥算法。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`override toString(): String`](tostring.md) | 生成证书携带的公钥算法名称字符串。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`override operator !=(other: PublicKeyAlgorithm): Bool`](operator-ne.md) | 判不等。 |
| [`override operator ==(other: PublicKeyAlgorithm): Bool`](operator-eq.md) | 判等。 |
