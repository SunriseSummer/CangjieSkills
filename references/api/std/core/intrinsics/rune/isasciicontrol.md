<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.rune.isasciicontrol" parent="std.core.intrinsic.rune.extension.extend-rune" -->
# Rune.isAsciiControl

[← extend Rune](extensions/extend-rune.md)

## 签名

```cangjie role=signature
public func isAsciiControl(): Bool
```

判断字符是否是 Ascii 控制字符。

## 契约

功能：判断字符是否是 Ascii 控制字符。其取值范围为 [00, 1F] 和 {7F} 的并集。

返回值：

- Bool - 如果是 Ascii 控制字符返回 true，否则返回 false。
