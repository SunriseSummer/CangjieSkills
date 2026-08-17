<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.common.interface.key" parent="stdx.crypto.common" -->
# Key

[← stdx.crypto.common](../../index.md)

`interface Key <: ToString`

密钥接口。公钥用于签名验证或加密，私钥用于签名或解密，公钥和私钥必须相互匹配并形成一对。该类为密钥类，无具体实现，供 PrivateKey/PublicKey 及用户扩展接口。

## 方法

| 签名 | 功能 |
|---|---|
| [`static func decodeDer(encoded: DerBlob): Key`](decodeder.md) | 将密钥从 DER 格式解码。 |
| [`static func decodeFromPem(text: String): Key`](decodefrompem.md) | 将密钥从 PEM 格式解码。 |
| [`func encodeToDer(): DerBlob`](encodetoder.md) | 将密钥编码为 DER 格式。 |
| [`func encodeToPem(): PemEntry`](encodetopem.md) | 将密钥编码为 PEM 格式。 |

