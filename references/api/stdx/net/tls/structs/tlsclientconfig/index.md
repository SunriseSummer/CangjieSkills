<!-- cj-doc kind="api-type" level="5" id="stdx.net.tls.struct.tlsclientconfig" parent="stdx.net.tls" -->
# TlsClientConfig

[← stdx.net.tls](../../index.md)

`TlsClientConfig`

客户端配置。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`keylogCallback: ?(TlsSocket, String) -> Unit = None`](field-keylogcallback.md) | 握手过程的回调函数，提供 TLS 初始秘钥数据，用于调试和解密记录使用。 |
| [`verifyMode: CertificateVerifyMode = CertificateVerifyMode.Default`](field-verifymode.md) | 设置或获取证书的认证模式，默认为 `Default`。 |
| [`mut alpnProtocolsList: Array<String>`](prop-alpnprotocolslist.md) | 要求的应用层协议名称。 |
| [`mut cipherSuitesV1_2: ?Array<String>`](prop-ciphersuitesv1_2.md) | 基于 TLS 1.2 协议下的加密套。 |
| [`mut cipherSuitesV1_3: ?Array<String>`](prop-ciphersuitesv1_3.md) | 基于 TLS 1.3 协议下的加密套。 |
| [`mut clientCertificate: ?(Array<X509Certificate>, PrivateKey)`](prop-clientcertificate.md) | 客户端证书和私钥。 |
| [`mut domain: ?String`](prop-domain.md) | 读写要求的服务端主机地址（SNI），`None` 表示不要求。 |
| [`mut maxVersion: TlsVersion`](prop-maxversion.md) | 支持的 TLS 最大的版本。 |
| [`mut minVersion: TlsVersion`](prop-minversion.md) | 支持的 TLS 最小版本。 |
| [`mut securityLevel: Int32`](prop-securitylevel.md) | 指定客户端的安全级别，默认值为 2，可选参数值在 0-5 内，参数值含义参见 openssl-SSL_CTX_set_security_level 说明。 |
| [`mut signatureAlgorithms: ?Array<SignatureAlgorithm>`](prop-signaturealgorithms.md) | 指定保序的签名和哈希算法。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造 TlsClientConfig。 |
