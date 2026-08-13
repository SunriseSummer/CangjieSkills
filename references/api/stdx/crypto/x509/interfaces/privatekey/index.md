<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.x509.interface.privatekey" parent="stdx.crypto.x509" -->
# PrivateKey

[← stdx.crypto.x509](../../index.md)

`PrivateKey <: Key`

提供私钥接口。

## 方法

| 签名 | 功能 |
|---|---|
| [`static decodeDer(blob: DerBlob): PrivateKey`](decodeder.md) | 将私钥从 DER 格式解码。 |
| [`static decodeDer(blob: DerBlob, password!: ?String): PrivateKey`](decodeder.md) | 将 DER 格式的私钥解密解码成 PrivateKey 对象，密码为 None 时则不解密。 |
| [`static decodeFromPem(text: String): PrivateKey`](decodefrompem.md) | 将私钥从 PEM 格式解码。 |
| [`static decodeFromPem(text: String, password!: ?String): PrivateKey`](decodefrompem.md) | 将 PEM 格式的私钥解密解码成 PrivateKey 对象，密码为 None 时则不解密。 |
| [`encodeToDer(password!: ?String): DerBlob`](encodetoder.md) | 将私钥加密编码成 DER 格式，密码为 None 时则不加密。 |
| [`override encodeToPem(): PemEntry`](encodetopem.md) | 将私钥编码成 PEM 格式。 |
| [`encodeToPem(password!: ?String): PemEntry`](encodetopem.md) | 将私钥加密编码成 PEM 格式，密码为 None 时则不加密。 |
