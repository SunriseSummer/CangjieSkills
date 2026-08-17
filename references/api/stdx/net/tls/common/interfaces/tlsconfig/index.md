<!-- cj-doc kind="api-type" level="5" id="stdx.net.tls.common.interface.tlsconfig" parent="stdx.net.tls.common" -->
# TlsConfig

[← stdx.net.tls.common](../../index.md)

`interface TlsConfig`

TLS 配置接口，用于适配不同的 TLS 实现。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut prop certificate: ?(Array<Certificate>, PrivateKey)`](prop-certificate.md) | TLS 服务端或客户端的证书，包括证书链和私钥。 |
| [`mut prop supportedAlpnProtocols: Array<String>`](prop-supportedalpnprotocols.md) | 支持的应用层协议列表。 |
| [`mut prop supportedCipherSuites: Map<TlsVersion, Array<String>>`](prop-supportedciphersuites.md) | 支持的加密套件。 |
| [`mut prop supportedVersions: Array<TlsVersion>`](prop-supportedversions.md) | 支持的 TLS 版本。 |
| [`mut prop verifyMode: CertificateVerifyMode`](prop-verifymode.md) | 证书认证模式。 |

