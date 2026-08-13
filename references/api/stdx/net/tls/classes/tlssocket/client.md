<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.class.tlssocket.client" parent="stdx.net.tls.class.tlssocket" -->
# TlsSocket.client

[← TlsSocket](index.md)

## 签名

```cangjie role=signature
public static func client(
    socket: StreamingSocket,
    session!: ?TlsSession = None,
    clientConfig!: TlsClientConfig = TlsClientConfig()
): TlsSocket
```

根据传入的 StreamingSocket 实例创建指定地址的客户端 TLS 套接字，该套接字可用于客户端 TLS 握手及会话。

## 契约

参数：

- socket: StreamingSocket - 已连接到服务端的客户端 TCP 套接字。
- session!: ?TlsSession - TLS 会话 id，若存在可用的 TLS 会话， 则可通过该 id 恢复历史 TLS 会话，省去 TLS 建立连接时间，但使用该会话依然可能协商失败。默认为 `None`。
- clientConfig!: TlsClientConfig - 客户端配置，默认为 TlsClientConfig()。

返回值：

- TlsSocket - 构造出的 TlsSocket 实例。
