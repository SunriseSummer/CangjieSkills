<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.class.keylesstlsserverconfig.prop-supportedalpnprotocols" parent="stdx.net.tls.class.keylesstlsserverconfig" -->
# KeylessTlsServerConfig.supportedAlpnProtocols

[← KeylessTlsServerConfig](index.md)

## 签名

```cangjie role=signature
public mut prop supportedAlpnProtocols: Array<String>
```

应用层协商协议，若客户端尝试协商该协议，服务端将与选取其中相交的协议名称。若客户端未尝试协商协议，则该配置将被忽略。

类型：Array<String>

## 异常

- IllegalArgumentException - 列表元素有 '\0' 字符时，抛出异常。

