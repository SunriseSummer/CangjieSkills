<!-- cj-doc kind="api-type" level="5" id="stdx.net.tls.common.enum.certificateverifymode" parent="stdx.net.tls.common" -->
# CertificateVerifyMode

[← stdx.net.tls.common](../../index.md)

`enum CertificateVerifyMode`

对证书验证的处理模式。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`CustomCA(Array<Certificate>)（2 个重载）`](init.md) | 表示根据提供的 CA 列表与系统 CA 进行验证。 |

## 枚举值

| 签名 | 功能 |
|---|---|
| [`Default`](value-default.md) | 表示默认验证模式，根据系统 CA 验证证书。 |
| [`TrustAll`](value-trustall.md) | 表示信任所有证书。 |

