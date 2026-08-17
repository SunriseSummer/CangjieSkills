<!-- cj-doc kind="api-package" level="4" id="stdx.net.tls.common" parent="api.stdx" -->
# stdx.net.tls.common

[← stdx 包索引](../../../index.md)

定义 TLS 配置、连接、握手结果、会话、版本和证书验证模式等共享抽象，用于适配不同 TLS 实现。

包路径：`stdx.net.tls.common`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`TlsException`](classes/tlsexception/index.md) | TLS 处理出现错误时抛出的异常。 |

## 接口

| 声明 | 功能 |
|---|---|
| [`TlsConfig`](interfaces/tlsconfig/index.md) | TLS 配置接口，用于适配不同的 TLS 实现。 |
| [`TlsConnection`](interfaces/tlsconnection/index.md) | TLS 连接接口，用于适配不同的 TLS 实现。 |
| [`TlsHandshakeResult`](interfaces/tlshandshakeresult/index.md) | TLS 握手结果接口。用于获取 TLS 握手过程中协商得到的信息。 |
| [`TlsKit`](interfaces/tlskit/index.md) | TLS 套件接口。由具体 TLS 实现提供，用于获取 TLS 服务端、客户端连接和服务端会话。 |
| [`TlsSession`](interfaces/tlssession/index.md) | TLS 会话接口。用于记录 TLS 会话信息，由具体 TLS 实现提供和使用。 |

## 枚举

| 声明 | 功能 |
|---|---|
| [`CertificateVerifyMode`](enums/certificateverifymode/index.md) | 对证书验证的处理模式。 |
| [`TlsVersion`](enums/tlsversion/index.md) | TLS 协议版本。 |

## 顶层函数

| 声明 | 功能 |
|---|---|
| [`func getGlobalTlsKit(): TlsKit`](functions/func-getglobaltlskit.md) | 获取当前全局使用的 TLS 套件。 |
| [`func setGlobalTlsKit(kit: TlsKit): Unit`](functions/func-setglobaltlskit-tlskit.md) | 设置全局使用的 TLS 套件。 |
