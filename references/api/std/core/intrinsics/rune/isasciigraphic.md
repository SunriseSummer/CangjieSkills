<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.rune.isasciigraphic" parent="std.core.intrinsic.rune.extension.extend-rune" -->
# Rune.isAsciiGraphic

[← extend Rune](extensions/extend-rune.md)

## 签名

```cangjie role=signature
public func isAsciiGraphic(): Bool
```

判断字符是否是 Ascii 图形字符。

## 契约

功能：判断字符是否是 Ascii 图形字符。其取值范围为 [21, 7E]。

返回值：

- Bool - 如果是 Ascii 图形字符返回 true，否则返回 false。
