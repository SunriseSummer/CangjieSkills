<!-- cj-doc kind="api-type" level="5" id="std.net.class.unixsocket" parent="std.net" -->
# UnixSocket

[← std.net](../../index.md)

`UnixSocket <: StreamingSocket`

提供基于双工流的主机通讯客户端。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`override localAddress: SocketAddress`](prop-localaddress.md) | 读取 `Socket` 将要或已经被绑定的本地地址。 |
| [`override mut readTimeout: ?Duration`](prop-readtimeout.md) | 设置和读取读操作超时时间。 |
| [`mut receiveBufferSize: Int64`](prop-receivebuffersize.md) | 设置和读取 `SO_RCVBUF` 属性。 |
| [`override remoteAddress: SocketAddress`](prop-remoteaddress.md) | 读取 `Socket` 已经或将要连接的远端地址。 |
| [`mut sendBufferSize: Int64`](prop-sendbuffersize.md) | 设置和读取 `SO_SNDBUF` 属性。 |
| [`override mut writeTimeout: ?Duration`](prop-writetimeout.md) | 设置和读取写操作超时时间。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(address: SocketAddress, localAddress!: ?SocketAddress = None)`](init.md) | 创建一个未连接的 UnixSocket 实例。 |
| [`init(path: String, localPath!: ?String = None)`](init.md) | 创建一个未连接的 UnixSocket 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`close(): Unit`](close.md) | 关闭套接字，所有操作除了 `close/isClosed` 之外，均不允许再调用。 |
| [`connect(timeout!: ?Duration = None): Unit`](connect.md) | 建立远端连接，对端拒绝时连接失败，会自动绑定本地地址，因此不需要进行额外的绑定操作。 |
| [`getSocketOption( level: Int32, option: Int32, value: CPointer<Unit>, valueLength: CPointer<UIntNative> ): Unit`](getsocketoption.md) | 获取指定的套接字参数。 |
| [`getSocketOptionBool( level: Int32, option: Int32 ): Bool`](getsocketoptionbool.md) | 获取指定的套接字参数。 |
| [`getSocketOptionIntNative( level: Int32, option: Int32 ): IntNative`](getsocketoptionintnative.md) | 获取指定的套接字参数。 |
| [`isClosed(): Bool`](isclosed.md) | 判断套接字是否通过调用 `close` 显式关闭。 |
| [`override read(buffer: Array<Byte>): Int64`](read.md) | 读取报文。 |
| [`setSocketOption( level: Int32, option: Int32, value: CPointer<Unit>, valueLength: UIntNative ): Unit`](setsocketoption.md) | 设置指定的套接字参数。 |
| [`setSocketOptionBool( level: Int32, option: Int32, value: Bool ): Unit`](setsocketoptionbool.md) | 设置指定的套接字参数。 |
| [`setSocketOptionIntNative( level: Int32, option: Int32, value: IntNative ): Unit`](setsocketoptionintnative.md) | 设置指定的套接字参数。 |
| [`override toString(): String`](tostring.md) | 返回当前 UnixSocket 的状态信息。 |
| [`override write(buffer: Array<Byte>): Unit`](write.md) | 读取写入。 |
