<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.contains" parent="std.core.struct.string" -->
# String.contains

[← String](index.md)

## 签名

```cangjie role=signature
public func contains(str: String): Bool
```

判断原字符串中是否包含字符串 str。

## 契约

参数：

- str: String - 待搜索的字符串。

返回值：

- Bool - 如果字符串 str 在原字符串中，返回 true，否则返回 false。特别地，如果 str 字符串长度为 0，返回 true。
