<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.isascii" parent="std.core.struct.string" -->
# String.isAscii

[← String](index.md)

## 签名

```cangjie role=signature
public func isAscii(): Bool
```

判断字符串是否是一个 Ascii 字符串，如果字符串为空或没有 Ascii 以外的字符，则返回 true。

## 契约

返回值：

- Bool - 是则返回 true，不是则返回 false。
