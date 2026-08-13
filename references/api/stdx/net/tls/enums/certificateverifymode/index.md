<!-- cj-doc kind="api-type" level="5" id="stdx.net.tls.enum.certificateverifymode" parent="stdx.net.tls" -->
# CertificateVerifyMode

[← stdx.net.tls](../../index.md)

`CertificateVerifyMode`

TLS 证书验证模式；自定义 CA 使用 `CertificateVerifyMode.CustomCA(certificates)`，不要把 `CustomCA` 当作包级符号显式导入。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`CustomCA(Array<X509Certificate>)`](value-customca-array-x509certificate.md) | 表示根据提供的 CA 列表与系统 CA 进行验证。 |
| [`Default`](value-default.md) | 表示默认验证模式，根据系统 CA 验证证书。 |
| [`TrustAll`](value-trustall.md) | 表示信任所有证书。 |
