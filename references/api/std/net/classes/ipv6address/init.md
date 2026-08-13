<!-- cj-doc kind="api-member" level="6" id="std.net.class.ipv6address.init" parent="std.net.class.ipv6address" -->
# IPv6Address.init

[← IPv6Address](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## init(Array<Byte>, ?UInt32)

### 签名

```cangjie role=signature
public init(octets: Array<Byte>, scopeId!: ?UInt32 = None)
```

根据大端序 Array<Byte> 构造 IPv6Address 地址。

### 契约

异常：

- IllegalArgumentException - 如果 octets 长度小于 16，抛出异常。

参数：

- octets: Array\<Byte> - 大端序字节数组。
- scopeId!: ?UInt32 - 范围 ID。

## init(UInt16, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16, ?UInt32)

### 签名

```cangjie role=signature
public init(a: UInt16, b: UInt16, c: UInt16, d: UInt16, e: UInt16, f: UInt16, g: UInt16, h: UInt16, scopeId!: ?UInt32 = None)
```

根据 8 个 16-bit 分段构造 IPv6Address 地址对象，文本将表示为 `a:b:c:d:e:f:g:h%scopeId`。

### 契约

参数：

- a: UInt16 - 16-bit 分段。
- b: UInt16 - 16-bit 分段。
- c: UInt16 - 16-bit 分段。
- d: UInt16 - 16-bit 分段。
- e: UInt16 - 16-bit 分段。
- f: UInt16 - 16-bit 分段。
- g: UInt16 - 16-bit 分段。
- h: UInt16 - 16-bit 分段。
- scopeId!: ?UInt32 - 范围 ID。
