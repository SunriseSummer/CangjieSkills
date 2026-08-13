<!-- cj-doc kind="api-member" level="6" id="std.net.class.ipv6address.isteredo" parent="std.net.class.ipv6address" -->
# IPv6Address.isTeredo

[← IPv6Address](index.md)

## 签名

```cangjie role=signature
public func isTeredo(): Bool
```

判断此 IPv6Address 对象是不是 `Teredo` 地址。

## 契约

功能：判断此 IPv6Address 对象是不是 `Teredo` 地址。`Teredo` 前缀为 `2001::/32`。

返回值：

- Bool - 返回 true 表示是 `Teredo` 地址，否则返回 false。
