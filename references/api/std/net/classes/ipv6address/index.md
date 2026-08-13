<!-- cj-doc kind="api-type" level="5" id="std.net.class.ipv6address" parent="std.net" -->
# IPv6Address

[← std.net](../../index.md)

`IPv6Address <: IPAddress & ToString & Equatable<IPv6Address> & LessOrEqual<IPv6Address>`

此类表示 Internet 协议版本 6 （IPv6）地址。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`localhost: IPv6Address = IPv6Address(0u16, 0, 0, 0, 0, 0, 0, 1)`](field-localhost.md) | 返回 IPv6Address 的 `localhost` 地址：`::1`。 |
| [`unspecified: IPv6Address = IPv6Address(0u16, 0, 0, 0, 0, 0, 0, 0)`](field-unspecified.md) | 返回表示未指定的 IPv6Address 地址：`::`，这对应于其他语言中的常量 `INADDR_ANY`。 |
| [`scopeId: ?UInt32`](prop-scopeid.md) | 获取默认范围 ID。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(octets: Array<Byte>, scopeId!: ?UInt32 = None)`](init.md) | 根据大端序 Array<Byte> 构造 IPv6Address 地址。 |
| [`init(a: UInt16, b: UInt16, c: UInt16, d: UInt16, e: UInt16, f: UInt16, g: UInt16, h: UInt16, scopeId!: ?UInt32 = None)`](init.md) | 根据 8 个 16-bit 分段构造 IPv6Address 地址对象，文本将表示为 `a:b:c:d:e:f:g:h%scopeId`。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static readBigEndian(buffer: Array<Byte>): IPv6Address`](readbigendian.md) | 从字节数组中以大端序的方式读取一个 IPv6Address 对象。 |
| [`getPrefix(prefixLen: UInt8): IPPrefix`](getprefix.md) | 此 IPv6Address 地址对象根据指定的网络前缀长度创建一个网络前缀对象。 |
| [`isGlobalUnicast(): Bool`](isglobalunicast.md) | 判断此 IPv6Address 对象是不是全局单播地址。 |
| [`isIPv4Mapped(): Bool`](isipv4mapped.md) | 判断此 IPv6Address 对象是不是 IPv4 映射地址。 |
| [`isLinkLocal(): Bool`](islinklocal.md) | 判断此 IPv6Address 对象是不是链路本地地址。 |
| [`isLoopback(): Bool`](isloopback.md) | 判断此 IPv6Address 对象是不是环回地址。 |
| [`isMulticast(): Bool`](ismulticast.md) | 判断此 IPv6Address 对象是不是多播地址。 |
| [`isPrivate(): Bool`](isprivate.md) | 判断此 IPv6Address 对象是不是私有地址。 |
| [`isTeredo(): Bool`](isteredo.md) | 判断此 IPv6Address 对象是不是 `Teredo` 地址。 |
| [`isUnspecified(): Bool`](isunspecified.md) | 判断此 IPv6Address 对象是不是“未指定” IP 地址。 |
| [`scope(scopeId: ?UInt32): IPv6Address`](scope.md) | 使用本 IPv6Address 对象的地址值和指定的范围 ID 转换为新的 IPv6Address 对象，如果指定的范围 ID 为 None，则去除已有的范围 ID。 |
| [`toIPv4(): ?IPv4Address`](toipv4.md) | 此 IPv6Address 地址转换为 IPv4 兼容的 IPv4Address 地址。 |
| [`toIPv4Mapped(): ?IPv4Address`](toipv4mapped.md) | 此 IPv6Address 地址转换为 IPv4 映射的 IPv4Address 地址。 |
| [`toString(): String`](tostring.md) | 返回当前 IPv6Address 的文本表示字符串。 |
| [`writeBigEndian(buffer: Array<Byte>): Int64`](writebigendian.md) | 返回此 IPv6Address 对象以大端序的方式写入字节数组中。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(rhs: IPv6Address): Bool`](operator-ne.md) | 判断两个 IPv6Address 对象是否不等。 |
| [`operator <=(rhs: IPv6Address): Bool`](operator-le.md) | 判断本 IPv6Address 对象是否小于等于被比较的 IPv6Address 对象。 |
| [`operator ==(rhs: IPv6Address): Bool`](operator-eq.md) | 判断两个 IPv6Address 对象是否相等。 |
