<!-- cj-doc kind="api-type" level="5" id="std.unittest.common.class.prettyprinter" parent="std.unittest.common" -->
# PrettyPrinter

[← std.unittest.common](../../index.md)

`abstract PrettyPrinter`

拥有颜色和对齐、缩进控制的打印器。

## 方法

| 签名 | 功能 |
|---|---|
| [`PrettyPrinter(let indentationSize!: UInt64 = 4, let startingIndent!: UInt64 = 0)`](prettyprinter-uint64-uint64.md) | PrettyPrinter 构造器。 |
| [`append(text: String): PrettyPrinter`](append.md) | 增加一个字符串到打印器中。 |
| [`append<PP>(value: PP): PrettyPrinter where PP <: PrettyPrintable`](append.md) | 增加一个实现了 PrettyPrintable 的对象到打印器中。 |
| [`appendCentered(text: String, space: UInt64): PrettyPrinter`](appendcentered.md) | 增加一个字符串到打印器中。 |
| [`appendLeftAligned(text: String, space: UInt64): PrettyPrinter`](appendleftaligned.md) | 增加一个字符串到打印器中。 |
| [`appendLine(text: String): PrettyPrinter`](appendline.md) | 增加一个字符串到打印器中，跟着一个换行符。 |
| [`appendLine<PP>(value: PP): PrettyPrinter where PP <: PrettyPrintable`](appendline.md) | 增加一个实现了 PrettyPrintable 的对象到打印器中，跟着一个换行符。 |
| [`appendRightAligned(text: String, space: UInt64): PrettyPrinter`](appendrightaligned.md) | 增加一个字符串到打印器中。 |
| [`colored(color: Color, body: () -> Unit): PrettyPrinter`](colored.md) | 对闭包中给打印器增加的字符串指定颜色。 |
| [`open fillLimitedSpace(spaceSize: Int64, body: () -> Unit): c`](filllimitedspace.md) | 指定大小填充代码块。 |
| [`colored(color: Color, text: String): PrettyPrinter`](colored.md) | 对给打印器增加的字符串指定颜色。 |
| [`customOffset(symbols: UInt64, body: () -> Unit): PrettyPrinter`](customoffset.md) | 对闭包中给打印器增加的字符串指定额外缩进的个数。 |
| [`indent(body: () -> Unit): PrettyPrinter`](indent.md) | 对闭包中给打印器增加的字符串指定额外缩进一次。 |
| [`indent(indents: UInt64, body: () -> Unit): PrettyPrinter`](indent.md) | 对闭包中给打印器增加的字符串指定额外缩进指定次数。 |
| [`newLine(): PrettyPrinter`](newline.md) | 增加新行。 |
| [`protected put(s: String): Unit`](put.md) | 打印字符串。 |
| [`protected open putNewLine(): Unit`](putnewline.md) | 打印新行。 |
| [`protected setColor(color: Color): Unit`](setcolor.md) | 设置颜色。 |

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`isTopLevel: Bool`](prop-istoplevel.md) | 获取是否在打印的缩进顶层。 |
