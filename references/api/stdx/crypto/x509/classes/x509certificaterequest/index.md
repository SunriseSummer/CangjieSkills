<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.x509.class.x509certificaterequest" parent="stdx.crypto.x509" -->
# X509CertificateRequest

[← stdx.crypto.x509](../../index.md)

`X509CertificateRequest <: Hashable & ToString`

数字证书签名请求。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`IPAddresses: Array<IP>`](prop-ipaddresses.md) | 解析数字证书签名请求备选名称中的 IP 地址。 |
| [`dnsNames: Array<String>`](prop-dnsnames.md) | 解析数字证书签名请求备选名称中的域名。 |
| [`emailAddresses: Array<String>`](prop-emailaddresses.md) | 解析数字证书签名请求备选名称中的 email 地址。 |
| [`publicKey: PublicKey`](prop-publickey.md) | 解析数字证书签名请求的公钥。 |
| [`publicKeyAlgorithm: PublicKeyAlgorithm`](prop-publickeyalgorithm.md) | 解析数字证书签名请求的公钥算法。 |
| [`signature: Signature`](prop-signature.md) | 解析数字证书签名请求的签名。 |
| [`signatureAlgorithm: SignatureAlgorithm`](prop-signaturealgorithm.md) | 解析数字证书签名请求的签名算法。 |
| [`subject: X509Name`](prop-subject.md) | 解析数字证书签名请求的使用者信息。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init( privateKey: PrivateKey, certificateRequestInfo!: ?X509CertificateRequestInfo = None, signatureAlgorithm!: ?SignatureAlgorithm = None )`](init.md) | 创建数字证书签名请求对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static decodeFromDer(der: DerBlob): X509CertificateRequest`](decodefromder.md) | 将 DER 格式的数字证书签名请求解码。 |
| [`static decodeFromPem(pem: String): Array<X509CertificateRequest>`](decodefrompem.md) | 将数字证书签名请求从 PEM 格式解码。 |
| [`encodeToDer(): DerBlob`](encodetoder.md) | 将数字证书签名请求编码成 Der 格式。 |
| [`encodeToPem(): PemEntry`](encodetopem.md) | 将数字证书签名请求编码成 PEM 格式。 |
| [`override hashCode(): Int64`](hashcode.md) | 返回证书签名请求哈希值。 |
| [`override toString(): String`](tostring.md) | 生成证书签名请求名称字符串，包含证书签名请求的使用者信息。 |
