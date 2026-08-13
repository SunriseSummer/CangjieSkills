<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.isasciiblank" parent="std.core.struct.string" -->
# String.isAsciiBlank

[← String](index.md)

## 签名

```cangjie role=signature
public func isAsciiBlank(): Bool
```

判断字符串是否为空或者字符串中的所有 Rune 都是 ascii 码的空白字符（包括：0x09、0x10、0x11、0x12、0x13、0x20）。

## 契约

返回值：

- Bool - 如果是返回 true，否则返回 false。
