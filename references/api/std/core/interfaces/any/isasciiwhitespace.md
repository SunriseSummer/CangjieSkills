<!-- cj-doc kind="api-member" level="7" id="std.core.interface.any.isasciiwhitespace" parent="std.core.interface.any.extension.extend-byte" -->
# Any.isAsciiWhiteSpace

[← extend Byte](extensions/extend-byte.md)

## 签名

```cangjie role=signature
public func isAsciiWhiteSpace(): Bool
```

判断 Byte 是否是在 Ascii 空白字符范围内。

## 契约

功能：判断 Byte 是否是在 Ascii 空白字符范围内。其取值范围为 [09, 0D] 和 {20} 的并集。

返回值：

- Bool - 如果 Byte 在 Ascii 空白字符范围内返回 true，否则返回 false。
