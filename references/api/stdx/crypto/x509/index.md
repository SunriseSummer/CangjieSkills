<!-- cj-doc kind="api-package" level="4" id="stdx.crypto.x509" parent="api.stdx" -->
# stdx.crypto.x509

[← stdx 包索引](../../index.md)

解析、序列化和验证 X.509 证书，并创建自签名证书与证书链。

包路径：`stdx.crypto.x509`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`X509Certificate <: Equatable<X509Certificate> & Hashable & ToString`](classes/x509certificate/index.md) | X509 数字证书是一种用于加密通信的数字证书，它是公钥基础设施（PKI）的核心组件之一。 |
| [`X509CertificateRequest <: Hashable & ToString`](classes/x509certificaterequest/index.md) | 数字证书签名请求。 |
| [`X509Name <: ToString`](classes/x509name/index.md) | 证书实体可辨识名称（Distinguished Name）是数字证书中的一个重要组成部分，作用是确保证书的持有者身份的真实性和可信度，同时也是数字证书验证的重要依据之一。 |
| [`X509Exception <: Exception`](classes/x509exception/index.md) | 此异常为 X509 包抛出的异常类型。 |

## 接口

| 声明 | 功能 |
|---|---|
| [`DHParameters <: Key`](interfaces/dhparameters/index.md) | 提供 DH 密钥参数接口。 |
| [`Key <: ToString`](interfaces/key/index.md) | 提供密钥接口。 |
| [`PrivateKey <: Key`](interfaces/privatekey/index.md) | 提供私钥接口。 |
| [`PublicKey <: Key`](interfaces/publickey/index.md) | 公钥接口。 |

## 结构体

| 声明 | 功能 |
|---|---|
| [`DerBlob <: Equatable<DerBlob> & Hashable`](structs/derblob/index.md) | Crypto 支持配置二进制证书流，用户读取二进制证书数据并创建 DerBlob 对象后可将其解析成 X509Certificate / X509CertificateRequest / PublicKey / PrivateKey 对象。 |
| [`ExtKeyUsage <: ToString`](structs/extkeyusage/index.md) | 数字证书扩展字段中通常会包含携带扩展密钥用法说明，目前支持的用途有：ServerAuth、ClientAuth、EmailProtection、CodeSigning、OCSPSigning、TimeStamping。 |
| [`KeyUsage <: ToString`](structs/keyusage/index.md) | 数字证书扩展字段中通常会包含携带公钥的用法说明，目前支持的用途有：DigitalSignature、NonRepudiation、KeyEncipherment、DataEncipherment、KeyAgreement、CertSign、CRLSign、EncipherOnly、DecipherOnly。 |
| [`Pem <: Collection<PemEntry> & ToString`](structs/pem/index.md) | 结构体 Pem 为条目序列，可以包含多个 PemEntry。 |
| [`PemEntry <: ToString`](structs/pementry/index.md) | PEM 文本格式经常用于存储证书和密钥，PEM 编码结构包含以下几个部分： |
| [`SerialNumber <: Equatable<SerialNumber> & Hashable & ToString`](structs/serialnumber/index.md) | 结构体 SerialNumber 为数字证书的序列号，是数字证书中的一个唯一标识符，用于标识数字证书的唯一性。 |
| [`Signature <: Equatable<Signature> & Hashable`](structs/signature/index.md) | 数字证书的签名，用来验证身份的正确性。 |
| [`VerifyOption`](structs/verifyoption/index.md) | 用于为 `x509` 证书验证函数 verify 提供配置选项。 |
| [`X509CertificateInfo`](structs/x509certificateinfo/index.md) | X509CertificateInfo 结构包含了证书信息，包括证书序列号、有效期、实体可辨识名称、域名、email 地址、IP 地址、密钥用法和扩展密钥用法。 |
| [`X509CertificateRequestInfo`](structs/x509certificaterequestinfo/index.md) | X509CertificateRequestInfo 结构包含了证书请求信息，包括证书实体可辨识名称、域名、email 地址和 IP 地址。 |

## 枚举

| 声明 | 功能 |
|---|---|
| [`PublicKeyAlgorithm <: Equatable<PublicKeyAlgorithm> & ToString`](enums/publickeyalgorithm/index.md) | 数字证书中包含的公钥信息，目前支持的种类有：RSA、DSA、ECDSA。 |
| [`SignatureAlgorithm <: Equatable<SignatureAlgorithm> & ToString`](enums/signaturealgorithm/index.md) | 证书签名算法（Signature Algorithm）是用于数字证书签名的算法，它是一种将数字证书中的公钥和其他信息进行加密的算法，以确保数字证书的完整性和真实性。 |

## 类型别名

| 声明 | 功能 |
|---|---|
| [`IP = Array<Byte>`](types/ip.md) | x509 包用 Array<Byte> 来记录 IP。 |
