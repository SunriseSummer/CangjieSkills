<!-- cj-doc kind="api-type" level="5" id="std.net.class.socketaddress" parent="std.net" -->
# SocketAddress

[← std.net](../../index.md)

`sealed abstract SocketAddress <: ToString & Equatable<SocketAddress> & Hashable`

此类表示协议无关的 Socket 地址。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`family: AddressFamily`](prop-family.md) | 当前 SocketAddress 对象的地址族。 |
| [`size: Int64`](prop-size.md) | 当前 SocketAddress 对象的原始字节长度。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`getAddressBytes(): Array<Byte>`](getaddressbytes.md) | 返回此 SocketAddress 对象的原始 IP 地址。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(rhs: SocketAddress): Bool`](operator-ne.md) | 判断两个 SocketAddress 对象是否不等。 |
| [`operator ==(rhs: SocketAddress): Bool`](operator-eq.md) | 判断两个 SocketAddress 对象是否相等。 |
