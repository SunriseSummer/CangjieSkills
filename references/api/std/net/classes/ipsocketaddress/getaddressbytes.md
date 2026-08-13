<!-- cj-doc kind="api-member" level="6" id="std.net.class.ipsocketaddress.getaddressbytes" parent="std.net.class.ipsocketaddress" -->
# IPSocketAddress.getAddressBytes

[← IPSocketAddress](index.md)

## 签名

```cangjie role=signature
public func getAddressBytes(): Array<Byte>
```

返回此 IPSocketAddress 对象的原始地址的 Array<Byte> 表示，内容布局与 `sockaddr_in` 或 `sockaddr_in6` 一致。

## 契约

返回值：

- Array\<Byte> - IPSocketAddress 对象的原始地址的 Array\<Byte> 表示。
