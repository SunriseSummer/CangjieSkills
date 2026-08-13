<!-- cj-doc kind="api-member" level="6" id="std.unicode.interface.unicoderuneextension.istitlecase" parent="std.unicode.interface.unicoderuneextension" -->
# UnicodeRuneExtension.isTitleCase

[← UnicodeRuneExtension](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func isTitleCase()

### 签名

```cangjie role=signature
func isTitleCase(): Bool
```

判断该类型是否是 `Unicode` 标题化字符。

### 契约

`Unicode` 中的标题化字符指的是一种特殊的字母形式，它们在某些语言中用于表示标题中每个单词的首字母大写的形式。这些字母由特殊的字符表示，例如 U+01C5（ǅ）和 U+01F1（Ǳ）。这些字符通常用于一些东欧语言，如克罗地亚语和塞尔维亚语。

标题化字符包括：`0x01C5`、`0x01C8`、`0x01CB`、`0x01F2`、`0x1F88 - 0x1F8F`、`0x1F98 - 0x1F9F`、`0x1F98 - 0x1F9F`、`0x1FA8 - 0x1FAF`、`0x1FBC`、`0x1FCC`、`0x1FFC`

返回值：

- Bool - 如果该类型是 `Unicode` 标题大写字符，返回 `true`，否则返回 `false`。

## func isTitleCase()

适用扩展：[extend Rune <: UnicodeRuneExtension](extensions/extend-rune-unicoderuneextension.md)。

### 签名

```cangjie role=signature
public func isTitleCase(): Bool
```

判断字符是否是 `Unicode` 标题化字符。

### 契约

`Unicode` 中的标题化字符指的是一种特殊的字母形式，它们在某些语言中用于表示标题中每个单词的首字母大写的形式。这些字母由特殊的字符表示，例如 U+01C5（ǅ）和 U+01F1（Ǳ）。这些字符通常用于一些东欧语言，如克罗地亚语和塞尔维亚语。

标题化字符包括：`0x01C5`、`0x01C8`、`0x01CB`、`0x01F2`、`0x1F88 - 0x1F8F`、`0x1F98 - 0x1F9F`、`0x1F98 - 0x1F9F`、`0x1FA8 - 0x1FAF`、`0x1FBC`、`0x1FCC`、`0x1FFC`

返回值：

- Bool - 如果该字符是 `Unicode` 标题大写字符，返回 `true`，否则返回 `false`。
