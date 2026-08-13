<!-- cj-doc kind="api-type" level="5" id="stdx.net.tls.enum.signaturetype" parent="stdx.net.tls" -->
# SignatureType

[← stdx.net.tls](../../index.md)

`SignatureType <: ToString & Equatable<SignatureType>`

签名算法类型，用于认证真实性。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`DSA`](value-dsa.md) | 创建一个 `DSA` 类型的枚举实例，表示采用数字签名算法。 |
| [`ECDSA`](value-ecdsa.md) | 创建一个 `ECDSA` 类型的枚举实例，表示采用椭圆曲线数字签名算法。 |
| [`RSA`](value-rsa.md) | 创建一个 `RSA` 类型的枚举实例，表示采用 RSA 加密算法。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toString(): String`](tostring.md) | 转换为签名算法的字符串表示。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(other: SignatureType) : Bool`](operator-ne.md) | 判断两者是否为不同的签名算法。 |
| [`operator ==(other: SignatureType) : Bool`](operator-eq.md) | 判断两者是否为相同的签名算法。 |
