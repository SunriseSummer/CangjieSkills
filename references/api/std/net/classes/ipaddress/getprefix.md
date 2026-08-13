<!-- cj-doc kind="api-member" level="6" id="std.net.class.ipaddress.getprefix" parent="std.net.class.ipaddress" -->
# IPAddress.getPrefix

[← IPAddress](index.md)

## 签名

```cangjie role=signature
public open func getPrefix(prefixLen: UInt8): IPPrefix
```

此 IPAddress 地址对象根据指定的网络前缀长度创建一个网络前缀对象。

## 契约

参数：

- prefixLen: UInt8 - 网络前缀长度。

异常：

- IllegalArgumentException - 如果 prefixLen 大小超出范围，抛出异常。

返回值：

- IPPrefix - 网络前缀对象。
