<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.x509.class.x509certificate" parent="stdx.crypto.x509" -->
# X509Certificate

[← stdx.crypto.x509](../../index.md)

`X509Certificate <: Equatable<X509Certificate> & Hashable & ToString`

X509 数字证书是一种用于加密通信的数字证书，它是公钥基础设施（PKI）的核心组件之一。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`dnsNames: Array<String>`](prop-dnsnames.md) | 解析数字证书备选名称中的域名。 |
| [`emailAddresses: Array<String>`](prop-emailaddresses.md) | 解析数字证书备选名称中的 email 地址。 |
| [`extKeyUsage: ExtKeyUsage`](prop-extkeyusage.md) | 解析数字证书中的扩展密钥用法。 |
| [`issuer: X509Name`](prop-issuer.md) | 解析数字证书的颁发者信息。 |
| [`IPAddresses: Array<IP>`](prop-ipaddresses.md) | 解析数字证书备选名称中的 IP 地址。 |
| [`keyUsage: KeyUsage`](prop-keyusage.md) | 解析数字证书中的密钥用法。 |
| [`notAfter: DateTime`](prop-notafter.md) | 解析数字证书的有效期截止时间。 |
| [`notBefore: DateTime`](prop-notbefore.md) | 解析数字证书的有效期开始时间。 |
| [`publicKey: PublicKey`](prop-publickey.md) | 解析数字证书的公钥。 |
| [`publicKeyAlgorithm: PublicKeyAlgorithm`](prop-publickeyalgorithm.md) | 解析数字证书的公钥算法。 |
| [`serialNumber: SerialNumber`](prop-serialnumber.md) | 解析数字证书的序列号。 |
| [`signature: Signature`](prop-signature.md) | 解析数字证书的签名。 |
| [`signatureAlgorithm: SignatureAlgorithm`](prop-signaturealgorithm.md) | 解析数字证书的签名算法。 |
| [`subject: X509Name`](prop-subject.md) | 解析数字证书的使用者信息。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init( certificateInfo: X509CertificateInfo, parent!: X509Certificate, publicKey!: PublicKey, privateKey!: PrivateKey, signatureAlgorithm!: ?SignatureAlgorithm = None )`](init.md) | 创建数字证书对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static decodeFromDer(der: DerBlob): X509Certificate`](decodefromder.md) | 将 DER 格式的数字证书解码。 |
| [`static decodeFromPem(pem: String): Array<X509Certificate>`](decodefrompem.md) | 将数字证书从 PEM 格式解码。 |
| [`encodeToDer(): DerBlob`](encodetoder.md) | 将数字证书编码成 Der 格式。 |
| [`encodeToPem(): PemEntry`](encodetopem.md) | 将数字证书编码成 PEM 格式。 |
| [`override hashCode(): Int64`](hashcode.md) | 返回证书哈希值。 |
| [`static systemRootCerts(): Array<X509Certificate>`](systemrootcerts.md) | 返回操作系统的根证书，支持 Linux，MacOS 和 Windows 平台。 |
| [`override toString(): String`](tostring.md) | 生成证书名称字符串，包含证书的使用者信息、有效期以及颁发者信息。 |
| [`verify(verifyOption: VerifyOption): Bool`](verify.md) | 根据验证选项验证当前证书的有效性。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`override operator !=(other: X509Certificate): Bool`](operator-ne.md) | 判不等。 |
| [`override operator ==(other: X509Certificate): Bool`](operator-eq.md) | 判等。 |
