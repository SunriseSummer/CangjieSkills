<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.x509.interface.key" parent="stdx.crypto.x509" -->
# Key

[← stdx.crypto.x509](../../index.md)

`Key <: ToString`

提供密钥接口。

## 方法

| 签名 | 功能 |
|---|---|
| [`static decodeDer(encoded: DerBlob): Key`](decodeder.md) | 将密钥从 DER 格式解码。 |
| [`static decodeFromPem(text: String): Key`](decodefrompem.md) | 将密钥从 PEM 格式解码。 |
| [`encodeToDer(): DerBlob`](encodetoder.md) | 将密钥编码为 DER 格式。 |
| [`encodeToPem(): PemEntry`](encodetopem.md) | 将密钥编码为 PEM 格式。 |
