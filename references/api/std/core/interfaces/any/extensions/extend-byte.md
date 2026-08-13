<!-- cj-doc kind="api-extension" level="6" id="std.core.interface.any.extension.extend-byte" parent="std.core.interface.any" -->
# extend Byte

[← Any](../index.md)

`extend Byte`

为 Byte 类型实现一系列扩展方法，主要为在 Ascii 字符集范围内的一些字符判断、转换等操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`isAscii(): Bool`](../isascii.md) | 判断 Byte 是否是在 Ascii 范围内。 |
| [`isAsciiControl(): Bool`](../isasciicontrol.md) | 判断 Byte 是否是在 Ascii 控制字符范围内。 |
| [`isAsciiGraphic(): Bool`](../isasciigraphic.md) | 判断 Byte 是否是在 Ascii 图形字符范围内。 |
| [`isAsciiHex(): Bool`](../isasciihex.md) | 判断 Byte 是否是在 Ascii 十六进制数字范围内。 |
| [`isAsciiLetter(): Bool`](../isasciiletter.md) | 判断 Byte 是否是在 Ascii 拉丁字母范围内。 |
| [`isAsciiLowerCase(): Bool`](../isasciilowercase.md) | 判断 Byte 是否是在 Ascii 小写拉丁字母范围内。 |
| [`isAsciiNumber(): Bool`](../isasciinumber.md) | 判断 Byte 是否是在 Ascii 十进制数字范围内。 |
| [`isAsciiNumberOrLetter(): Bool`](../isasciinumberorletter.md) | 判断 Byte 是否是在 Ascii 十进制数字和拉丁字母范围内。 |
| [`isAsciiOct(): Bool`](../isasciioct.md) | 判断 Byte 是否是在 Ascii 八进制数字范围内。 |
| [`isAsciiPunctuation(): Bool`](../isasciipunctuation.md) | 判断 Byte 是否是在 Ascii 标点符号范围内。 |
| [`isAsciiUpperCase(): Bool`](../isasciiuppercase.md) | 判断 Byte 是否是在 Ascii 大写拉丁字母范围内。 |
| [`isAsciiWhiteSpace(): Bool`](../isasciiwhitespace.md) | 判断 Byte 是否是在 Ascii 空白字符范围内。 |
| [`toAsciiLowerCase(): Byte`](../toasciilowercase.md) | 将 Byte 换为对应的 Ascii 小写字符 Byte，如果无法转换则保持现状。 |
| [`toAsciiUpperCase(): Byte`](../toasciiuppercase.md) | 将 Byte 换为对应的 Ascii 大写字符 Byte，如果无法转换则保持现状。 |
