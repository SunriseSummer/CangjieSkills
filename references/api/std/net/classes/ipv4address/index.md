<!-- cj-doc kind="api-type" level="5" id="std.net.class.ipv4address" parent="std.net" -->
# IPv4Address

[← std.net](../../index.md)

`IPv4Address <: IPAddress & ToString & Equatable<IPv4Address> & LessOrEqual<IPv4Address>`

此类表示 Internet 协议版本 4（IPv4）地址。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`broadcast: IPv4Address = IPv4Address(0xFF, 0xFF, 0xFF, 0xFF)`](field-broadcast.md) | 返回 IPv4Address 的广播地址：`255.255.255.255`。 |
| [`localhost: IPv4Address = IPv4Address(0x7F, 0, 0, 0x01)`](field-localhost.md) | 返回 IPv4Address 的 `localhost` 地址：`127.0.0.1`。 |
| [`unspecified: IPv4Address = IPv4Address(0, 0, 0, 0)`](field-unspecified.md) | 返回表示未指定的 IPv4Address 地址：`0.0.0.0`，这对应于其他语言中的常量 `INADDR_ANY`。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(a: Byte, b: Byte, c: Byte, d: Byte)`](init.md) | 根据 4 个 8-bit 字节构造 IPv4Address 地址对象，文本将表示为 `a.b.c.d`。 |
| [`init(bits: UInt32)`](init.md) | 根据本机字节序 UInt32 值构造 IPv4Address 地址。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static readBigEndian(buffer: Array<Byte>): IPv4Address`](readbigendian.md) | 从字节数组中以大端序的方式读取一个 IPv4Address 对象。 |
| [`getPrefix(prefixLen: UInt8): IPPrefix`](getprefix.md) | 将 IPv4Address 地址根据指定的网络前缀长度创建一个网络前缀对象。 |
| [`isBroadcast(): Bool`](isbroadcast.md) | 判断此 IPv4Address 对象是不是广播地址。 |
| [`isGlobalUnicast(): Bool`](isglobalunicast.md) | 判断此 IPv4Address 对象是不是全局单播地址。 |
| [`isLinkLocal(): Bool`](islinklocal.md) | 判断此 IPv4Address 对象是不是链路本地地址。 |
| [`isLoopback(): Bool`](isloopback.md) | 判断此 IPv4Address 对象是不是环回地址。 |
| [`isMulticast(): Bool`](ismulticast.md) | 判断此 IPv4Address 对象是不是多播地址。 |
| [`isPrivate(): Bool`](isprivate.md) | 判断此 IPv4Address 对象是不是私有地址。 |
| [`isUnspecified(): Bool`](isunspecified.md) | 判断此 IPv4Address 对象是不是“未指定” IP 地址。 |
| [`toBits(): UInt32`](tobits.md) | 此 IPv4Address 地址转换为本机字节序的 UInt32 值。 |
| [`toIPv6Compatible(): IPv6Address`](toipv6compatible.md) | 此 IPv4Address 地址转换为 IPv4 兼容的 IPv6Address 地址。 |
| [`toIPv6Mapped(): IPv6Address`](toipv6mapped.md) | 此 IPv4Address 地址转换为 IPv4 映射的 IPv6Address 地址。 |
| [`toString(): String`](tostring.md) | 返回当前 IPv4Address 的文本表示字符串。 |
| [`writeBigEndian(buffer: Array<Byte>): Int64`](writebigendian.md) | 此 IPv4Address 对象以大端序的方式写入字节数组中。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(rhs: IPv4Address): Bool`](operator-ne.md) | 判断两个 IPv4Address 对象是否不等。 |
| [`operator <=(rhs: IPv4Address): Bool`](operator-le.md) | 判断本 IPv4Address 对象是否小于等于被比较的 IPv4Address 对象。 |
| [`operator ==(rhs: IPv4Address): Bool`](operator-eq.md) | 判断两个 IPv4Address 对象是否相等。 |
