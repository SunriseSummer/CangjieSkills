<!-- cj-doc kind="api-package" level="4" id="stdx.net.tls" parent="api.stdx" -->
# stdx.net.tls

[← stdx 包索引](../../index.md)

创建 TLS 客户端/服务端，执行握手、加密收发和会话恢复。

包路径：`stdx.net.tls`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`TlsSessionContext <: Equatable<TlsSessionContext> & ToString`](classes/tlssessioncontext/index.md) | 该类表示 TLS 会话上下文，给客户端提供信息，确保客户端所连接的服务端仍为相同实例，用于连接复用时，验证客户端合法性。 |
| [`TlsSocket <: StreamingSocket & ToString &Equatable<TlsSocket> & Hashable`](classes/tlssocket/index.md) | TlsSocket 用于在客户端及服务端间创建加密传输通道。 |
| [`TlsException <: Exception`](classes/tlsexception/index.md) | TLS 处理出现错误时抛出的异常。 |

## 结构体

| 声明 | 功能 |
|---|---|
| [`CipherSuite <: ToString & Equatable<CipherSuite>`](structs/ciphersuite/index.md) | TLS 中的密码套件。 |
| [`TlsClientConfig`](structs/tlsclientconfig/index.md) | 客户端配置。 |
| [`TlsServerConfig`](structs/tlsserverconfig/index.md) | 服务端配置。 |
| [`TlsSession <: Equatable<TlsSession> & ToString & Hashable`](structs/tlssession/index.md) | 此结构体表示已建立的客户端会话。 |

## 枚举

| 声明 | 功能 |
|---|---|
| [`CertificateVerifyMode`](enums/certificateverifymode/index.md) | TLS 证书验证模式；自定义 CA 使用 `CertificateVerifyMode.CustomCA(certificates)`，不要把 `CustomCA` 当作包级符号显式导入。 |
| [`SignatureAlgorithm <: ToString & Equatable<SignatureAlgorithm>`](enums/signaturealgorithm/index.md) | 签名算法类型，签名算法用于确保传输数据的身份验证、完整性和真实性。 |
| [`SignatureSchemeType <: ToString & Equatable<SignatureSchemeType>`](enums/signatureschemetype/index.md) | 加密算法类型，用于保护网络通信的安全性和隐私性。 |
| [`SignatureType <: ToString & Equatable<SignatureType>`](enums/signaturetype/index.md) | 签名算法类型，用于认证真实性。 |
| [`TlsClientIdentificationMode`](enums/tlsclientidentificationmode/index.md) | 服务端对客户端证书的认证模式。 |
| [`TlsVersion <: ToString`](enums/tlsversion/index.md) | TLS 协议版本。 |
