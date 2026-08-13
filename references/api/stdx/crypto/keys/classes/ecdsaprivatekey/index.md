<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.keys.class.ecdsaprivatekey" parent="stdx.crypto.keys" -->
# ECDSAPrivateKey

[← stdx.crypto.keys](../../index.md)

`ECDSAPrivateKey <: PrivateKey`

ECDSA 私钥类，提供生成 ECDSA 私钥能力，ECDSA 的私钥支持签名操作，同时支持 PEM 和 DER 格式的编码解码。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(curve: Curve)`](init.md) | init 初始化生成私钥。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static decodeDer(blob: DerBlob): ECDSAPrivateKey`](decodeder.md) | 将私钥从 DER 格式解码。 |
| [`static decodeDer(blob: DerBlob, password!: ?String): ECDSAPrivateKey`](decodeder.md) | 将加密的私钥从 DER 格式解码。 |
| [`static decodeFromPem(text: String): ECDSAPrivateKey`](decodefrompem.md) | 将私钥从 PEM 格式解码。 |
| [`static decodeFromPem(text: String, password!: ?String): ECDSAPrivateKey`](decodefrompem.md) | 将私钥从 PEM 格式解码。 |
| [`override encodeToDer(): DerBlob`](encodetoder.md) | 将私钥编码为 DER 格式。 |
| [`encodeToDer(password!: ?String): DerBlob`](encodetoder.md) | 使用 AES-256-CBC 加密私钥，将私钥编码为 DER 格式。 |
| [`override encodeToPem(): PemEntry`](encodetopem.md) | 将私钥编码为 PEM 格式。 |
| [`sign(digest: Array<Byte>): Array<Byte>`](sign.md) | sign 对数据的摘要结果进行签名。 |
| [`override toString(): String`](tostring.md) | 输出私钥种类。 |
