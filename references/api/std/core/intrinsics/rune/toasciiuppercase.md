<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.rune.toasciiuppercase" parent="std.core.intrinsic.rune.extension.extend-rune" -->
# Rune.toAsciiUpperCase

[← extend Rune](extensions/extend-rune.md)

## 签名

```cangjie role=signature
public func toAsciiUpperCase(): Rune
```

将字符转换为 Ascii 大写字符，如果无法转换则保持现状。

## 契约

返回值：

- Rune - 转换后的字符，如果无法转换则返回原来的 Rune。
