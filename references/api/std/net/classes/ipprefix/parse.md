<!-- cj-doc kind="api-member" level="6" id="std.net.class.ipprefix.parse" parent="std.net.class.ipprefix" -->
# IPPrefix.parse

[← IPPrefix](index.md)

## 签名

```cangjie role=signature
public static func parse(s: String): IPPrefix
```

将 IP 协议的 Socket 字符串转换为 IPPrefix 对象。

## 契约

参数：

- s: String - IP 协议的 Socket 字符串。

异常：

- IllegalFormatException - 如果不是合法字符串，抛出异常。

返回值：

- IPPrefix - IPPrefix 对象。
