<!-- cj-doc kind="api-type" level="5" id="std.net.struct.addressfamily" parent="std.net" -->
# AddressFamily

[← std.net](../../index.md)

`AddressFamily <: ToString & Equatable<AddressFamily>`

AddressFamily 地址族用于指示 `Socket` 的寻址方案，常用的有 `INET` / `INET6` / `UNIX` 地址族。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`INET: AddressFamily = AddressFamily("INET", 2)`](field-inet.md) | IPv4 地址族。 |
| [`INET6: AddressFamily`](field-inet6.md) | IPv6 地址族。 |
| [`NETLINK: AddressFamily`](field-netlink.md) | NetLink 地址族，仅 Linux 下支持，其值为： |
| [`UNIX: AddressFamily = AddressFamily("UNIX", 1)`](field-unix.md) | unix domain socket 地址族。 |
| [`UNSPEC: AddressFamily = AddressFamily("UNSPEC", 0)`](field-unspec.md) | 未指定的地址族。 |
| [`name: String`](field-name.md) | 地址族名。 |
| [`value: UInt16`](field-value.md) | 地址族值。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(name: String, value: UInt16)`](init.md) | 常量构造函数，创建 AddressFamily 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toString(): String`](tostring.md) | 获取地址族对应的名称。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(rhs: AddressFamily): Bool`](operator-ne.md) | 比较地址族值是否不等。 |
| [`operator ==(rhs: AddressFamily): Bool`](operator-eq.md) | 比较地址族值是否相等。 |
