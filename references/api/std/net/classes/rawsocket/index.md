<!-- cj-doc kind="api-type" level="5" id="std.net.class.rawsocket" parent="std.net" -->
# RawSocket

[← std.net](../../index.md)

`RawSocket`

RawSocket 提供了套接字的基本功能。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`localAddress: RawAddress`](prop-localaddress.md) | 获取当前 RawSocket 实例的本地地址。 |
| [`mut readTimeout: ?Duration`](prop-readtimeout.md) | 获取或设置当前 RawSocket 实例的读超时时间。 |
| [`remoteAddress: RawAddress`](prop-remoteaddress.md) | 获取当前 RawSocket 实例的对端地址。 |
| [`mut writeTimeout: ?Duration`](prop-writetimeout.md) | 获取或设置当前 RawSocket 实例的写超时时间。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(domain: SocketDomain, `type`: SocketType, protocol: ProtocolType)`](init.md) | 创建特定通信域、类型、协议组合的套接字。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`accept(timeout!: ?Duration = None): RawSocket`](accept.md) | 接收当前 RawSocket 实例监听时挂起连接队列上的第一个连接请求，返回一个用于通信的 RawSocket。 |
| [`bind(addr: RawAddress): Unit`](bind.md) | 将当前 RawSocket 实例与指定的套接字地址进行绑定。 |
| [`close(): Unit`](close.md) | 关闭当前 RawSocket 实例。 |
| [`connect(addr: RawAddress, timeout!: ?Duration = None): Unit`](connect.md) | 向目标地址发送连接请求。 |
| [`unsafe getSocketOption(level: Int32, option: Int32, value: CPointer<Byte>, len: CPointer<Int32>): Unit`](getsocketoption.md) | 获取套接字选项的值。 |
| [`listen(backlog: Int32): Unit`](listen.md) | 监听当前 RawSocket 实例绑定的地址。 |
| [`receive(buffer: Array<Byte>, flags: Int32): Int64`](receive.md) | 接收来自连接对端发送的数据。 |
| [`receiveFrom(buffer: Array<Byte>, flags: Int32): (RawAddress, Int64)`](receivefrom.md) | 接收来自其他 RawSocket 实例的数据。 |
| [`send(buffer: Array<Byte>, flags: Int32): Unit`](send.md) | 向连接的对端发送数据。 |
| [`sendTo(addr: RawAddress, buffer: Array<Byte>, flags: Int32): Unit`](sendto.md) | 向目标地址发送数据。 |
| [`unsafe setSocketOption(level: Int32, option: Int32, value: CPointer<Byte>, len: Int32): Unit`](setsocketoption.md) | 设置套接字选项。 |
