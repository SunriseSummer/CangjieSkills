<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.rune.toasciilowercase" parent="std.core.intrinsic.rune.extension.extend-rune" -->
# Rune.toAsciiLowerCase

[← extend Rune](extensions/extend-rune.md)

## 签名

```cangjie role=signature
public func toAsciiLowerCase(): Rune
```

将字符转换为 Ascii 小写字符，如果无法转换则保持现状。

## 契约

返回值：

- Rune - 转换后的字符，如果无法转换则返回原来的 Rune。
