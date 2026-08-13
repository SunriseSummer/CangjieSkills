<!-- cj-doc kind="api-type" level="5" id="std.net.struct.sockettype" parent="std.net" -->
# SocketType

[← std.net](../../index.md)

`SocketType <: Equatable<SocketType> & ToString & Hashable`

提供了常用的套接字类型，以及通过指定 Int32 值来构建套接字类型的功能。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`DATAGRAM: SocketType = SocketType(2)`](field-datagram.md) | 数据报套接字类型。 |
| [`RAW: SocketType = SocketType(3)`](field-raw.md) | 原始套接字类型。 |
| [`SEQPACKET: SocketType = SocketType(5)`](field-seqpacket.md) | 有序数据包套接字类型。 |
| [`STREAM: SocketType = SocketType(1)`](field-stream.md) | 流式套接字类型。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(`type`: Int32)`](init.md) | 通过指定套接字类型值创建套接字类型。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`hashCode(): Int64`](hashcode.md) | 返回当前 SocketType 实例的哈希值。 |
| [`toString(): String`](tostring.md) | 返回当前 SocketType 实例的字符串表示。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(r: SocketType): Bool`](operator-ne.md) | 判断两个 SocketType 实例是否不等。 |
| [`operator ==(r: SocketType): Bool`](operator-eq.md) | 判断两个 SocketType 实例是否相等。 |
