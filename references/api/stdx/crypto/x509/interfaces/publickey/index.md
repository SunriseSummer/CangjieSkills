<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.x509.interface.publickey" parent="stdx.crypto.x509" -->
# PublicKey

[← stdx.crypto.x509](../../index.md)

`PublicKey <: Key`

公钥接口。

## 方法

| 签名 | 功能 |
|---|---|
| [`static decodeDer(blob: DerBlob): PublicKey`](decodeder.md) | 将公钥从 DER 格式解码。 |
| [`static decodeFromPem(text: String): PublicKey`](decodefrompem.md) | 将公钥从 PEM 格式解码。 |
| [`override encodeToPem(): PemEntry`](encodetopem.md) | 将公钥编码为 PEM 格式。 |
