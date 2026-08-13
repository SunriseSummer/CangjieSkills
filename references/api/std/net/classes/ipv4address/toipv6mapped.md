<!-- cj-doc kind="api-member" level="6" id="std.net.class.ipv4address.toipv6mapped" parent="std.net.class.ipv4address" -->
# IPv4Address.toIPv6Mapped

[← IPv4Address](index.md)

## 签名

```cangjie role=signature
public func toIPv6Mapped(): IPv6Address
```

此 IPv4Address 地址转换为 IPv4 映射的 IPv6Address 地址。

## 契约

功能：此 IPv4Address 地址转换为 IPv4 映射的 IPv6Address 地址。`a.b.c.d` 变为 `::ffff:a.b.c.d`。

返回值：

- IPv6Address - IPv6Address 对象。
