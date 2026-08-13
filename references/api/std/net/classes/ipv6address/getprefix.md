<!-- cj-doc kind="api-member" level="6" id="std.net.class.ipv6address.getprefix" parent="std.net.class.ipv6address" -->
# IPv6Address.getPrefix

[← IPv6Address](index.md)

## 签名

```cangjie role=signature
public func getPrefix(prefixLen: UInt8): IPPrefix
```

此 IPv6Address 地址对象根据指定的网络前缀长度创建一个网络前缀对象。

## 契约

参数：

- prefixLen: UInt8 - 网络前缀长度，必须 \>= 0 且 <= 128。

异常：

- IllegalArgumentException - 如果 prefixLen 大小超出范围，抛出异常。

返回值：

- IPPrefix - 网络前缀对象。
