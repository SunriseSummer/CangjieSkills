<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.class.tlssocket.prop-tlsversion" parent="stdx.net.tls.class.tlssocket" -->
# TlsSocket.tlsVersion

[← TlsSocket](index.md)

## 签名

```cangjie role=signature
public prop tlsVersion: TlsVersion
```

读取协商到的 TLS 版本。

## 契约

类型：TlsVersion

异常：

- TlsException - 当套接字未完成 TLS 握手或本端 TLS 套接字已关闭时，抛出异常。
