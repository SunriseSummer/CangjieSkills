<!-- cj-doc kind="api-type" level="5" id="std.net.class.ipaddress" parent="std.net" -->
# IPAddress

[← std.net](../../index.md)

`sealed abstract IPAddress <: ToString & Equatable<IPAddress> & Hashable & BigEndianOrder<IPAddress>`

此类表示 Internet 协议（IP）地址。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`hostName: ?String`](prop-hostname.md) | 返回当前 IPAddress 对象对应的主机名，如果无法成功解析，则为 None，当前暂未实现。 |
| [`size: Int64`](prop-size.md) | 获取 IP 地址对象字节长度。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static parse(s: String): IPAddress`](parse.md) | 将 IP 协议的 Socket 字符串转换为 IPAddress 对象。 |
| [`static readBigEndian(buffer: Array<Byte>): IPAddress`](readbigendian.md) | 从字节数组中以大端序的方式读取一个 IPAddress 对象。 |
| [`static resolve(family: AddressFamily, domain: String): Array<IPAddress>`](resolve.md) | 解析域名，得到 IPAddress 列表。 |
| [`static resolve(domain: String): Array<IPAddress>`](resolve.md) | 解析域名，得到 IPAddress 列表。 |
| [`static tryParse(s: String): ?IPAddress`](tryparse.md) | 将 IP 地址字符串转换为 IPAddress 对象，如果不是合法字符串，则返回 `None`。 |
| [`getAddressBytes(): Array<Byte>`](getaddressbytes.md) | 返回此 IPAddress 对象的原始 IP 地址。 |
| [`open getPrefix(prefixLen: UInt8): IPPrefix`](getprefix.md) | 此 IPAddress 地址对象根据指定的网络前缀长度创建一个网络前缀对象。 |
| [`hashCode(): Int64`](hashcode.md) | 获取 `hashcode` 值。 |
| [`open isGlobalUnicast(): Bool`](isglobalunicast.md) | 判断此 IPAddress 对象是不是全局单播地址。 |
| [`isIPv4(): Bool`](isipv4.md) | 判断此 IPAddress 对象是不是 IPv4 地址。 |
| [`isIPv6(): Bool`](isipv6.md) | 判断此 IPAddress 对象是不是 IPv6 地址。 |
| [`open isLinkLocal(): Bool`](islinklocal.md) | 判断此 IPAddress 对象是不是链路本地地址。 |
| [`open isLoopback(): Bool`](isloopback.md) | 判断此 IPAddress 对象是不是环回地址。 |
| [`open isMulticast(): Bool`](ismulticast.md) | 判断此 IPAddress 对象是不是多播地址。 |
| [`open isPrivate(): Bool`](isprivate.md) | 判断此 IPAddress 对象是不是私有地址。 |
| [`open isUnspecified(): Bool`](isunspecified.md) | 判断此 IPAddress 对象是不是“未指定” IP 地址。 |
| [`open writeBigEndian(buffer: Array<Byte>): Int64`](writebigendian.md) | 返回此 IPAddress 对象以大端序的方式写入字节数组中。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(rhs: IPAddress): Bool`](operator-ne.md) | 判断两个 IPAddress 对象是否不等。 |
| [`operator ==(rhs: IPAddress): Bool`](operator-eq.md) | 判断两个 IPAddress 对象是否相等。 |
