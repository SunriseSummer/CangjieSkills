<!-- cj-doc kind="api-member" level="6" id="std.net.class.ipv6address.toipv4" parent="std.net.class.ipv6address" -->
# IPv6Address.toIPv4

[← IPv6Address](index.md)

## 签名

```cangjie role=signature
public func toIPv4(): ?IPv4Address
```

此 IPv6Address 地址转换为 IPv4 兼容的 IPv4Address 地址。

## 契约

功能：此 IPv6Address 地址转换为 IPv4 兼容的 IPv4Address 地址。比如 `::a.b.c.d` 和 `::ffff:a.b.c.d` 转成 `a.b.c.d`；  `::1` 转成 `0.0.0.1`. 所有不以全零或 `::ffff` 开头的地址将返回 `None`。

返回值：

- ?IPv4Address - ?IPv4Address 值。
