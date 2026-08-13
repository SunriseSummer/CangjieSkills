<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.class.tlssocket.handshake" parent="stdx.net.tls.class.tlssocket" -->
# TlsSocket.handshake

[← TlsSocket](index.md)

## 签名

```cangjie role=signature
public func handshake(timeout!: ?Duration = None): Unit
```

TLS 握手。

## 契约

功能：TLS 握手。不支持重新协商握手，因此只能被调用一次。调用对象可以为客户端或者服务端的 TlsSocket。

参数：

- timeout!: ?Duration - 握手超时时间，默认为 None 不对超时时间进行设置，此时采用默认 30s 的超时时间。

异常：

- SocketException - 本端建连的底层 TCP 套接字关闭，抛出异常。
- SocketTimeoutException - 底层 TCP 套接字连接超时时，抛出异常。
- TlsException - 当握手已经开始或者已经结束，抛出异常；或当握手阶段出现系统错误时，抛出异常。
- IllegalArgumentException - 设定的握手超时时间为负值时，抛出异常。
