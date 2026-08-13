<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.class.tlssocket.prop-domain" parent="stdx.net.tls.class.tlssocket" -->
# TlsSocket.domain

[← TlsSocket](index.md)

## 签名

```cangjie role=signature
public prop domain: ?String
```

读取协商到的服务端主机名称。

## 契约

异常：

- TlsException - 当套接字未完成 TLS 握手或本端 TLS 套接字已关闭时，抛出异常。

类型：?String
