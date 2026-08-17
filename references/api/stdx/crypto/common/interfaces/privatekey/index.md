<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.common.interface.privatekey" parent="stdx.crypto.common" -->
# PrivateKey

[← stdx.crypto.common](../../index.md)

`interface PrivateKey <: Key`

私钥接口。

## 方法

| 签名 | 功能 |
|---|---|
| [`static func decodeDer(encoded: DerBlob): PrivateKey（2 个重载）`](decodeder.md) | 将私钥从 DER 格式解码。 |
| [`static func decodeFromPem(text: String): PrivateKey（2 个重载）`](decodefrompem.md) | 将私钥从 PEM 格式解码。 |
| [`func encodeToDer(password!: ?String): DerBlob`](encodetoder.md) | 将私钥加密编码成 DER 格式，密码为 None 时则不加密。 |
| [`func encodeToPem(password!: ?String): PemEntry`](encodetopem.md) | 将私钥加密编码成 PEM 格式，密码为 None 时则不加密。 |

