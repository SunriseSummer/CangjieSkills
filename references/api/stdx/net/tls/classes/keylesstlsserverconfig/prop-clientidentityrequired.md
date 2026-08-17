<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.class.keylesstlsserverconfig.prop-clientidentityrequired" parent="stdx.net.tls.class.keylesstlsserverconfig" -->
# KeylessTlsServerConfig.clientIdentityRequired

[← KeylessTlsServerConfig](index.md)

## 签名

```cangjie role=signature
public mut prop clientIdentityRequired: TlsClientIdentificationMode
```

设置或获取服务端要求客户端的认证模式，默认值为 TlsClientIdentificationMode.Disable，即不要求客户端认证服务端证书，也不要求客户端发送本端证书。

类型：TlsClientIdentificationMode

