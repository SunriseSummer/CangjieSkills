<!-- cj-doc kind="api-member" level="6" id="std.net.struct.socketdomain.field-ipv6" parent="std.net.struct.socketdomain" -->
# SocketDomain.IPV6

[← SocketDomain](index.md)

## 签名

```cangjie role=signature
public static let IPV6: SocketDomain
```

`IPv6` 通信域。

## 契约

功能：`IPv6` 通信域。不同系统下的值分别为：

- macOS: SocketDomain(30)
- Windows: SocketDomain(23)
- 其他情况：SocketDomain(10)

类型：SocketDomain
