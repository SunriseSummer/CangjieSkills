<!-- cj-doc kind="api-type" level="5" id="std.net.class.unixsocketaddress" parent="std.net" -->
# UnixSocketAddress

[← std.net](../../index.md)

`UnixSocketAddress <: SocketAddress & Equatable<UnixSocketAddress>`

此类实现了 Unix Domain Socket 地址，Unix Domain Socket 地址封装了 Unix Domain Socket 绑定或连接到的文件系统路径，路径长度不可超过 108。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`family: AddressFamily`](prop-family.md) | 获取当前 UnixSocketAddress 对象的地址族，总是 AddressFamily.UNIX。 |
| [`size: Int64`](prop-size.md) | 获取当前 UnixSocketAddress 对象的原始字节长度。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(path: Array<Byte>)`](init.md) | 根据 Array<Byte> 表示的文件系统路径构造 UnixSocketAddress 地址。 |
| [`init(path: String)`](init.md) | 根据字符串表示的文件系统路径构造 UnixSocketAddress 地址。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`getAddressBytes(): Array<Byte>`](getaddressbytes.md) | 返回此 UnixSocketAddress 对象的原始 IP 地址，内容布局与 `sockaddr_un` 形式一致。 |
| [`hashCode(): Int64`](hashcode.md) | 获取 `hashcode` 值。 |
| [`toString(): String`](tostring.md) | 返回当前 UnixSocketAddress 的文本表示字符串。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(rhs: UnixSocketAddress): Bool`](operator-ne.md) | 判断两个 UnixSocketAddress 对象是否不等。 |
| [`operator ==(rhs: UnixSocketAddress): Bool`](operator-eq.md) | 判断两个 UnixSocketAddress 对象是否相等。 |
