<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.startswith" parent="std.core.struct.string" -->
# String.startsWith

[← String](index.md)

## 签名

```cangjie role=signature
public func startsWith(prefix: String): Bool
```

判断原字符串是否以 prefix 字符串为前缀。

## 契约

参数：

- prefix: String - 被判断的前缀字符串。

返回值：

- Bool - 如果字符串 str 是原字符串的前缀，返回 true，否则返回 false，特别地，如果 str 字符串长度为 0，返回 true。
