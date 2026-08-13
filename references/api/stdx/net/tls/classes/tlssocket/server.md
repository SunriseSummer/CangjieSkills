<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.class.tlssocket.server" parent="stdx.net.tls.class.tlssocket" -->
# TlsSocket.server

[← TlsSocket](index.md)

## 签名

```cangjie role=signature
public static func server(
    socket: StreamingSocket,
    sessionContext!: ?TlsSessionContext = None,
    serverConfig!: TlsServerConfig
): TlsSocket
```

根据传入的 StreamingSocket 实例创建指定地址的服务端 TLS 套接字，该套接字可用于服务端 TLS 握手及会话。

## 契约

参数：

- socket: StreamingSocket - TCP 连接建立完成后接受到套接字。
- sessionContext!: ?TlsSessionContext - TLS 会话 id， 若存在可用的 TLS 会话， 则可通过该 id 恢复历史 TLS 会话，省去 TLS 建立连接时间，但使用该会话依然可能协商失败。默认为 None。
- serverConfig!: TlsServerConfig - 服务端配置，默认为 TlsServerConfig()。

返回值：

- TlsSocket - 构造出的 TlsSocket 实例。
