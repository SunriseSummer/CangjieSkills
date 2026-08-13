<!-- cj-doc kind="api-member" level="6" id="std.net.class.ipv4address.toipv6compatible" parent="std.net.class.ipv4address" -->
# IPv4Address.toIPv6Compatible

[← IPv4Address](index.md)

## 签名

```cangjie role=signature
public func toIPv6Compatible(): IPv6Address
```

此 IPv4Address 地址转换为 IPv4 兼容的 IPv6Address 地址。

## 契约

功能：此 IPv4Address 地址转换为 IPv4 兼容的 IPv6Address 地址。`a.b.c.d` 变为 `::a.b.c.d`。

返回值：

- IPv6Address - IPv6Address 对象。
