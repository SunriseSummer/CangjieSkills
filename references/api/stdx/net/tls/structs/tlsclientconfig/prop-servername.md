<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.struct.tlsclientconfig.prop-servername" parent="stdx.net.tls.struct.tlsclientconfig" -->
# TlsClientConfig.serverName

[← TlsClientConfig](index.md)

## 签名

```cangjie role=signature
public mut prop serverName: ?String
```

读写要求的服务端主机地址 (SNI)， `None` 表示不要求。

类型：?String

## 异常

- IllegalArgumentException - 参数有 '\0' 字符时，抛出异常。

