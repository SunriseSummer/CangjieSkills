<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.class.tlssocket.prop-peercertificate" parent="stdx.net.tls.class.tlssocket" -->
# TlsSocket.peerCertificate

[← TlsSocket](index.md)

## 签名

```cangjie role=signature
public prop peerCertificate: ?Array<X509Certificate>
```

获取对端证书。

## 契约

功能：获取对端证书。在客户端获取时同 serverCertificate，在服务端获取时同 clientCertificate。

> **注意：**
>
> - 如果握手时没有要求对端发送证书，此处将无法获取对端证书，返回 None。
>
> - 通过 session 机制恢复连接时，双方都不发送证书，该接口行为如下：
>
>     - 在服务端，如果被恢复的原始连接建立时获取了对端证书，服务端将缓存对端证书，并在此处获取到缓存的证书；
>     - 在客户端，不缓存原始连接的对端证书，此处将无法获取对端证书，返回 None。

类型：?Array<X509Certificate>

异常：

- TlsException - 当套接字未完成 TLS 握手或本端 TLS 套接字已关闭时，抛出异常。
