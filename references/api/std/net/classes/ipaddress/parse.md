<!-- cj-doc kind="api-member" level="6" id="std.net.class.ipaddress.parse" parent="std.net.class.ipaddress" -->
# IPAddress.parse

[← IPAddress](index.md)

## 签名

```cangjie role=signature
public static func parse(s: String): IPAddress
```

将 IP 协议的 Socket 字符串转换为 IPAddress 对象。

## 契约

参数：

- s: String - IP 协议的 Socket 字符串。

返回值：

- IPAddress - IPAddress 对象。

异常：

- IllegalFormatException - 如果不是合法字符串，抛出异常。
