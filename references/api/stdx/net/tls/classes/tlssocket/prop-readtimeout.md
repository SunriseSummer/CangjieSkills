<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.class.tlssocket.prop-readtimeout" parent="stdx.net.tls.class.tlssocket" -->
# TlsSocket.readTimeout

[← TlsSocket](index.md)

## 签名

```cangjie role=signature
public override mut prop readTimeout: ?Duration
```

读写 TlsSocket 的读超时时间。

## 契约

类型：?Duration

异常：

- SocketException - 本端建连的底层 TCP 套接字关闭，抛出异常。
- TlsException - 本端配置为 TLS 的套接字已关闭时，抛出异常。
- IllegalArgumentException - 设定的读超时时间为负值时，抛出异常。
