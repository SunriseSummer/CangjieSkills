<!-- cj-doc kind="api-type" level="5" id="std.net.interface.serversocket" parent="std.net" -->
# ServerSocket

[← std.net](../../index.md)

`ServerSocket <: Resource & ToString`

提供服务端的 `Socket` 需要的接口。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`localAddress: SocketAddress`](prop-localaddress.md) | 读取 `Socket` 将要或已经被绑定的本地地址。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`accept(): StreamingSocket`](accept.md) | 接受一个客户端套接字的连接请求，阻塞式等待连接请求。 |
| [`accept(timeout!: ?Duration): StreamingSocket`](accept.md) | 接受一个客户端套接字的连接请求，阻塞式等待连接请求。 |
| [`bind(): Unit`](bind.md) | 绑定套接字。 |
