<!-- cj-doc kind="api-type" level="5" id="std.net.class.ipprefix" parent="std.net" -->
# IPPrefix

[← std.net](../../index.md)

`sealed abstract IPPrefix <: Equatable<IPPrefix> & Hashable & ToString`

这个类表示一个 IP 前缀，即一个连续的 IP 地址块，边界为 2 的幂（也称为“IP 子网”）。

## 关键契约

1.0.5 边界：

- `tryParse` 对多数格式错误返回 `None`，但前缀长度越界时会抛 `IllegalArgumentException`，例如 IPv4 `/99`；若输入不可信，应同时处理 `None` 和异常。
- `broadcast()` 对 IPv6 仍返回主机位全 1 的地址，不会以异常表示“IPv6 无广播”。应用若只接受 IPv4 广播，应先检查 `prefix.address.isIPv4()`。
- 不同地址族之间的 `contains` 与 `overlaps` 返回 `false`。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`address: IPAddress`](prop-address.md) | 获取构造当前 IPPrefix 对象时的 IPAddress 地址。 |
| [`prefixLength: UInt8`](prop-prefixlength.md) | 获取前缀长度。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static parse(s: String): IPPrefix`](parse.md) | 将 IP 协议的 Socket 字符串转换为 IPPrefix 对象。 |
| [`static tryParse(s: String): ?IPPrefix`](tryparse.md) | 将 IP 协议的 Socket 字符串转换为 IPPrefix 对象，如果不是合法字符串，则返回 `None`。 |
| [`open broadcast(): IPAddress`](broadcast.md) | 返回此 IPPrefix 地址的广播地址。 |
| [`contains(rhs: IPAddress): Bool`](contains.md) | 此 IPPrefix 地址是否包含指定的 IPAddress 地址。 |
| [`contains(rhs: IPPrefix): Bool`](contains.md) | 此 IPPrefix 地址是否包含指定的 IPPrefix 地址。 |
| [`open hostmask(): IPAddress`](hostmask.md) | 返回此 IPPrefix 地址的主机网络掩码地址。 |
| [`open masked(): IPPrefix`](masked.md) | 返回此 IPPrefix 地址根据前缀长度进行掩码后的 IPPrefix 地址，比如 `192.168.12.34/16` 返回 `192.168.0.0/16`；`fc00::1:2:3:4/16` 返回 `fc00::/16`。 |
| [`open netmask(): IPAddress`](netmask.md) | 返回此 IPPrefix 地址的网络掩码地址。 |
| [`open network(): IPAddress`](network.md) | 返回此 IPPrefix 地址的网络地址。 |
| [`overlaps(rhs: IPPrefix): Bool`](overlaps.md) | 此 IPPrefix 地址是不是和指定的 IPPrefix 地址有重叠。 |
| [`toString(): String`](tostring.md) | 返回当前 IPPrefix 的文本表示字符串。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(rhs: IPPrefix): Bool`](operator-ne.md) | 判断两个 IPPrefix 对象是否不等。 |
| [`operator ==(rhs: IPPrefix): Bool`](operator-eq.md) | 判断两个 IPPrefix 对象是否相等。 |
