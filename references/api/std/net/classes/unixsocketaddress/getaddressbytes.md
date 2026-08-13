<!-- cj-doc kind="api-member" level="6" id="std.net.class.unixsocketaddress.getaddressbytes" parent="std.net.class.unixsocketaddress" -->
# UnixSocketAddress.getAddressBytes

[← UnixSocketAddress](index.md)

## 签名

```cangjie role=signature
public func getAddressBytes(): Array<Byte>
```

返回此 UnixSocketAddress 对象的原始 IP 地址，内容布局与 `sockaddr_un` 形式一致。

## 契约

返回值：

- Array\<Byte> - 原始 IP 地址的 Array\<Byte> 表示。
