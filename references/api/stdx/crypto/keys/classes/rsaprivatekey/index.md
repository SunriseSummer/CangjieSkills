<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.keys.class.rsaprivatekey" parent="stdx.crypto.keys" -->
# RSAPrivateKey

[← stdx.crypto.keys](../../index.md)

`RSAPrivateKey <: PrivateKey`

RSA 私钥类，提供生成 RSA 私钥能力，RSA 私钥支持签名和解密操作，支持 PEM 和 DER 格式的编码解码，符合 PKCS1 标准。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(bits: Int32)`](init.md) | init 初始化生成私钥，公钥指数默认值为 65537，业界推荐。 |
| [`init(bits: Int32, e: BigInt)`](init.md) | init 初始化生成私钥，允许用户指定公共指数。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static decodeDer(blob: DerBlob): RSAPrivateKey`](decodeder.md) | 将私钥从 DER 格式解码。 |
| [`static decodeDer(blob: DerBlob, password!: ?String): RSAPrivateKey`](decodeder.md) | 将加密的私钥从 DER 格式解码。 |
| [`static decodeFromPem(text: String): RSAPrivateKey`](decodefrompem.md) | 将私钥从 PEM 格式解码。 |
| [`static decodeFromPem(text: String, password!: ?String): RSAPrivateKey`](decodefrompem.md) | 将私钥从 PEM 格式解码。 |
| [`decrypt(input: InputStream, output: OutputStream, padType!: PadOption): Unit`](decrypt.md) | decrypt 解密出原始数据。 |
| [`override encodeToDer(): DerBlob`](encodetoder.md) | 将私钥编码为 DER 格式。 |
| [`encodeToDer(password!: ?String): DerBlob`](encodetoder.md) | 使用 AES-256-CBC 加密私钥，将私钥编码为 DER 格式。 |
| [`override encodeToPem(): PemEntry`](encodetopem.md) | 将私钥编码为 PEM 格式。 |
| [`sign(hash: Digest, digest: Array<Byte>, padType!: PadOption): Array<Byte>`](sign.md) | 对数据的摘要结果进行签名。 |
| [`override toString(): String`](tostring.md) | 输出私钥种类。 |
