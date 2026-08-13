<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.struct.tlsserverconfig.prop-ciphersuitesv1_3" parent="stdx.net.tls.struct.tlsserverconfig" -->
# TlsServerConfig.cipherSuitesV1_3

[← TlsServerConfig](index.md)

## 签名

```cangjie role=signature
public mut prop cipherSuitesV1_3: Array<String>
```

基于 TLS 1.3 协议下的加密套。

## 契约

类型：Array\<String>

异常：

- IllegalArgumentException - 列表元素有 '\0' 字符时，抛出异常。
