<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.class.tlssocket.prop-alpnprotocolname" parent="stdx.net.tls.class.tlssocket" -->
# TlsSocket.alpnProtocolName

[← TlsSocket](index.md)

## 签名

```cangjie role=signature
public prop alpnProtocolName: ?String
```

读取协商到的应用层协议名称。

## 契约

类型：?String

异常：

- TlsException - 当套接字未完成 TLS 握手或本端 TLS 套接字已关闭时，抛出异常。
- IllegalMemoryException - 当内存申请失败时，抛出异常。
