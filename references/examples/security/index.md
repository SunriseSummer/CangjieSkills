<!-- cj-doc kind="example-category" level="3" id="examples.security" parent="examples" -->
# 密码、TLS 与证书

[← 应用示例](../index.md)

选择正确的加密与签名组合，显式配置证书信任边界，并构造可重复的 X.509 验证条件。

| 示例 | 教学目标 |
|---|---|
| [用 RSA-OAEP 加密并签名密文](rsa-signed-envelope.md) | RSA-OAEP 加密短消息，对密文的 SHA-256 摘要做 PKCS#1 签名；验签成功后再解密。 |
| [为 HTTP 客户端配置 TLS 自定义 CA](tls-custom-ca.md) | 把解码后的证书放入 `CustomCA`，写入 `TlsClientConfig.verifyMode`，并通过 `ClientBuilder.tlsConfig` 装配客户端。 |
| [配置可重复的 X.509 验证](x509-verify-option.md) | 零参构造 VerifyOption，再显式设置根证书、域名和验证时间，避免环境默认值造成不确定性。 |
