<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.struct.tlsserverconfig.field-clientidentityrequired" parent="stdx.net.tls.struct.tlsserverconfig" -->
# TlsServerConfig.clientIdentityRequired

[← TlsServerConfig](index.md)

## 签名

```cangjie role=signature
public var clientIdentityRequired: TlsClientIdentificationMode = Disabled
```

设置或获取服务端要求客户端的认证模式，默认值为不要求客户端认证服务端证书，也不要求客户端发送本端证书。

## 契约

类型：TlsClientIdentificationMode
