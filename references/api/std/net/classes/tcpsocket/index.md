<!-- cj-doc kind="api-type" level="5" id="std.net.class.tcpsocket" parent="std.net" -->
# TcpSocket

[← std.net](../../index.md)

`TcpSocket <: StreamingSocket & Equatable<TcpSocket> & Hashable`

请求 TCP 连接的客户端。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut bindToDevice: ?String`](prop-bindtodevice.md) | 设置和读取绑定网卡。 |
| [`mut keepAlive: ?SocketKeepAliveConfig`](prop-keepalive.md) | 设置和读取保活属性，`None` 表示关闭保活。 |
| [`mut linger: ?Duration`](prop-linger.md) | 设置和读取 `SO_LINGER` 属性，默认值取决于系统，`None` 表示禁用此选项。 |
| [`override localAddress: SocketAddress`](prop-localaddress.md) | 读取 `Socket` 将要或已经被绑定的本地地址。 |
| [`mut noDelay: Bool`](prop-nodelay.md) | 设置和读取 `TCP_NODELAY` 属性，默认为 `true`。 |
| [`mut quickAcknowledge: Bool`](prop-quickacknowledge.md) | 设置和读取 `TCP_QUICKACK` 属性，默认为 `false`。 |
| [`override mut readTimeout: ?Duration`](prop-readtimeout.md) | 设置和读取读操作超时时间。 |
| [`mut receiveBufferSize: Int64`](prop-receivebuffersize.md) | 设置和读取 `SO_RCVBUF` 属性，提供一种方式指定收包缓存大小。 |
| [`override remoteAddress: SocketAddress`](prop-remoteaddress.md) | 读取 `Socket` 已经或将要连接的远端地址。 |
| [`mut sendBufferSize: Int64`](prop-sendbuffersize.md) | 设置和读取 `SO_SNDBUF` 属性，提供一种方式指定发包缓存大小。 |
| [`override mut writeTimeout: ?Duration`](prop-writetimeout.md) | 设置和读取写操作超时时间。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(address: SocketAddress)`](init.md) | 创建一个未连接的套接字。 |
| [`init(address: SocketAddress, localAddress!: ?SocketAddress)`](init.md) | 创建一个未连接的套接字，并且绑定到指定本地地址，本地地址为 `None` 时，将随机选定地址去绑定。 |
| [`init(address: String, port: UInt16)`](init.md) | 创建一个未连接的套接字。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`close(): Unit`](close.md) | 关闭套接字，所有操作除了 `close/isClosed` 之外，均不允许再调用。 |
| [`connect(timeout!: ?Duration = None): Unit`](connect.md) | 连接远端套接字，会自动绑定本地地址，因此不需要进行额外的绑定操作。 |
| [`getSocketOption( level: Int32, option: Int32, value: CPointer<Unit>, valueLength: CPointer<UIntNative> ): Unit`](getsocketoption.md) | 读取指定的套接字参数。 |
| [`getSocketOptionBool( level: Int32, option: Int32 ): Bool`](getsocketoptionbool.md) | 读取指定的套接字参数。 |
| [`getSocketOptionIntNative( level: Int32, option: Int32 ): IntNative`](getsocketoptionintnative.md) | 读取指定的套接字参数。 |
| [`override hashCode(): Int64`](hashcode.md) | 获取当前 TcpSocket 实例的哈希值。 |
| [`isClosed(): Bool`](isclosed.md) | 判断套接字是否通过调用 `close` 显式关闭。 |
| [`override read(buffer: Array<Byte>): Int64`](read.md) | 读取报文。 |
| [`setSocketOption( level: Int32, option: Int32, value: CPointer<Unit>, valueLength: UIntNative ): Unit`](setsocketoption.md) | 设置指定的套接字参数。 |
| [`setSocketOptionBool( level: Int32, option: Int32, value: Bool ): Unit`](setsocketoptionbool.md) | 设置指定的套接字参数。 |
| [`setSocketOptionIntNative( level: Int32, option: Int32, value: IntNative ): Unit`](setsocketoptionintnative.md) | 设置指定的套接字参数。 |
| [`override toString(): String`](tostring.md) | 返回当前 TcpSocket 的状态信息。 |
| [`override write(payload: Array<Byte>): Unit`](write.md) | 写入报文。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`override operator !=(other: TcpSocket): Bool`](operator-ne.md) | 判断两个 TcpSocket 实例是否不等。 |
| [`override operator ==(other: TcpSocket): Bool`](operator-eq.md) | 判断两个 TcpSocket 实例是否相等。 |
