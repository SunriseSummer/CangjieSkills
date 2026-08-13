<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.class.tlssocket.prop-clientcertificate" parent="stdx.net.tls.class.tlssocket" -->
# TlsSocket.clientCertificate

[← TlsSocket](index.md)

## 签名

```cangjie role=signature
public prop clientCertificate: ?Array<X509Certificate>
```

客户端提供的客户端证书。

## 契约

功能：客户端提供的客户端证书。在客户端获取时为本端证书，在服务端获取时为对端证书。

> **注意：**
>
> 获取对端证书时，如果对端没有发送证书，该接口可能获取失败，返回 None，详见 peerCertificate。

类型：?Array<X509Certificate>

异常：

- TlsException - 当套接字未完成 TLS 握手或本端 TLS 套接字已关闭时，抛出异常。
