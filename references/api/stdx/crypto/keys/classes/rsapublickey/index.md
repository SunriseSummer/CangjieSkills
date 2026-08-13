<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.keys.class.rsapublickey" parent="stdx.crypto.keys" -->
# RSAPublicKey

[← stdx.crypto.keys](../../index.md)

`RSAPublicKey <: PublicKey`

RSA 公钥类，提供生成 RSA 公钥能力，RSA 公钥支持验证签名和加密操作，支持 PEM 和 DER 格式的编码解码。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(pri: RSAPrivateKey)`](init.md) | init 初始化公钥，从私钥中获取对应的公钥。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static decodeDer(blob: DerBlob): RSAPublicKey`](decodeder.md) | 将公钥从 DER 格式解码。 |
| [`static decodeFromPem(text: String): RSAPublicKey`](decodefrompem.md) | 将公钥从 PEM 格式解码。 |
| [`override encodeToDer(): DerBlob`](encodetoder.md) | 将公钥编码为 DER 格式。 |
| [`override encodeToPem(): PemEntry`](encodetopem.md) | 将公钥编码为 PEM 格式。 |
| [`encrypt(input: InputStream, output: OutputStream, padType!: PadOption): Unit`](encrypt.md) | encrypt 给一段数据进行加密。 |
| [`override toString(): String`](tostring.md) | 输出公钥种类。 |
| [`verify(hash: Digest, digest: Array<Byte>, sig: Array<Byte>, padType!: PadOption): Bool`](verify.md) | verify 验证签名结果。 |
