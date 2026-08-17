<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.common.interface.dhparameters" parent="stdx.crypto.common" -->
# DHParameters

[← stdx.crypto.common](../../index.md)

`interface DHParameters <: Key`

DH 密钥参数接口。

## 方法

| 签名 | 功能 |
|---|---|
| [`static func decodeDer(encoded: DerBlob): DHParameters`](decodeder.md) | 将 DH 密钥参数从 DER 格式解码。 |
| [`static func decodeFromPem(text: String): DHParameters`](decodefrompem.md) | 将 DH 密钥参数从 PEM 格式解码。 |

