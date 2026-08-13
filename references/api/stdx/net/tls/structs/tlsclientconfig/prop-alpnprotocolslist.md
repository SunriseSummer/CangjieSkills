<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.struct.tlsclientconfig.prop-alpnprotocolslist" parent="stdx.net.tls.struct.tlsclientconfig" -->
# TlsClientConfig.alpnProtocolsList

[← TlsClientConfig](index.md)

## 签名

```cangjie role=signature
public mut prop alpnProtocolsList: Array<String>
```

要求的应用层协议名称。

## 契约

功能：要求的应用层协议名称。若列表为空，则客户端将不协商应用层协议。

类型：Array\<String>

异常：

- IllegalArgumentException - 列表元素有 '\0' 字符时，抛出异常。
