<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.class.keylesstlsserverconfig.field-keylogcallback" parent="stdx.net.tls.class.keylesstlsserverconfig" -->
# KeylessTlsServerConfig.keylogCallback

[← KeylessTlsServerConfig](index.md)

## 签名

```cangjie role=signature
public var keylogCallback: ?(TlsSocket, String) -> Unit = None
```

握手过程的回调函数，提供 TLS 初始秘钥数据，用于调试和解密记录使用。

类型：?(TlsSocket, String) -> Unit

