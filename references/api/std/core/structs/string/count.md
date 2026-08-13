<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.count" parent="std.core.struct.string" -->
# String.count

[← String](index.md)

## 签名

```cangjie role=signature
public func count(str: String): Int64
```

返回子字符串 str 在原字符串中出现的次数。

## 契约

参数：

- str: String - 被搜索的子字符串。

返回值：

- Int64 - 出现的次数，当 str 为空字符串时，返回原字符串中 Rune 的数量加一。
