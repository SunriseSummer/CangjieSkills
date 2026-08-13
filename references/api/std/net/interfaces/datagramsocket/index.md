<!-- cj-doc kind="api-type" level="5" id="std.net.interface.datagramsocket" parent="std.net" -->
# DatagramSocket

[← std.net](../../index.md)

`DatagramSocket <: Resource & ToString`

DatagramSocket 是一种接收和读取数据包的套接字。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`localAddress: SocketAddress`](prop-localaddress.md) | 读取 `Socket` 将要或已经被绑定的本地地址。 |
| [`mut receiveTimeout: ?Duration`](prop-receivetimeout.md) | 设置和读取 `receiveFrom` 超时时间，无超时时间设置为 `None`。 |
| [`remoteAddress: ?SocketAddress`](prop-remoteaddress.md) | 读取 `Socket` 已经连接的远端地址，当 `Socket` 未连接时返回 None。 |
| [`mut sendTimeout: ?Duration`](prop-sendtimeout.md) | 设置和读取 `sendTo` 超时时间，默认设置为 `None`。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`receiveFrom(buffer: Array<Byte>): (SocketAddress, Int64)`](receivefrom.md) | 阻塞式等待收取报文到 `buffer` 中。 |
| [`sendTo(address: SocketAddress, payload: Array<Byte>): Unit`](sendto.md) | 发送报文到指定的远端地址，当对端无足够缓存时，此操作可能被阻塞，报文可能被丢弃。 |
