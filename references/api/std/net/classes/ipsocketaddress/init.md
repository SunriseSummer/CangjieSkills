<!-- cj-doc kind="api-member" level="6" id="std.net.class.ipsocketaddress.init" parent="std.net.class.ipsocketaddress" -->
# IPSocketAddress.init

[← IPSocketAddress](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## init(Array<Byte>, UInt16)

### 签名

```cangjie role=signature
public init(address: Array<Byte>, port: UInt16)
```

根据大端序 Array<Byte> 表示的 IP 地址和本机序 UInt16 端口构造 IPSocketAddress 地址。

### 契约

参数：

- address: Array\<Byte>  - 大端序 IP 地址。
- port: UInt16 - 本机序端口。

异常：

- IllegalArgumentException - 如果 address 不合法，抛出异常。

## init(IPAddress, UInt16)

### 签名

```cangjie role=signature
public init(address: IPAddress, port: UInt16)
```

根据 IPAddress 对象和 本机序 UInt16 端口构造 IPSocketAddress 地址。

### 契约

参数：

- address: IPAddress - IPAddress 对象。
- port: UInt16 - 本机序端口。

## init(String, UInt16)

### 签名

```cangjie role=signature
public init(address: String, port: UInt16)
```

根据字符串表示的 IP 地址和 本机序 UInt16 端口构造 IPSocketAddress 地址。

### 契约

参数：

- address: String - IP 地址字符串。
- port: UInt16 - 本机序端口。

异常：

- IllegalFormatException - 如果传入的 IP 地址不合法，抛出异常。
