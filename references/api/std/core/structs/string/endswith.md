<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.endswith" parent="std.core.struct.string" -->
# String.endsWith

[← String](index.md)

## 签名

```cangjie role=signature
public func endsWith(suffix: String): Bool
```

判断原字符串是否以 suffix 字符串为后缀结尾。

## 契约

参数：

- suffix: String - 被判断的后缀字符串。

返回值：

- Bool - 如果字符串 str 是原字符串的后缀，返回 true，否则返回 false，特别地，如果 str 字符串长度为 0，返回 true。
