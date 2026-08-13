<!-- cj-doc kind="api-package" level="4" id="stdx.crypto.keys" parent="api.stdx" -->
# stdx.crypto.keys

[← stdx 包索引](../../index.md)

提供非对称加密和签名算法，包括 RSA 和 SM2 非对称加密算法以及 ECDSA 签名算法。

包路径：`stdx.crypto.keys`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`ECDSAPrivateKey <: PrivateKey`](classes/ecdsaprivatekey/index.md) | ECDSA 私钥类，提供生成 ECDSA 私钥能力，ECDSA 的私钥支持签名操作，同时支持 PEM 和 DER 格式的编码解码。 |
| [`ECDSAPublicKey <: PublicKey`](classes/ecdsapublickey/index.md) | ECDSA 公钥类，提供生成 ECDSA 公钥能力，ECDSA 公钥支持验证签名操作，支持 PEM 和 DER 格式的编码解码。 |
| [`RSAPrivateKey <: PrivateKey`](classes/rsaprivatekey/index.md) | RSA 私钥类，提供生成 RSA 私钥能力，RSA 私钥支持签名和解密操作，支持 PEM 和 DER 格式的编码解码，符合 PKCS1 标准。 |
| [`RSAPublicKey <: PublicKey`](classes/rsapublickey/index.md) | RSA 公钥类，提供生成 RSA 公钥能力，RSA 公钥支持验证签名和加密操作，支持 PEM 和 DER 格式的编码解码。 |
| [`SM2PrivateKey <: PrivateKey`](classes/sm2privatekey/index.md) | SM2 私钥类，提供生成 SM2 私钥能力，SM2 私钥支持签名和解密操作，支持 PEM 和 DER 格式的编码解码，符合 PKCS1 标准。 |
| [`SM2PublicKey <: PublicKey`](classes/sm2publickey/index.md) | SM2 公钥类，提供生成 SM2 公钥能力，SM2 公钥支持验证签名和加密操作，支持 PEM 和 DER 格式的编码解码。 |

## 结构体

| 声明 | 功能 |
|---|---|
| [`OAEPOption`](structs/oaepoption/index.md) | 此结构体为 OAEP 填充模式需要设置的参数。 |
| [`PSSOption`](structs/pssoption/index.md) | 此结构体为 PSS 填充模式需要设置的参数。 |

## 枚举

| 声明 | 功能 |
|---|---|
| [`Curve`](enums/curve/index.md) | 枚举类型 Curve 用于选择生成 ECDSA 密钥时使用的椭圆曲线类型。 |
| [`PadOption`](enums/padoption/index.md) | 用于设置 RSA 的填充模式。 |
