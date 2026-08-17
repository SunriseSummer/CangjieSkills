<!-- cj-doc kind="api-package" level="4" id="stdx.net.tls" parent="api.stdx" -->
# stdx.net.tls

[← stdx 包索引](../../index.md)

创建 TLS 客户端/服务端，执行握手、加密收发和会话恢复。

包路径：`stdx.net.tls`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`TlsSocket <: StreamingSocket & ToString &Equatable<TlsSocket> & Hashable`](classes/tlssocket/index.md) | TlsSocket 用于在客户端及服务端间创建加密传输通道。 |
| [`DefaultTlsKit`](classes/defaulttlskit/index.md) | TlsKit 的默认实现。用于获取 TLS 服务端、客户端连接和服务端会话。 |
| [`KeylessTlsServerConfig`](classes/keylesstlsserverconfig/index.md) | 提供无私钥握手的服务端配置。 |
| [`TlsClientSession`](classes/tlsclientsession/index.md) | 此结构体表示已建立的客户端会话。此结构体实例用户不可创建，其内部结构对用户不可见。 |
| [`TlsServerSession`](classes/tlsserversession/index.md) | 该类表示 TLS 会话上下文，给客户端提供信息，确保客户端所连接的服务端仍为相同实例，用于连接复用时，验证客户端合法性。 |

## 结构体

| 声明 | 功能 |
|---|---|
| [`CipherSuite <: ToString & Equatable<CipherSuite>`](structs/ciphersuite/index.md) | TLS 中的密码套件。 |
| [`TlsClientConfig`](structs/tlsclientconfig/index.md) | 客户端配置。 |
| [`TlsServerConfig`](structs/tlsserverconfig/index.md) | 服务端配置。 |

## 枚举

| 声明 | 功能 |
|---|---|
| [`SignatureAlgorithm <: ToString & Equatable<SignatureAlgorithm>`](enums/signaturealgorithm/index.md) | 签名算法类型，签名算法用于确保传输数据的身份验证、完整性和真实性。 |
| [`SignatureSchemeType <: ToString & Equatable<SignatureSchemeType>`](enums/signatureschemetype/index.md) | 加密算法类型，用于保护网络通信的安全性和隐私性。 |
| [`SignatureType <: ToString & Equatable<SignatureType>`](enums/signaturetype/index.md) | 签名算法类型，用于认证真实性。 |
| [`TlsClientIdentificationMode`](enums/tlsclientidentificationmode/index.md) | 服务端对客户端证书的认证模式。 |

## 类型别名

| 声明 | 功能 |
|---|---|
| [`type KeylessDecryptFunc = (cipherText: Array<Byte>) -> Array<Byte>`](types/type-keylessdecryptfunc.md) | 供无私钥握手使用的解密回调函数类型。 |
| [`type KeylessSignFunc = (hashValue: Array<Byte>) -> Array<Byte>`](types/type-keylesssignfunc.md) | 供无私钥握手使用的签名回调函数类型。 |
