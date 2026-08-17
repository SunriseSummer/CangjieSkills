# CIDR 路由表与 UDP 回环

## 目标

使用仓颉 1.1.3 实现包 `cidr_udp_router`，提供 IPv4/IPv6 前缀信息、包含/重叠判断、最长前缀路由选择和两种本机 UDP 回环。实现必须直接使用 `std.net` 的 `IPAddress`、`IPPrefix`、`IPSocketAddress`、`UdpSocket`，并用 `Resource` 自动关闭。禁止 DNS、公网、固定端口、随机数和当前时间。

将 `cidr_udp_router_test.cj` 原样复制到 `src/`，测试不可修改。

## 公开 API

```cangjie
public class RouterException <: Exception { public init(message: String) }
public class Route {
    public let prefix: IPPrefix
    public let label: String
    public let metric: Int64
    public let order: Int64
    public init(prefix: IPPrefix, label: String, metric: Int64, order: Int64)
}
public struct PrefixInfo {
    public let canonical: String
    public let network: String
    public let netmask: String
    public let hostmask: String
    public let broadcast: ?String
}
public class RouteTable {
    public prop size: Int64
    public func add(cidr: String, label: String, metric!: Int64 = 0): Unit
    public func lookup(address: String): ?Route
}
public func describePrefix(cidr: String): PrefixInfo
public func prefixContains(cidr: String, address: String): Bool
public func prefixesOverlap(left: String, right: String): Bool
public func addressBigEndianRoundTrip(address: String): String
public func udpEcho(payload: Array<Byte>): Array<Byte>
public func udpConnectedEcho(payload: Array<Byte>): Array<Byte>
```

## 契约

- 所有前缀保存和显示前先 `masked()`；非法前缀/地址、空 label、负 metric 抛 `RouterException`。
- `describePrefix` 返回 canonical、network、netmask、hostmask；IPv4 返回 broadcast，IPv6 的 broadcast 为 None。
- `lookup` 先选最长前缀；长度相同选 metric 较小者；仍相同保留先插入者。无匹配返回 None。
- `addressBigEndianRoundTrip` 必须通过 `writeBigEndian` 和 `IPAddress.readBigEndian` 往返。
- 两个 UDP 函数只绑定端口 0，在 `127.0.0.1` 回环，收发超时均为 2 秒，原样回传 payload。`udpEcho` 使用 sendTo/receiveFrom；`udpConnectedEcho` 使用 connect/send/receive/disconnect。

## 入口输出

```text
routes=3
selected=local
network=192.168.12.0
udp=ping
```

## 验收

依次执行 `cjpm clean`、`cjpm build`、`cjpm test`、`cjpm run`，均须成功；33 个测试全部通过且 warning 为 0。为检验端口释放和平台稳定性，完整 `cjpm test` 至少连续运行 5 次。
