<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.struct.tlsserverconfig.init" parent="stdx.net.tls.struct.tlsserverconfig" -->
# TlsServerConfig.init

[← TlsServerConfig](index.md)

## 签名

```cangjie role=signature
public init(certChain: Array<X509Certificate>, certKey: PrivateKey)
```

构造 TlsServerConfig 对象。

## 契约

参数：

- certChain: Array\<X509Certificate> - 证书对象。
- certKey: PrivateKey - 私钥对象。
