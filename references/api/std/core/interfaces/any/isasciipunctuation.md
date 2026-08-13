<!-- cj-doc kind="api-member" level="7" id="std.core.interface.any.isasciipunctuation" parent="std.core.interface.any.extension.extend-byte" -->
# Any.isAsciiPunctuation

[← extend Byte](extensions/extend-byte.md)

## 签名

```cangjie role=signature
public func isAsciiPunctuation(): Bool
```

判断 Byte 是否是在 Ascii 标点符号范围内。

## 契约

功能：判断 Byte 是否是在 Ascii 标点符号范围内。其取值范围为 [21, 2F]、[3A, 40]、[5B, 60] 和 [7B, 7E] 的并集。

返回值：

- Bool - 如果 Byte 在 Ascii 标点符号范围内返回 true，否则返回 false。
