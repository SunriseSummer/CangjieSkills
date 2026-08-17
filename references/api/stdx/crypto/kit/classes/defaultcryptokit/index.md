<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.kit.class.defaultcryptokit" parent="stdx.crypto.kit" -->
# DefaultCryptoKit

[← stdx.crypto.kit](../../index.md)

`class DefaultCryptoKit <: CryptoKit`

CryptoKit 的默认实现。提供随机数生成器及解码 DER、PEM 的能力。

## 方法

| 签名 | 功能 |
|---|---|
| [`func certificateFromDer(encoded: DerBlob): Certificate`](certificatefromder.md) | 将证书从 DER 格式解码。 |
| [`func certificateFromPem(text: String): Array<Certificate>`](certificatefrompem.md) | 将证书从 PEM 格式解码。 |
| [`func dhParametersFromDer(encoded: DerBlob): DHParameters`](dhparametersfromder.md) | 将 DH 密钥参数从 DER 格式解码。 |
| [`func dhParametersFromPem(text: String): DHParameters`](dhparametersfrompem.md) | 将 DH 密钥参数从 PEM 格式解码。 |
| [`func getRandomGen(): RandomGenerator`](getrandomgen.md) | 获取随机数生成器。 |
| [`func privateKeyFromDer(encoded: DerBlob): PrivateKey（2 个重载）`](privatekeyfromder.md) | 将私钥从 DER 格式解码。 |
| [`func privateKeyFromPem(text: String): PrivateKey（2 个重载）`](privatekeyfrompem.md) | 将私钥从 PEM 格式解码。 |
| [`func publicKeyFromDer(encoded: DerBlob): PublicKey`](publickeyfromder.md) | 将公钥从 DER 格式解码。 |
| [`func publicKeyFromPem(text: String): PublicKey`](publickeyfrompem.md) | 将公钥从 PEM 格式解码。 |

