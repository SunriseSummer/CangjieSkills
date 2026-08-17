<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.struct.tlsclientconfig.prop-supportedalpnprotocols" parent="stdx.net.tls.struct.tlsclientconfig" -->
# TlsClientConfig.supportedAlpnProtocols

[← TlsClientConfig](index.md)

## 签名

```cangjie role=signature
public mut prop supportedAlpnProtocols: Array<String>
```

应用层协商协议，若列表为空，则客户端将不协商应用层协议。

类型：Array<String>

## 异常

- IllegalArgumentException - 列表元素有 '\0' 字符时，抛出异常。

