<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.class.tlssocket.prop-session" parent="stdx.net.tls.class.tlssocket" -->
# TlsSocket.session

[← TlsSocket](index.md)

## 签名

```cangjie role=signature
public prop session: ?TlsSession
```

读取 TLS 会话 id ，客户端会在握手成功后捕获当前会话的 id ，可使用该 id 重用该会话，省去 TLS 建立连接的时间。

## 契约

功能：读取 TLS 会话 id ，客户端会在握手成功后捕获当前会话的 id ，可使用该 id 重用该会话，省去 TLS 建立连接的时间。连接建立未成功时，返回 None。

>**说明：**
>
> 服务端不做捕获因此始终为 None。

类型：?TlsSession

异常：

- TlsException - 当套接字未完成 TLS 握手，抛出异常。
