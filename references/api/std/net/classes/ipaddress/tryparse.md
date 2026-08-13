<!-- cj-doc kind="api-member" level="6" id="std.net.class.ipaddress.tryparse" parent="std.net.class.ipaddress" -->
# IPAddress.tryParse

[← IPAddress](index.md)

## 签名

```cangjie role=signature
public static func tryParse(s: String): ?IPAddress
```

将 IP 地址字符串转换为 IPAddress 对象，如果不是合法字符串，则返回 `None`。

## 契约

参数：

- s: String - IP 地址字符串。

返回值：

- ?IPAddress - ?IPAddress 对象。
