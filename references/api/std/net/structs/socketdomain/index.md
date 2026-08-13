<!-- cj-doc kind="api-type" level="5" id="std.net.struct.socketdomain" parent="std.net" -->
# SocketDomain

[← std.net](../../index.md)

`SocketDomain <: Equatable<SocketDomain> & ToString & Hashable`

提供了常用的套接字通信域，以及通过指定 Int32 值来构建套接字通信域的功能。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`IPV4: SocketDomain = SocketDomain(2)`](field-ipv4.md) | `IPv4` 通信域。 |
| [`IPV6: SocketDomain`](field-ipv6.md) | `IPv6` 通信域。 |
| [`NETLINK: SocketDomain = SocketDomain(16)`](field-netlink.md) | 内核和用户空间进程之间通信。 |
| [`PACKET: SocketDomain = SocketDomain(17)`](field-packet.md) | 允许用户空间程序直接访问网络数据包。 |
| [`UNIX: SocketDomain`](field-unix.md) | 本机通信。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(domain: Int32)`](init.md) | 根据指定通信域值创建套接字通信域。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`hashCode(): Int64`](hashcode.md) | 返回当前 SocketDomain 实例的哈希值。 |
| [`toString(): String`](tostring.md) | 返回当前 SocketDomain 实例的字符串表示。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(r: SocketDomain): Bool`](operator-ne.md) | 比较两个 SocketDomain 实例是否不等。 |
| [`operator ==(r: SocketDomain): Bool`](operator-eq.md) | 比较两个 SocketDomain 实例是否相等。 |
