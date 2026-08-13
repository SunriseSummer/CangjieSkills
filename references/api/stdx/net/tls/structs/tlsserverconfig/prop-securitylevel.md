<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.struct.tlsserverconfig.prop-securitylevel" parent="stdx.net.tls.struct.tlsserverconfig" -->
# TlsServerConfig.securityLevel

[← TlsServerConfig](index.md)

## 签名

```cangjie role=signature
public mut prop securityLevel: Int32
```

指定服务端的安全级别，默认值为 2，可选参数值在 [0,5] 内，参数值含义参见 openssl-SSL_CTX_set_security_level 说明。

## 契约

功能：指定服务端的安全级别，默认值为 2，可选参数值在 0-5 内，参数值含义参见 openssl-SSL_CTX_set_security_level 说明。

类型：Int32

异常：

- IllegalArgumentException - 当配置值不在 0-5 范围内时，抛出异常。
