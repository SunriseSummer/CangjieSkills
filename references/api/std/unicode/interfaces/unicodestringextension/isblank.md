<!-- cj-doc kind="api-member" level="6" id="std.unicode.interface.unicodestringextension.isblank" parent="std.unicode.interface.unicodestringextension" -->
# UnicodeStringExtension.isBlank

[← UnicodeStringExtension](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func isBlank()

### 签名

```cangjie role=signature
func isBlank(): Bool
```

判断当前字符串是否为空，或仅包含 `Unicode` 字符集中的空字符。

### 契约

空白字符包括 `0x0009`、`0x000A`、`0x000B`、`0x000C`、`0x000D`、`0x0020`、`0x0085`、`0x00A0`、`0x1680`、`0x2000`、`0x2001`、`0x2002`、`0x2003`、`0x2004`、`0x2005`、`0x2006`、`0x2007`、`0x2008`、`0x2009`、`0x200A`、`0x2028`、`0x2029`、`0x202F`、`0x205F`、`0x3000`。

返回值：

- Bool - 如果字符串为空，或仅包含空字符，返回 `true`，否则返回 `false`。

## func isBlank()

适用扩展：[extend String <: UnicodeStringExtension](extensions/extend-string-unicodestringextension.md)。

### 签名

```cangjie role=signature
public func isBlank(): Bool
```

判断当前字符串是否为空，或仅包含 `Unicode` 字符集中的空字符。

### 契约

空白字符包括 `0x0009`、`0x000A`、`0x000B`、`0x000C`、`0x000D`、`0x0020`、`0x0085`、`0x00A0`、`0x1680`、`0x2000`、`0x2001`、`0x2002`、`0x2003`、`0x2004`、`0x2005`、`0x2006`、`0x2007`、`0x2008`、`0x2009`、`0x200A`、`0x2028`、`0x2029`、`0x202F`、`0x205F`、`0x3000`。

返回值：

- Bool - 如果字符串为空，或仅包含空字符，返回 `true`，否则返回 `false`。
