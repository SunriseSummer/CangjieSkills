<!-- cj-doc kind="api-type" level="5" id="stdx.net.tls.enum.tlsclientidentificationmode" parent="stdx.net.tls" -->
# TlsClientIdentificationMode

[← stdx.net.tls](../../index.md)

`TlsClientIdentificationMode`

服务端对客户端证书的认证模式。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`Disabled`](value-disabled.md) | 表示服务端不校验客户端证书，客户端可以不发送证书和公钥，即单向认证。 |
| [`Optional`](value-optional.md) | 表示服务端校验客户端证书，但客户端可以不提供证书及公钥，不提供时则单向认证，提供时则为双向认证。 |
| [`Required`](value-required.md) | 表示服务端校验客户端证书，并且要求客户端必须提供证书和公钥，即双向认证。 |
