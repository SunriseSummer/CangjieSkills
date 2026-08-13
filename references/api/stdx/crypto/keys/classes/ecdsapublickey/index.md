<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.keys.class.ecdsapublickey" parent="stdx.crypto.keys" -->
# ECDSAPublicKey

[← stdx.crypto.keys](../../index.md)

`ECDSAPublicKey <: PublicKey`

ECDSA 公钥类，提供生成 ECDSA 公钥能力，ECDSA 公钥支持验证签名操作，支持 PEM 和 DER 格式的编码解码。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(pri: ECDSAPrivateKey)`](init.md) | init 初始化公钥，从私钥中获取对应的公钥。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static decodeDer(blob: DerBlob): ECDSAPublicKey`](decodeder.md) | 将公钥从 DER 格式解码。 |
| [`static decodeFromPem(text: String): ECDSAPublicKey`](decodefrompem.md) | 将公钥从 PEM 格式解码。 |
| [`override encodeToDer(): DerBlob`](encodetoder.md) | 将公钥编码为 DER 格式。 |
| [`override encodeToPem(): PemEntry`](encodetopem.md) | 将公钥编码为 PEM 格式。 |
| [`override toString(): String`](tostring.md) | 输出公钥种类。 |
| [`verify(digest: Array<Byte>, sig: Array<Byte>): Bool`](verify.md) | verify 验证签名结果。 |
