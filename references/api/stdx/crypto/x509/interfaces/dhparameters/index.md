<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.x509.interface.dhparameters" parent="stdx.crypto.x509" -->
# DHParameters

[← stdx.crypto.x509](../../index.md)

`DHParameters <: Key`

提供 DH 密钥参数接口。

## 方法

| 签名 | 功能 |
|---|---|
| [`static decodeDer(blob: DerBlob): DHParameters`](decodeder.md) | 将 DH 密钥参数从 DER 格式解码。 |
| [`static decodeFromPem(text: String): DHParameters`](decodefrompem.md) | 将 DH 密钥参数从 PEM 格式解码。 |
| [`override encodeToPem(): PemEntry`](encodetopem.md) | 将 DH 密钥参数编码为 PEM 格式。 |
