<!-- cj-doc kind="api-member" level="6" id="std.net.struct.addressfamily.field-inet6" parent="std.net.struct.addressfamily" -->
# AddressFamily.INET6

[← AddressFamily](index.md)

## 签名

```cangjie role=signature
public static const INET6: AddressFamily
```

IPv6 地址族。

## 契约

功能：IPv6 地址族。不同系统下的值分别为：

- macOS: AddressFamily("INET6", 30)
- Windows: AddressFamily("INET6", 23)
- 其他情况：AddressFamily("INET6", 10)

类型：AddressFamily
