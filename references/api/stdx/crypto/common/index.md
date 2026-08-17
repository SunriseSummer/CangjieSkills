<!-- cj-doc kind="api-package" level="4" id="stdx.crypto.common" parent="api.stdx" -->
# stdx.crypto.common

[← stdx 包索引](../../index.md)

定义证书、密钥、安全随机数和 `CryptoKit` 等加密能力的公共抽象及 DER、PEM 编码载体。

包路径：`stdx.crypto.common`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`CryptoException`](classes/cryptoexception/index.md) | 此类为加解密出现错误时抛出的异常。 |

## 接口

| 声明 | 功能 |
|---|---|
| [`Certificate`](interfaces/certificate/index.md) | 证书接口，用于适配不同的加密套件。 |
| [`CryptoKit`](interfaces/cryptokit/index.md) | 加密套件接口。提供随机数生成器及解码 DER、PEM 的能力。 |
| [`DHParameters`](interfaces/dhparameters/index.md) | DH 密钥参数接口。 |
| [`Key`](interfaces/key/index.md) | 密钥接口。公钥用于签名验证或加密，私钥用于签名或解密，公钥和私钥必须相互匹配并形成一对。该类为密钥类，无具体实现，供 PrivateKey/PublicKey 及用户扩展接口。 |
| [`PrivateKey`](interfaces/privatekey/index.md) | 私钥接口。 |
| [`PublicKey`](interfaces/publickey/index.md) | 公钥接口。 |
| [`RandomGenerator`](interfaces/randomgenerator/index.md) | 安全随机数生成器接口。 |

## 结构体

| 声明 | 功能 |
|---|---|
| [`DerBlob`](structs/derblob/index.md) | Crypto 支持配置二进制证书流，用户读取二进制证书数据并创建 DerBlob 对象后可将其解析成 X509Certificate / X509CertificateRequest / PublicKey / PrivateKey 对象。 |
| [`Pem`](structs/pem/index.md) | 结构体 Pem 为条目序列，可以包含多个 PemEntry。 |
| [`PemEntry`](structs/pementry/index.md) | PEM 文本格式经常用于存储证书和密钥，PEM 编码结构包含以下几个部分： |

## 顶层函数

| 声明 | 功能 |
|---|---|
| [`func getGlobalCryptoKit(): CryptoKit`](functions/func-getglobalcryptokit.md) | 获取当前全局使用的加密套件。 |
| [`func setGlobalCryptoKit(kit: CryptoKit): Unit`](functions/func-setglobalcryptokit-cryptokit.md) | 设置全局使用的加密套件。 |
