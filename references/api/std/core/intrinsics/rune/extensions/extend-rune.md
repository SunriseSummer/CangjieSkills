<!-- cj-doc kind="api-extension" level="6" id="std.core.intrinsic.rune.extension.extend-rune" parent="std.core.intrinsic.rune" -->
# extend Rune

[← Rune](../index.md)

`extend Rune`

为 Rune 类型实现一系列扩展方法，主要为在 Ascii 字符集范围内的一些字符判断、转换等操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`static fromUtf8(arr: Array<UInt8>, index: Int64): (Rune, Int64)`](../fromutf8.md) | 将字节数组中的指定元素，根据 UTF-8 编码规则转换成字符，并告知字符占用字节长度。 |
| [`static getPreviousFromUtf8(arr: Array<UInt8>, index: Int64): (Rune, Int64)`](../getpreviousfromutf8.md) | 获取字节数组中指定索引对应的字节所在的 UTF-8 编码字符，同时返回该字符首位字节码在数组中的索引。 |
| [`static intoUtf8Array(c: Rune, arr: Array<UInt8>, index: Int64): Int64`](../intoutf8array.md) | 该函数会把字符转成字节码序列然后覆盖 Array 数组内指定位置的字节码。 |
| [`static utf8Size(arr: Array<UInt8>, index: Int64): Int64`](../utf8size.md) | 该函数会返回字节数组指定索引位置为起始的字符占用的字节数。 |
| [`static utf8Size(c: Rune): Int64`](../utf8size.md) | 返回字符对应的 UTF-8 编码的字节码长度，例如中文字符的字节码长度是 3。 |
| [`isAscii(): Bool`](../isascii.md) | 判断字符是否是 Ascii 中的字符。 |
| [`isAsciiControl(): Bool`](../isasciicontrol.md) | 判断字符是否是 Ascii 控制字符。 |
| [`isAsciiGraphic(): Bool`](../isasciigraphic.md) | 判断字符是否是 Ascii 图形字符。 |
| [`isAsciiHex(): Bool`](../isasciihex.md) | 判断字符是否是 Ascii 十六进制字符。 |
| [`isAsciiLetter(): Bool`](../isasciiletter.md) | 判断字符是否是 Ascii 字母字符。 |
| [`isAsciiLowerCase(): Bool`](../isasciilowercase.md) | 判断字符是否是 Ascii 小写字符。 |
| [`isAsciiNumber(): Bool`](../isasciinumber.md) | 判断字符是否是 Ascii 数字字符。 |
| [`isAsciiNumberOrLetter(): Bool`](../isasciinumberorletter.md) | 判断字符是否是 Ascii 数字或拉丁字母字符。 |
| [`isAsciiOct(): Bool`](../isasciioct.md) | 判断字符是否是 Ascii 八进制字符。 |
| [`isAsciiPunctuation(): Bool`](../isasciipunctuation.md) | 判断字符是否是 Ascii 标点符号字符。 |
| [`isAsciiUpperCase(): Bool`](../isasciiuppercase.md) | 判断字符是否是 Ascii 大写字符。 |
| [`isAsciiWhiteSpace(): Bool`](../isasciiwhitespace.md) | 判断字符是否是 Ascii 空白字符。 |
| [`toAsciiLowerCase(): Rune`](../toasciilowercase.md) | 将字符转换为 Ascii 小写字符，如果无法转换则保持现状。 |
| [`toAsciiUpperCase(): Rune`](../toasciiuppercase.md) | 将字符转换为 Ascii 大写字符，如果无法转换则保持现状。 |
