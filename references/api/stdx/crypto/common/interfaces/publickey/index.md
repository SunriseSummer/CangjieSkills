<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.common.interface.publickey" parent="stdx.crypto.common" -->
# PublicKey

[← stdx.crypto.common](../../index.md)

`interface PublicKey <: Key`

公钥接口。

## 方法

| 签名 | 功能 |
|---|---|
| [`static func decodeDer(encoded: DerBlob): PublicKey`](decodeder.md) | 将公钥从 DER 格式解码。 |
| [`static func decodeFromPem(text: String): PublicKey`](decodefrompem.md) | 将公钥从 PEM 格式解码。 |

