<!-- cj-doc kind="api-type" level="5" id="stdx.net.tls.enum.signatureschemetype" parent="stdx.net.tls" -->
# SignatureSchemeType

[← stdx.net.tls](../../index.md)

`SignatureSchemeType <: ToString & Equatable<SignatureSchemeType>`

加密算法类型，用于保护网络通信的安全性和隐私性。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`ECDSA_SECP256R1_SHA256`](value-ecdsa_secp256r1_sha256.md) | 创建一个 `ECDSA_SECP256R1_SHA256` 类型的枚举实例，表示加密算法类型使用 `ECDSA_SECP256R1_SHA256`。 |
| [`ECDSA_SECP384R1_SHA384`](value-ecdsa_secp384r1_sha384.md) | 创建一个 `ECDSA_SECP384R1_SHA384` 类型的枚举实例，表示加密算法类型使用 `ECDSA_SECP384R1_SHA384`。 |
| [`ECDSA_SECP521R1_SHA512`](value-ecdsa_secp521r1_sha512.md) | 创建一个 `ECDSA_SECP521R1_SHA512` 类型的枚举实例，表示加密算法类型使用 `ECDSA_SECP521R1_SHA512`。 |
| [`ED25519`](value-ed25519.md) | 创建一个 `ED25519` 类型的枚举实例，表示加密算法类型使用 ED25519。 |
| [`ED448`](value-ed448.md) | 创建一个 `ED448` 类型的枚举实例，表示加密算法类型使用 ED448。 |
| [`RSA_PKCS1_SHA256`](value-rsa_pkcs1_sha256.md) | 创建一个 `RSA_PKCS1_SHA256` 类型的枚举实例，表示加密算法类型使用 `RSA_PKCS1_SHA256`。 |
| [`RSA_PKCS1_SHA384`](value-rsa_pkcs1_sha384.md) | 创建一个 `RSA_PKCS1_SHA384` 类型的枚举实例，表示加密算法类型使用 `RSA_PKCS1_SHA384`。 |
| [`RSA_PKCS1_SHA512`](value-rsa_pkcs1_sha512.md) | 创建一个 `RSA_PKCS1_SHA512` 类型的枚举实例，表示加密算法类型使用 `RSA_PKCS1_SHA512`。 |
| [`RSA_PSS_PSS_SHA256`](value-rsa_pss_pss_sha256.md) | 创建一个 `RSA_PSS_PSS_SHA256` 类型的枚举实例，表示加密算法类型使用 `RSA_PSS_PSS_SHA256`。 |
| [`RSA_PSS_PSS_SHA384`](value-rsa_pss_pss_sha384.md) | 创建一个 `RSA_PSS_PSS_SHA384` 类型的枚举实例，表示加密算法类型使用 `RSA_PSS_PSS_SHA384`。 |
| [`RSA_PSS_PSS_SHA512`](value-rsa_pss_pss_sha512.md) | 创建一个 `RSA_PSS_PSS_SHA512` 类型的枚举实例，表示加密算法类型使用 `RSA_PSS_PSS_SHA512`。 |
| [`RSA_PSS_RSAE_SHA256`](value-rsa_pss_rsae_sha256.md) | 创建一个 `RSA_PSS_RSAE_SHA256` 类型的枚举实例，表示加密算法类型使用 `RSA_PSS_RSAE_SHA256`。 |
| [`RSA_PSS_RSAE_SHA384`](value-rsa_pss_rsae_sha384.md) | 创建一个 `RSA_PSS_RSAE_SHA384` 类型的枚举实例，表示加密算法类型使用 `RSA_PSS_RSAE_SHA384`。 |
| [`RSA_PSS_RSAE_SHA512`](value-rsa_pss_rsae_sha512.md) | 创建一个 `RSA_PSS_RSAE_SHA512` 类型的枚举实例，表示加密算法类型使用 `RSA_PSS_RSAE_SHA384`。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toString(): String`](tostring.md) | 加密算法类型的字符串表示。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(other: SignatureSchemeType): Bool`](operator-ne.md) | 判断两者是否为不同加密算法类型。 |
| [`operator ==(other: SignatureSchemeType): Bool`](operator-eq.md) | 判断两者是否为同一加密算法类型。 |
