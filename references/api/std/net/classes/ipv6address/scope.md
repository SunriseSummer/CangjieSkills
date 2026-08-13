<!-- cj-doc kind="api-member" level="6" id="std.net.class.ipv6address.scope" parent="std.net.class.ipv6address" -->
# IPv6Address.scope

[← IPv6Address](index.md)

## 签名

```cangjie role=signature
public func scope(scopeId: ?UInt32): IPv6Address
```

使用本 IPv6Address 对象的地址值和指定的范围 ID 转换为新的 IPv6Address 对象，如果指定的范围 ID 为 None，则去除已有的范围 ID。

## 契约

参数：

- scopeId: ?UInt32 - 范围 ID。

返回值：

- IPv6Address - 转换后的 IPv6Address 对象。
