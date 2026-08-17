<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.common.struct.pementry" parent="stdx.crypto.common" -->
# PemEntry

[← stdx.crypto.common](../../index.md)

`struct PemEntry <: ToString`

PEM 文本格式经常用于存储证书和密钥，PEM 编码结构包含以下几个部分：

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`static let LABEL_CERTIFICATE: String = "CERTIFICATE"`](field-label_certificate.md) | 记录条目类型为证书。 |
| [`static let LABEL_CERTIFICATE_REQUEST: String = "CERTIFICATE REQUEST"`](field-label_certificate_request.md) | 记录条目类型为证书签名请求。 |
| [`static let LABEL_DH_PARAMETERS: String = "DH PARAMETERS"`](field-label_dh_parameters.md) | 记录条目类型为 DH 密钥参数。 |
| [`static let LABEL_EC_PARAMETERS: String = "EC PARAMETERS"`](field-label_ec_parameters.md) | 记录条目类型为椭圆曲线参数。 |
| [`static let LABEL_EC_PRIVATE_KEY: String = "EC PRIVATE KEY"`](field-label_ec_private_key.md) | 记录条目类型为椭圆曲线私钥。 |
| [`static let LABEL_ENCRYPTED_PRIVATE_KEY: String = "ENCRYPTED PRIVATE KEY"`](field-label_encrypted_private_key.md) | 记录条目类型为 PKCS #8 标准加密的私钥。 |
| [`static let LABEL_PRIVATE_KEY: String = "PRIVATE KEY"`](field-label_private_key.md) | 记录条目类型为 PKCS #8 标准未加密的私钥。 |
| [`static let LABEL_PUBLIC_KEY: String = "PUBLIC KEY"`](field-label_public_key.md) | 记录条目类型为公钥。 |
| [`static let LABEL_RSA_PRIVATE_KEY: String = "RSA PRIVATE KEY"`](field-label_rsa_private_key.md) | 记录条目类型为 RSA 私钥。 |
| [`static let LABEL_SM2_PRIVATE_KEY: String = "SM2 PRIVATE KEY"`](field-label_sm2_private_key.md) | 记录条目类型为 SM2 私钥。 |
| [`static let LABEL_X509_CRL: String = "X509 CRL"`](field-label_x509_crl.md) | 记录条目类型为证书吊销列表。 |
| [`let body: ?DerBlob`](field-body.md) | PemEntry 实例的二进制内容。 |
| [`let headers: Array<(String, String)>`](field-headers.md) | PemEntry 实例的条目头。 |
| [`let label: String`](field-label.md) | PemEntry 实例的标签。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`PemEntry( public let label: String, public let headers: Array<(String, String)>, public let body: ?DerBlob )（2 个重载）`](init.md) | 构造 PemEntry 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`func encode(): String`](encode.md) | 返回 PEM 格式的字符串。行结束符将根据当前操作系统生成。 |
| [`func header(name: String): Iterator<String>`](header.md) | 通过条目头名称，找到对应条目内容。 |
| [`override func toString(): String`](tostring.md) | 返回 PEM 对象的标签和二进制内容的长度。 |

