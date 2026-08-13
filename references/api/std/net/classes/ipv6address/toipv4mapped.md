<!-- cj-doc kind="api-member" level="6" id="std.net.class.ipv6address.toipv4mapped" parent="std.net.class.ipv6address" -->
# IPv6Address.toIPv4Mapped

[← IPv6Address](index.md)

## 签名

```cangjie role=signature
public func toIPv4Mapped(): ?IPv4Address
```

此 IPv6Address 地址转换为 IPv4 映射的 IPv4Address 地址。

## 契约

功能：此 IPv6Address 地址转换为 IPv4 映射的 IPv4Address 地址。比如 `::ffff:a.b.c.d` 转换为 `a.b.c.d`， 所有不以 `::ffff` 开头的地址将返回 `None`。

返回值：

- ?IPv4Address - ?IPv4Address 值。
