<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.class.tlssocket.prop-certificate" parent="stdx.net.tls.class.tlssocket" -->
# TlsSocket.certificate

[← TlsSocket](index.md)

## 签名

```cangjie role=signature
public prop certificate: Array<X509Certificate>
```

获取本端证书。

类型：?Array<X509Certificate>

## 异常

- TlsException - 当套接字未完成 TLS 握手或本端 TLS 套接字已关闭时，抛出异常。

