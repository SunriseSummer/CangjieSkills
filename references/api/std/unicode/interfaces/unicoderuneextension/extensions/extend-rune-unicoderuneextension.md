<!-- cj-doc kind="api-extension" level="6" id="std.unicode.interface.unicoderuneextension.extension.extend-rune-unicoderuneextension" parent="std.unicode.interface.unicoderuneextension" -->
# extend Rune <: UnicodeRuneExtension

[← UnicodeRuneExtension](../index.md)

`extend Rune <: UnicodeRuneExtension`

为 Rune 类型扩展 UnicodeRuneExtension 接口，支持字符集相关的操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`isLetter(): Bool`](../isletter.md) | 判断字符是否是 `Unicode` 字母字符。 |
| [`isLowerCase(): Bool`](../islowercase.md) | 判断字符是否是 `Unicode` 小写字符。 |
| [`isNumber(): Bool`](../isnumber.md) | 判断字符是否是 `Unicode` 数字字符。 |
| [`isTitleCase(): Bool`](../istitlecase.md) | 判断字符是否是 `Unicode` 标题化字符。 |
| [`isUpperCase(): Bool`](../isuppercase.md) | 判断字符是否是 `Unicode` 大写字符。 |
| [`isWhiteSpace(): Bool`](../iswhitespace.md) | 判断字符是否是 `Unicode` 空白字符。 |
| [`toLowerCase(): Rune`](../tolowercase.md) | 获取该字符对应的 `Unicode` 小写字符。 |
| [`toLowerCase(opt: CasingOption): Rune`](../tolowercase.md) | 获取该字符对应的 `Unicode` 小写字符。 |
| [`toTitleCase(): Rune`](../totitlecase.md) | 获取该字符对应的 `Unicode` 标题大写字符。 |
| [`toTitleCase(opt: CasingOption): Rune`](../totitlecase.md) | 获取该字符对应的 `Unicode` 标题大写字符。 |
| [`toUpperCase(): Rune`](../touppercase.md) | 获取该字符对应的 `Unicode` 大写字符。 |
| [`toUpperCase(opt: CasingOption): Rune`](../touppercase.md) | 获取该字符对应的 `Unicode` 大写字符。 |
