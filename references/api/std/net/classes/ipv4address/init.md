<!-- cj-doc kind="api-member" level="6" id="std.net.class.ipv4address.init" parent="std.net.class.ipv4address" -->
# IPv4Address.init

[← IPv4Address](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## init(Byte, Byte, Byte, Byte)

### 签名

```cangjie role=signature
public init(a: Byte, b: Byte, c: Byte, d: Byte)
```

根据 4 个 8-bit 字节构造 IPv4Address 地址对象，文本将表示为 `a.b.c.d`。

### 契约

参数：

- a: Byte - 8-bit 字节。
- b: Byte - 8-bit 字节。
- c: Byte - 8-bit 字节。
- d: Byte - 8-bit 字节。

## init(UInt32)

### 签名

```cangjie role=signature
public init(bits: UInt32)
```

根据本机字节序 UInt32 值构造 IPv4Address 地址。

### 契约

参数：

- bits: UInt32 - 本机字节序 UInt32 值。
