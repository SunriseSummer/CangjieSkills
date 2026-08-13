<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.class.tlssocket.close" parent="stdx.net.tls.class.tlssocket" -->
# TlsSocket.close

[← TlsSocket](index.md)

## 签名

```cangjie role=signature
public func close(): Unit
```

关闭套接字。

## 契约

异常：

- SocketException - 底层连接无法关闭时，抛出异常。
