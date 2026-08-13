<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.keys.class.sm2privatekey" parent="stdx.crypto.keys" -->
# SM2PrivateKey

[← stdx.crypto.keys](../../index.md)

`SM2PrivateKey <: PrivateKey`

SM2 私钥类，提供生成 SM2 私钥能力，SM2 私钥支持签名和解密操作，支持 PEM 和 DER 格式的编码解码，符合 PKCS1 标准。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | init 初始化生成私钥。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static decodeDer(blob: DerBlob): SM2PrivateKey`](decodeder.md) | 将私钥从 DER 格式解码。 |
| [`static decodeDer(blob: DerBlob, password!: ?String): SM2PrivateKey`](decodeder.md) | 将加密的私钥从 DER 格式解码。 |
| [`static decodeFromPem(text: String): SM2PrivateKey`](decodefrompem.md) | 将私钥从 PEM 格式解码。 |
| [`static decodeFromPem(text: String, password!: ?String): SM2PrivateKey`](decodefrompem.md) | 将私钥从 PEM 格式解码。 |
| [`decrypt(input: Array<Byte>): Array<Byte>`](decrypt.md) | decrypt 解密出原始数据，待解密密文需要遵循 ASN.1 编码规则。 |
| [`encodeToDer(): DerBlob`](encodetoder.md) | 将私钥编码为 DER 格式。 |
| [`encodeToDer(password!: ?String): DerBlob`](encodetoder.md) | 使用 AES-256-CBC 加密私钥，将私钥编码为 DER 格式。 |
| [`encodeToPem(password!: ?String): PemEntry`](encodetopem.md) | 将加密的私钥编码为 PEM 格式。 |
| [`encodeToPem(): PemEntry`](encodetopem.md) | 将私钥编码为 PEM 格式。 |
| [`sign(data: Array<Byte>): Array<Byte>`](sign.md) | sign 对数据进行签名，SM2 采用 SM3 数据摘要算法。 |
| [`override toString(): String`](tostring.md) | 输出私钥种类。 |
