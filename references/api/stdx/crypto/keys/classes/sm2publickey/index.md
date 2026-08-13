<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.keys.class.sm2publickey" parent="stdx.crypto.keys" -->
# SM2PublicKey

[← stdx.crypto.keys](../../index.md)

`SM2PublicKey <: PublicKey`

SM2 公钥类，提供生成 SM2 公钥能力，SM2 公钥支持验证签名和加密操作，支持 PEM 和 DER 格式的编码解码。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(pri: SM2PrivateKey)`](init.md) | init 初始化公钥，从私钥中获取对应的公钥。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static decodeDer(blob: DerBlob): SM2PublicKey`](decodeder.md) | 将公钥从 DER 格式解码。 |
| [`static decodeFromPem(text: String): SM2PublicKey`](decodefrompem.md) | 将公钥从 PEM 格式解码。 |
| [`encodeToDer(): DerBlob`](encodetoder.md) | 将公钥编码为 DER 格式。 |
| [`encodeToPem(): PemEntry`](encodetopem.md) | 将公钥编码为 PEM 格式。 |
| [`encrypt(input: Array<Byte>): Array<Byte>`](encrypt.md) | encrypt 给一段数据进行加密，输出密文遵循 ASN.1 编码规则。 |
| [`override toString(): String`](tostring.md) | 输出公钥种类。 |
| [`verify(data: Array<Byte>, sig: Array<Byte>): Bool`](verify.md) | verify 验证签名结果。 |
