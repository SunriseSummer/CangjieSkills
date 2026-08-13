<!-- cj-doc kind="api-member" level="6" id="std.unicode.interface.unicoderuneextension.isuppercase" parent="std.unicode.interface.unicoderuneextension" -->
# UnicodeRuneExtension.isUpperCase

[← UnicodeRuneExtension](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func isUpperCase()

### 签名

```cangjie role=signature
func isUpperCase(): Bool
```

判断该类型是否是 `Unicode` 大写字符。

### 契约

返回值：

- Bool - 如果该类型是 `Unicode` 大写字符，返回 `true`，否则返回 `false`。

## func isUpperCase()

适用扩展：[extend Rune <: UnicodeRuneExtension](extensions/extend-rune-unicoderuneextension.md)。

### 签名

```cangjie role=signature
public func isUpperCase(): Bool
```

判断字符是否是 `Unicode` 大写字符。

### 契约

返回值：

- Bool - 如果该字符是 `Unicode` 大写字符，返回 `true`，否则返回 `false`。
