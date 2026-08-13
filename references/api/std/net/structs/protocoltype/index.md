<!-- cj-doc kind="api-type" level="5" id="std.net.struct.protocoltype" parent="std.net" -->
# ProtocolType

[← std.net](../../index.md)

`ProtocolType <: Equatable<ProtocolType> & ToString & Hashable`

提供了常用的套接字协议，以及通过指定 Int32 值来构建套接字协议的功能。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`ICMP: ProtocolType = ProtocolType(1)`](field-icmp.md) | 指定协议类型为 `ICMP`。 |
| [`IPV4: ProtocolType = ProtocolType(4)`](field-ipv4.md) | 指定协议类型为 `IPv4` 。 |
| [`IPV6: ProtocolType = ProtocolType(41)`](field-ipv6.md) | 指定协议类型为 `IPv6`。 |
| [`RAW: ProtocolType = ProtocolType(255)`](field-raw.md) | 指定协议类型为 `RAW`。 |
| [`TCP: ProtocolType = ProtocolType(6)`](field-tcp.md) | 指定协议类型为 `TCP`。 |
| [`UDP: ProtocolType = ProtocolType(17)`](field-udp.md) | 指定协议类型为 `UDP`。 |
| [`Unspecified: ProtocolType = ProtocolType(0)`](field-unspecified.md) | 不指定协议类型。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(protocol: Int32)`](init.md) | 通过指定套接字协议值创建协议。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`hashCode(): Int64`](hashcode.md) | 返回当前 ProtocolType 实例的哈希值。 |
| [`toString(): String`](tostring.md) | 返回当前 ProtocolType 实例的字符串表示。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(r: ProtocolType): Bool`](operator-ne.md) | 判断两个 ProtocolType 实例是否不等。 |
| [`operator ==(r: ProtocolType): Bool`](operator-eq.md) | 判断两个 ProtocolType 实例是否相等。 |
