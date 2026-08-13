<!-- cj-doc kind="api-type" level="5" id="std.net.class.unixdatagramsocket" parent="std.net" -->
# UnixDatagramSocket

[← std.net](../../index.md)

`UnixDatagramSocket <: DatagramSocket`

提供基于数据包的主机通讯能力。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`override localAddress: SocketAddress`](prop-localaddress.md) | 读取 `socket` 将要或已经绑定的本地地址。 |
| [`mut receiveBufferSize: Int64`](prop-receivebuffersize.md) | 设置和读取 `SO_RCVBUF` 属性，提供一种方式指定发包缓存大小。 |
| [`override mut receiveTimeout: ?Duration`](prop-receivetimeout.md) | 设置和读取 `receive/receiveFrom` 操作超时时间。 |
| [`override remoteAddress: ?SocketAddress`](prop-remoteaddress.md) | 读取 `Socket` 已经连接的远端地址，当 `Socket` 未连接时返回 `None`。 |
| [`mut sendBufferSize: Int64`](prop-sendbuffersize.md) | 设置和读取 `SO_SNDBUF` 属性，提供一种方式指定发包缓存大小。 |
| [`override mut sendTimeout: ?Duration`](prop-sendtimeout.md) | 设置和读取 `send/sendTo` 操作超时时间。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(bindAt!: SocketAddress)`](init.md) | 创建一个未连接的 UnixDatagramSocket 实例。 |
| [`init(bindAt!: String)`](init.md) | 创建一个未连接的 UnixDatagramSocket 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`bind(): Unit`](bind.md) | 绑定一个 `Unix datagram` 套接字，并创建监听队列。 |
| [`override close(): Unit`](close.md) | 关闭套接字，所有操作除了 `close/isClosed` 之外，均不允许再调用。 |
| [`connect(remote: SocketAddress): Unit`](connect.md) | 连接特定远端地址，可通过 `disconnect` 撤销配置。 |
| [`connect(remotePath: String): Unit`](connect.md) | 连接特定远端地址，可通过 `disconnect` 撤销配置。 |
| [`disconnect(): Unit`](disconnect.md) | 停止连接。 |
| [`getSocketOption( level: Int32, option: Int32, value: CPointer<Unit>, valueLength: CPointer<UIntNative> ): Unit`](getsocketoption.md) | 获取指定的套接字参数。 |
| [`getSocketOptionBool( level: Int32, option: Int32 ): Bool`](getsocketoptionbool.md) | 获取指定的套接字参数。 |
| [`getSocketOptionIntNative( level: Int32, option: Int32 ): IntNative`](getsocketoptionintnative.md) | 获取指定的套接字参数。 |
| [`override isClosed(): Bool`](isclosed.md) | 判断套接字是否通过调用 `close` 显式关闭。 |
| [`receive(buffer: Array<Byte>): Int64`](receive.md) | 从 `connect` 连接到的地址收取报文。 |
| [`override receiveFrom(buffer: Array<Byte>): (SocketAddress, Int64)`](receivefrom.md) | 收取报文。 |
| [`send(payload: Array<Byte>): Unit`](send.md) | 发送报文到 `connect` 连接到的地址。 |
| [`override sendTo(recipient: SocketAddress, payload: Array<Byte>): Unit`](sendto.md) | 发送报文。 |
| [`setSocketOption( level: Int32, option: Int32, value: CPointer<Unit>, valueLength: UIntNative ): Unit`](setsocketoption.md) | 设置指定的套接字参数。 |
| [`setSocketOptionBool( level: Int32, option: Int32, value: Bool ): Unit`](setsocketoptionbool.md) | 设置指定的套接字参数。 |
| [`setSocketOptionIntNative( level: Int32, option: Int32, value: IntNative ): Unit`](setsocketoptionintnative.md) | 设置指定的套接字参数。 |
| [`override toString(): String`](tostring.md) | 返回当前 `UDS` 的状态信息。 |
