<!-- cj-doc kind="api-extension" level="6" id="std.unicode.interface.unicodestringextension.extension.extend-string-unicodestringextension" parent="std.unicode.interface.unicodestringextension" -->
# extend String <: UnicodeStringExtension

[← UnicodeStringExtension](../index.md)

`extend String <: UnicodeStringExtension`

为 String 类型实现 UnicodeStringExtension 接口，支持字符集相关的操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`isBlank(): Bool`](../isblank.md) | 判断当前字符串是否为空，或仅包含 `Unicode` 字符集中的空字符。 |
| [`toLower(): String`](../tolower.md) | 将当前字符串中所有 `Unicode` 字符集范围内的大写字符转化为小写字符。 |
| [`toLower(opt: CasingOption): String`](../tolower.md) | 将当前字符串中所有 `Unicode` 字符集范围内的大写字符转化为小写字符。 |
| [`toTitle(): String`](../totitle.md) | 将当前字符串中 `Unicode` 字符集范围内可以转换为标题大写字符的转换为标题大写字符。 |
| [`toTitle(opt: CasingOption): String`](../totitle.md) | 将当前字符串中 `Unicode` 字符集范围内可以转换为标题大写字符的转换为标题大写字符。 |
| [`toUpper(): String`](../toupper.md) | 将当前字符串中所有 `Unicode` 字符集范围内的小写字符转化为大写字符。 |
| [`toUpper(opt: CasingOption): String`](../toupper.md) | 将当前字符串中所有 `Unicode` 字符集范围内的小写字符转化为大写字符。 |
| [`trim(): String`](../trim.md) | 去除字符串开头结尾的空字符，空字符定义见 Rune 类型的扩展函数 isWhiteSpace。 |
| [`trimEnd(): String`](../trimend.md) | 去除字符串结尾的空字符，空字符定义见 Rune 类型的扩展函数 isWhiteSpace。 |
| [`trimStart(): String`](../trimstart.md) | 去除字符串开头的空字符，空字符定义见 Rune 类型的扩展函数 isWhiteSpace。 |
