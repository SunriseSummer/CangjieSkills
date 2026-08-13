<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.struct.tlsclientconfig.field-keylogcallback" parent="stdx.net.tls.struct.tlsclientconfig" -->
# TlsClientConfig.keylogCallback

[← TlsClientConfig](index.md)

## 签名

```cangjie role=signature
public var keylogCallback: ?(TlsSocket, String) -> Unit = None
```

握手过程的回调函数，提供 TLS 初始秘钥数据，用于调试和解密记录使用。

## 契约

类型：?(TlsSocket, String) -> Unit
