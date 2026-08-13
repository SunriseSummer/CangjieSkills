<!-- cj-doc kind="api-type" level="5" id="std.net.class.tcpserversocket" parent="std.net" -->
# TcpServerSocket

[← std.net](../../index.md)

`TcpServerSocket <: ServerSocket`

监听 TCP 连接的服务端。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut backlogSize: Int64`](prop-backlogsize.md) | 设置和读取 `backlog` 大小。 |
| [`mut bindToDevice: ?String`](prop-bindtodevice.md) | 设置和读取绑定网卡。 |
| [`override localAddress: SocketAddress`](prop-localaddress.md) | 读取 `Socket` 将要或已经被绑定的本地地址。 |
| [`mut receiveBufferSize: Int64`](prop-receivebuffersize.md) | 设置和读取 `SO_RCVBUF` 属性。 |
| [`mut reuseAddress: Bool`](prop-reuseaddress.md) | 设置和读取 `SO_REUSEADDR` 属性，默认设置为 `true`。 |
| [`mut reusePort: Bool`](prop-reuseport.md) | 设置和读取 `SO_REUSEPORT` 属性。 |
| [`mut sendBufferSize: Int64`](prop-sendbuffersize.md) | 设置和读取 `SO_SNDBUF` 属性。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(bindAt!: SocketAddress)`](init.md) | 创建一个 TcpServerSocket 实例，尚未绑定，因此客户端无法连接。 |
| [`init(bindAt!: UInt16)`](init.md) | 创建一个 TcpServerSocket 实例，尚未绑定，因此客户端无法连接。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`override accept(): TcpSocket`](accept.md) | 监听或接受客户端连接。 |
| [`override accept(timeout!: ?Duration): TcpSocket`](accept.md) | 监听或接受客户端连接。 |
| [`override bind(): Unit`](bind.md) | 绑定本地端口失败后需要 `close` 套接字，不支持多次重试。 |
| [`override close(): Unit`](close.md) | 关闭套接字。 |
| [`getSocketOption( level: Int32, option: Int32, value: CPointer<Unit>, valueLength: CPointer<UIntNative> ): Unit`](getsocketoption.md) | 获取指定的套接字参数。 |
| [`getSocketOptionBool( level: Int32, option: Int32 ): Bool`](getsocketoptionbool.md) | 获取指定的套接字参数。 |
| [`getSocketOptionIntNative( level: Int32, option: Int32 ): IntNative`](getsocketoptionintnative.md) | 获取指定的套接字参数。 |
| [`override isClosed(): Bool`](isclosed.md) | 检查套接字是否关闭。 |
| [`setSocketOption( level: Int32, option: Int32, value: CPointer<Unit>, valueLength: UIntNative ): Unit`](setsocketoption.md) | 设置指定的套接字参数。 |
| [`setSocketOptionBool( level: Int32, option: Int32, value: Bool ): Unit`](setsocketoptionbool.md) | 设置指定的套接字参数。 |
| [`setSocketOptionIntNative( level: Int32, option: Int32, value: IntNative ): Unit`](setsocketoptionintnative.md) | 设置指定的套接字参数。 |
| [`override toString(): String`](tostring.md) | 返回当前 TcpServerSocket 的状态信息。 |
