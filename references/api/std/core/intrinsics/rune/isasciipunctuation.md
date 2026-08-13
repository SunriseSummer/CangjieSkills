<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.rune.isasciipunctuation" parent="std.core.intrinsic.rune.extension.extend-rune" -->
# Rune.isAsciiPunctuation

[← extend Rune](extensions/extend-rune.md)

## 签名

```cangjie role=signature
public func isAsciiPunctuation(): Bool
```

判断字符是否是 Ascii 标点符号字符。

## 契约

功能：判断字符是否是 Ascii 标点符号字符。其取值范围为 [21, 2F]、[3A, 40]、[5B, 60] 和 [7B, 7E] 的并集。

返回值：

- Bool - 如果是 Ascii 标点符号字符返回 true，否则返回 false。
