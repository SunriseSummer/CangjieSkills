<!-- cj-doc kind="api-member" level="6" id="std.net.class.ipsocketaddress.parse" parent="std.net.class.ipsocketaddress" -->
# IPSocketAddress.parse

[← IPSocketAddress](index.md)

## 签名

```cangjie role=signature
public static func parse(s: String): IPSocketAddress
```

将 IP 协议的 Socket 字符串转换为 IPSocketAddress 对象。

## 契约

参数：

- s: String - IP 协议的 Socket 字符串。

返回值：

- IPSocketAddress - IPSocketAddress 对象。

异常：

- IllegalFormatException - 入参需要是合法的 socket 地址，比如 192.168.0.0:80 或 [fc00::1]:8080，否则抛出异常。
