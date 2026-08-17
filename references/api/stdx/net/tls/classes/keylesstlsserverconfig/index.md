<!-- cj-doc kind="api-type" level="5" id="stdx.net.tls.class.keylesstlsserverconfig" parent="stdx.net.tls" -->
# KeylessTlsServerConfig

[← stdx.net.tls](../../index.md)

`class KeylessTlsServerConfig <: TlsConfig`

提供无私钥握手的服务端配置。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`var keylogCallback: ?(TlsSocket, String) -> Unit = None`](field-keylogcallback.md) | 握手过程的回调函数，提供 TLS 初始秘钥数据，用于调试和解密记录使用。 |
| [`mut prop certificate: ?(Array<Certificate>, PrivateKey)`](prop-certificate.md) | 设置或获取服务端证书和对应的私钥文件。其中证书必须为 X509Certificate 类型。不可设置为 None。 |
| [`mut prop clientIdentityRequired: TlsClientIdentificationMode`](prop-clientidentityrequired.md) | 设置或获取服务端要求客户端的认证模式，默认值为 TlsClientIdentificationMode.Disable，即不要求客户端认证服务端证书，也不要求客户端发送本端证书。 |
| [`mut prop dhParameters: ?DHParameters`](prop-dhparameters.md) | 指定服务端的 DH 密钥参数，默认为 `None`， 默认情况下使用 openssl 自动生成的参数值。 |
| [`mut prop securityLevel: Int32`](prop-securitylevel.md) | 指定服务端的安全级别，默认值为 2，可选参数值在 [0,5] 内，参数值含义参见 openssl-SSL_CTX_set_security_level 说明。 |
| [`mut prop supportedAlpnProtocols: Array<String>`](prop-supportedalpnprotocols.md) | 应用层协商协议，若客户端尝试协商该协议，服务端将与选取其中相交的协议名称。若客户端未尝试协商协议，则该配置将被忽略。 |
| [`mut prop supportedCipherSuites: Map<TlsVersion, Array<String>>`](prop-supportedciphersuites.md) | 设置或获取每个 TLS 版本对应的密码套件。 |
| [`mut prop supportedVersions: Array<TlsVersion>`](prop-supportedversions.md) | 设置或获取支持的 TLS 版本。 |
| [`mut prop verifyMode: CertificateVerifyMode`](prop-verifymode.md) | 设置或获取认证模式，默认值为 CertificateVerifyMode.Default，即认证系统证书。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(certChain: Array<X509Certificate>, signCallback: KeylessSignFunc, decryptCallback!: ?KeylessDecryptFunc = None<KeylessDecryptFunc>)`](init.md) | 构造 KeylessTlsServerConfig 对象。 |

