<!-- cj-doc kind="api-type" level="5" id="std.net.class.ipsocketaddress" parent="std.net" -->
# IPSocketAddress

[← std.net](../../index.md)

`IPSocketAddress <: SocketAddress & Equatable<IPSocketAddress>`

此类实现了 IP 协议 Socket 地址（IP 地址+端口号）。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`address: IPAddress`](prop-address.md) | 获取当前 IPSocketAddress 对象的 IP 地址。 |
| [`family: AddressFamily`](prop-family.md) | 获取当前 IPSocketAddress 对象的地址族。 |
| [`port: UInt16`](prop-port.md) | 获取当前 IPSocketAddress 对象的端口。 |
| [`size: Int64`](prop-size.md) | 获取当前 IPSocketAddress 对象的原始字节长度。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(address: Array<Byte>, port: UInt16)`](init.md) | 根据大端序 Array<Byte> 表示的 IP 地址和本机序 UInt16 端口构造 IPSocketAddress 地址。 |
| [`init(address: IPAddress, port: UInt16)`](init.md) | 根据 IPAddress 对象和 本机序 UInt16 端口构造 IPSocketAddress 地址。 |
| [`init(address: String, port: UInt16)`](init.md) | 根据字符串表示的 IP 地址和 本机序 UInt16 端口构造 IPSocketAddress 地址。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static parse(s: String): IPSocketAddress`](parse.md) | 将 IP 协议的 Socket 字符串转换为 IPSocketAddress 对象。 |
| [`static tryParse(s: String): ?IPSocketAddress`](tryparse.md) | 将 IP 协议的 Socket 字符串转换为 IPSocketAddress 对象，如果不是合法字符串，则返回 `None`。 |
| [`getAddressBytes(): Array<Byte>`](getaddressbytes.md) | 返回此 IPSocketAddress 对象的原始地址的 Array<Byte> 表示，内容布局与 `sockaddr_in` 或 `sockaddr_in6` 一致。 |
| [`hashCode(): Int64`](hashcode.md) | 获取 `hashcode` 值。 |
| [`isIPv4(): Bool`](isipv4.md) | 判断此 IPSocketAddress 对象是不是 IPv4 Socket 地址。 |
| [`isIPv6(): Bool`](isipv6.md) | 判断此 IPSocketAddress 对象是不是 IPv6 Socket 地址。 |
| [`toString(): String`](tostring.md) | 返回当前 IPSocketAddress 的文本表示字符串。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(rhs: IPSocketAddress): Bool`](operator-ne.md) | 判断两个 IPSocketAddress 对象是否不等。 |
| [`operator ==(rhs: IPSocketAddress): Bool`](operator-eq.md) | 判断两个 IPSocketAddress 对象是否相等。 |
