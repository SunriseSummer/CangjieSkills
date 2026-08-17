<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.common.interface.tlskit.gettlsserver" parent="stdx.net.tls.common.interface.tlskit" -->
# TlsKit.getTlsServer

[← TlsKit](index.md)

## 签名

```cangjie role=signature
func getTlsServer(socket: StreamingSocket, config: TlsConfig, session!: ?TlsSession): TlsConnection
```

根据传入的 StreamingSocket 实例创建服务端 TLS 连接，该连接可用于 TLS 握手。

## 参数

- socket: StreamingSocket - TCP 连接建立完成后得到的 socket。
- config: TlsConfig - 服务端 TLS 配置。
- session!: ?TlsSession - TLS 会话。若存在可用的 TLS 会话，则可通过该会话恢复，省去 TLS 建立连接时间。

## 返回值

- TlsConnection - 构造出的服务端 TLS 连接。

