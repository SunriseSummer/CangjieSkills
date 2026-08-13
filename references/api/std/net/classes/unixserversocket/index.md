<!-- cj-doc kind="api-type" level="5" id="std.net.class.unixserversocket" parent="std.net" -->
# UnixServerSocket

[← std.net](../../index.md)

`UnixServerSocket <: ServerSocket`

提供基于双工流的主机通讯服务端。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut backlogSize: Int64`](prop-backlogsize.md) | 设置和读取 `backlog` 大小。 |
| [`override localAddress: SocketAddress`](prop-localaddress.md) | 读取 `Socket` 将要或已经被绑定的本地地址。 |
| [`mut receiveBufferSize: Int64`](prop-receivebuffersize.md) | 设置和读取 `SO_RCVBUF` 属性。 |
| [`mut sendBufferSize: Int64`](prop-sendbuffersize.md) | 设置和读取 `SO_SNDBUF` 属性。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(bindAt!: SocketAddress)`](init.md) | 创建一个未连接的 UnixServerSocket 实例。 |
| [`init(bindAt!: String)`](init.md) | 创建一个未连接的 UnixServerSocket 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`override accept(): UnixSocket`](accept.md) | 等待接受一个客户端的连接，或从队列中读取连接。 |
| [`override accept(timeout!: ?Duration): UnixSocket`](accept.md) | 等待接受一个客户端的连接，或从队列中读取连接。 |
| [`override bind(): Unit`](bind.md) | 绑定一个 `Unix domain` 套接字，并创建监听队列。 |
| [`override close(): Unit`](close.md) | 关闭套接字，该套接字的所有操作除了 `close/isClosed` 之外，均不允许再调用。 |
| [`getSocketOption( level: Int32, option: Int32, value: CPointer<Unit>, valueLength: CPointer<UIntNative> ): Unit`](getsocketoption.md) | 获取指定的套接字参数。 |
| [`getSocketOptionBool( level: Int32, option: Int32 ): Bool`](getsocketoptionbool.md) | 获取指定的套接字参数。 |
| [`getSocketOptionIntNative( level: Int32, option: Int32 ): IntNative`](getsocketoptionintnative.md) | 获取返回值为整型的套接字参数。 |
| [`override isClosed(): Bool`](isclosed.md) | 判断套接字是否通过调用 `close` 显式关闭。 |
| [`setSocketOption( level: Int32, option: Int32, value: CPointer<Unit>, valueLength: UIntNative ): Unit`](setsocketoption.md) | 设置返回值为整型的套接字参数。 |
| [`setSocketOptionBool( level: Int32, option: Int32, value: Bool ): Unit`](setsocketoptionbool.md) | 设置指定的套接字参数。 |
| [`setSocketOptionIntNative( level: Int32, option: Int32, value: IntNative ): Unit`](setsocketoptionintnative.md) | 设置指定的套接字参数。 |
| [`override toString(): String`](tostring.md) | 返回当前 UnixServerSocket 的状态信息。 |
