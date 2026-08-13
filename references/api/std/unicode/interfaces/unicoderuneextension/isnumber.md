<!-- cj-doc kind="api-member" level="6" id="std.unicode.interface.unicoderuneextension.isnumber" parent="std.unicode.interface.unicoderuneextension" -->
# UnicodeRuneExtension.isNumber

[← UnicodeRuneExtension](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func isNumber()

### 签名

```cangjie role=signature
func isNumber(): Bool
```

判断类型是否是 `Unicode` 数字字符。

### 契约

返回值：

- Bool - 如果该类型是 `Unicode` 数字字符，返回 `true`，否则返回 `false`。

## func isNumber()

适用扩展：[extend Rune <: UnicodeRuneExtension](extensions/extend-rune-unicoderuneextension.md)。

### 签名

```cangjie role=signature
public func isNumber(): Bool
```

判断字符是否是 `Unicode` 数字字符。

### 契约

返回值：

- Bool - 如果该字符是 `Unicode` 数字字符，返回 `true`，否则返回 `false`。
