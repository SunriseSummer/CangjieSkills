<!-- cj-doc kind="api-package" level="4" id="std.net" parent="api.std" -->
# std.net

[← std 包索引](../index.md)

提供 TCP、UDP、Unix Domain Socket 及 IP/Socket 地址类型。

包路径：`std.net`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`sealed abstract IPAddress <: ToString & Equatable<IPAddress> & Hashable & BigEndianOrder<IPAddress>`](classes/ipaddress/index.md) | 此类表示 Internet 协议（IP）地址。 |
| [`sealed abstract IPPrefix <: Equatable<IPPrefix> & Hashable & ToString`](classes/ipprefix/index.md) | 这个类表示一个 IP 前缀，即一个连续的 IP 地址块，边界为 2 的幂（也称为“IP 子网”）。 |
| [`IPSocketAddress <: SocketAddress & Equatable<IPSocketAddress>`](classes/ipsocketaddress/index.md) | 此类实现了 IP 协议 Socket 地址（IP 地址+端口号）。 |
| [`IPv4Address <: IPAddress & ToString & Equatable<IPv4Address> & LessOrEqual<IPv4Address>`](classes/ipv4address/index.md) | 此类表示 Internet 协议版本 4（IPv4）地址。 |
| [`IPv6Address <: IPAddress & ToString & Equatable<IPv6Address> & LessOrEqual<IPv6Address>`](classes/ipv6address/index.md) | 此类表示 Internet 协议版本 6 （IPv6）地址。 |
| [`RawSocket`](classes/rawsocket/index.md) | RawSocket 提供了套接字的基本功能。 |
| [`sealed abstract SocketAddress <: ToString & Equatable<SocketAddress> & Hashable`](classes/socketaddress/index.md) | 此类表示协议无关的 Socket 地址。 |
| [`TcpServerSocket <: ServerSocket`](classes/tcpserversocket/index.md) | 监听 TCP 连接的服务端。 |
| [`TcpSocket <: StreamingSocket & Equatable<TcpSocket> & Hashable`](classes/tcpsocket/index.md) | 请求 TCP 连接的客户端。 |
| [`UdpSocket <: DatagramSocket`](classes/udpsocket/index.md) | 提供 udp 报文通信。 |
| [`UnixDatagramSocket <: DatagramSocket`](classes/unixdatagramsocket/index.md) | 提供基于数据包的主机通讯能力。 |
| [`UnixServerSocket <: ServerSocket`](classes/unixserversocket/index.md) | 提供基于双工流的主机通讯服务端。 |
| [`UnixSocket <: StreamingSocket`](classes/unixsocket/index.md) | 提供基于双工流的主机通讯客户端。 |
| [`UnixSocketAddress <: SocketAddress & Equatable<UnixSocketAddress>`](classes/unixsocketaddress/index.md) | 此类实现了 Unix Domain Socket 地址，Unix Domain Socket 地址封装了 Unix Domain Socket 绑定或连接到的文件系统路径，路径长度不可超过 108。 |
| [`SocketException <: IOException`](classes/socketexception/index.md) | 提供套接字相关的异常处理。 |
| [`SocketTimeoutException <: Exception`](classes/sockettimeoutexception/index.md) | 提供套接字操作超时相关的异常处理。 |

## 接口

| 声明 | 功能 |
|---|---|
| [`DatagramSocket <: Resource & ToString`](interfaces/datagramsocket/index.md) | DatagramSocket 是一种接收和读取数据包的套接字。 |
| [`ServerSocket <: Resource & ToString`](interfaces/serversocket/index.md) | 提供服务端的 `Socket` 需要的接口。 |
| [`StreamingSocket <: IOStream & Resource & ToString`](interfaces/streamingsocket/index.md) | 双工流模式下的运行的 `Socket`，可被读写。 |

## 结构体

| 声明 | 功能 |
|---|---|
| [`AddressFamily <: ToString & Equatable<AddressFamily>`](structs/addressfamily/index.md) | AddressFamily 地址族用于指示 `Socket` 的寻址方案，常用的有 `INET` / `INET6` / `UNIX` 地址族。 |
| [`OptionLevel`](structs/optionlevel/index.md) | 提供了常用的套接字选项级别。 |
| [`OptionName`](structs/optionname/index.md) | 提供了常用的套接字选项。 |
| [`ProtocolType <: Equatable<ProtocolType> & ToString & Hashable`](structs/protocoltype/index.md) | 提供了常用的套接字协议，以及通过指定 Int32 值来构建套接字协议的功能。 |
| [`RawAddress`](structs/rawaddress/index.md) | 提供了 RawSocket 的通信地址创建和获取功能。 |
| [`SocketDomain <: Equatable<SocketDomain> & ToString & Hashable`](structs/socketdomain/index.md) | 提供了常用的套接字通信域，以及通过指定 Int32 值来构建套接字通信域的功能。 |
| [`SocketKeepAliveConfig <: ToString & Equatable<SocketKeepAliveConfig>`](structs/socketkeepaliveconfig/index.md) | TCP KeepAlive 属性配置。 |
| [`SocketOptions`](structs/socketoptions/index.md) | SocketOptions 存储了设置套接字选项的一些参数常量方便后续调用。 |
| [`SocketType <: Equatable<SocketType> & ToString & Hashable`](structs/sockettype/index.md) | 提供了常用的套接字类型，以及通过指定 Int32 值来构建套接字类型的功能。 |

## 枚举

| 声明 | 功能 |
|---|---|
| [`SocketNet <: ToString & Equatable<SocketNet>`](enums/socketnet/index.md) | 传输层协议类型。 |
