<!-- cj-doc kind="api-type" level="5" id="std.net.class.udpsocket" parent="std.net" -->
# UdpSocket

[← std.net](../../index.md)

`UdpSocket <: DatagramSocket`

提供 udp 报文通信。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`override localAddress: SocketAddress`](prop-localaddress.md) | 读取 `Socket` 将要或已经被绑定的本地地址。 |
| [`mut receiveBufferSize: Int64`](prop-receivebuffersize.md) | 设置和读取 `SO_RCVBUF` 属性。 |
| [`override mut receiveTimeout: ?Duration`](prop-receivetimeout.md) | 设置和读取 `receive/receiveFrom` 操作超时时间。 |
| [`override remoteAddress: ?SocketAddress`](prop-remoteaddress.md) | 读取 `Socket` 已经连接的远端地址，当 `Socket` 未连接时返回 `None`。 |
| [`mut reuseAddress: Bool`](prop-reuseaddress.md) | 设置和读取 `SO_REUSEADDR` 属性。 |
| [`mut reusePort: Bool`](prop-reuseport.md) | 设置和读取 `SO_REUSEPORT` 属性。 |
| [`mut sendBufferSize: Int64`](prop-sendbuffersize.md) | 设置和读取 `SO_SNDBUF` 属性。 |
| [`override mut sendTimeout: ?Duration`](prop-sendtimeout.md) | 设置和读取 `send/sendTo` 操作超时时间。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(bindAt!: SocketAddress)`](init.md) | 创建一个未绑定的 `UdpSocket` 实例。 |
| [`init(bindAt!: UInt16)`](init.md) | 创建一个未绑定的 `UdpSocket` 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`bind(): Unit`](bind.md) | 绑定本地端口失败后需要 `close` 套接字，不支持多次重试。 |
| [`override close(): Unit`](close.md) | 关闭套接字，所有操作除了 `close/isClosed` 之外，均不允许再调用。 |
| [`connect(remote: SocketAddress): Unit`](connect.md) | 连接特定远端地址，可通过 `disconnect` 撤销配置。 |
| [`disconnect(): Unit`](disconnect.md) | 停止连接。 |
| [`getSocketOption( level: Int32, option: Int32, value: CPointer<Unit>, valueLength: CPointer<UIntNative> ): Unit`](getsocketoption.md) | 获取指定的套接字参数。 |
| [`getSocketOptionBool( level: Int32, option: Int32 ): Bool`](getsocketoptionbool.md) | 获取指定的套接字参数。 |
| [`getSocketOptionIntNative( level: Int32, option: Int32 ): IntNative`](getsocketoptionintnative.md) | 获取指定的套接字参数。 |
| [`override isClosed(): Bool`](isclosed.md) | 判断套接字是否通过调用 `close` 显式关闭。 |
| [`receive(buffer: Array<Byte>): Int64`](receive.md) | 从 `connect` 连接到的地址收取报文。 |
| [`override receiveFrom(buffer: Array<Byte>): (SocketAddress, Int64)`](receivefrom.md) | 接收报文。 |
| [`send(payload: Array<Byte>): Unit`](send.md) | 发送报文到 `connect` 连接到的地址。 |
| [`override sendTo(recipient: SocketAddress, payload: Array<Byte>): Unit`](sendto.md) | 发送报文。 |
| [`setSocketOption( level: Int32, option: Int32, value: CPointer<Unit>, valueLength: UIntNative ): Unit`](setsocketoption.md) | 设置指定的套接字参数。 |
| [`setSocketOptionBool( level: Int32, option: Int32, value: Bool ): Unit`](setsocketoptionbool.md) | 设置指定的套接字参数。 |
| [`setSocketOptionIntNative( level: Int32, option: Int32, value: IntNative ): Unit`](setsocketoptionintnative.md) | 设置指定的套接字参数。 |
| [`override toString(): String`](tostring.md) | 返回当前 UdpSocket 的状态信息。 |
