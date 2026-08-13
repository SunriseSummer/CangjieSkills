<!-- cj-doc kind="api-member" level="6" id="std.net.class.ipsocketaddress.tryparse" parent="std.net.class.ipsocketaddress" -->
# IPSocketAddress.tryParse

[← IPSocketAddress](index.md)

## 签名

```cangjie role=signature
public static func tryParse(s: String): ?IPSocketAddress
```

将 IP 协议的 Socket 字符串转换为 IPSocketAddress 对象，如果不是合法字符串，则返回 `None`。

## 契约

参数：

- s: String - IP 协议的 Socket 字符串。

返回值：

- ?IPSocketAddress - ?IPSocketAddress 对象。
