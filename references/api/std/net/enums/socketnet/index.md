<!-- cj-doc kind="api-type" level="5" id="std.net.enum.socketnet" parent="std.net" -->
# SocketNet

[← std.net](../../index.md)

`SocketNet <: ToString & Equatable<SocketNet>`

传输层协议类型。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`TCP`](value-tcp.md) | 代表 TCP 协议。 |
| [`UDP`](value-udp.md) | 代表 UDP 协议。 |
| [`UNIX`](value-unix.md) | 代表 UNIX 协议。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toString(): String`](tostring.md) | 将枚举值转换为字符串。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(that: SocketNet): Bool`](operator-ne.md) | 判断两个 SocketNet 是否不相等。 |
| [`operator ==(that: SocketNet): Bool`](operator-eq.md) | 判断两个 SocketNet 是否相等。 |
