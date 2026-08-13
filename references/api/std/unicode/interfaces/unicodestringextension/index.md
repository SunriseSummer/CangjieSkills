<!-- cj-doc kind="api-type" level="5" id="std.unicode.interface.unicodestringextension" parent="std.unicode" -->
# UnicodeStringExtension

[← std.unicode](../../index.md)

`UnicodeStringExtension`

为 `String` 提供 Unicode 空白判断、裁剪及大小写转换；大小写映射可能改变 Rune 数量，应对完整字符串调用 `toLower`/`toUpper`，不要逐 Rune 拼接。

## 方法

| 签名 | 功能 |
|---|---|
| [`isBlank(): Bool`](isblank.md) | 判断当前字符串是否为空，或仅包含 `Unicode` 字符集中的空字符。 |
| [`toLower(): String`](tolower.md) | 将当前字符串中所有 `Unicode` 字符集范围内的大写字符转化为小写字符。 |
| [`toLower(opt: CasingOption): String`](tolower.md) | 将当前字符串中所有 `Unicode` 字符集范围内的大写字符转化为小写字符。 |
| [`toTitle(): String`](totitle.md) | 将当前字符串中 `Unicode` 字符集范围内可以转换为标题大写字符的转换为标题大写字符。 |
| [`toTitle(opt: CasingOption): String`](totitle.md) | 将当前字符串中 `Unicode` 字符集范围内可以转换为标题大写字符的转换为标题大写字符。 |
| [`toUpper(): String`](toupper.md) | 将当前字符串中所有 `Unicode` 字符集范围内的小写字符转化为大写字符。 |
| [`toUpper(opt: CasingOption): String`](toupper.md) | 将当前字符串中所有 `Unicode` 字符集范围内的小写字符转化为大写字符。 |
| [`trim(): String`](trim.md) | 去除字符串开头结尾的空字符串，空字符定义见 Rune 类型的扩展函数 isWhiteSpace。 |
| [`trimEnd(): String`](trimend.md) | 去除字符串结尾的空字符，空字符定义见 Rune 类型的扩展函数 isWhiteSpace。 |
| [`trimStart(): String`](trimstart.md) | 去除字符串开头的空字符，空字符定义见 Rune 类型的扩展函数 isWhiteSpace。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend String <: UnicodeStringExtension`](extensions/extend-string-unicodestringextension.md) | 为 String 类型实现 UnicodeStringExtension 接口，支持字符集相关的操作。 |
