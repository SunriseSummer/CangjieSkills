<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.rune.isasciiwhitespace" parent="std.core.intrinsic.rune.extension.extend-rune" -->
# Rune.isAsciiWhiteSpace

[← extend Rune](extensions/extend-rune.md)

## 签名

```cangjie role=signature
public func isAsciiWhiteSpace(): Bool
```

判断字符是否是 Ascii 空白字符。

## 契约

功能：判断字符是否是 Ascii 空白字符。其取值范围为 [09, 0D] 和 {20} 的并集。

返回值：

- Bool - 如果是 Ascii 空白字符返回 true，否则返回 false。
