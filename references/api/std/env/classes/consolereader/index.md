<!-- cj-doc kind="api-type" level="5" id="std.env.class.consolereader" parent="std.env" -->
# ConsoleReader

[← std.env](../../index.md)

`ConsoleReader <: InputStream`

提供从控制台读出数据并转换成字符或字符串的功能。

## 方法

| 签名 | 功能 |
|---|---|
| [`read(): ?Rune`](read.md) | 从标准输入中读取下一个字符。 |
| [`read(arr: Array<Byte>): Int64`](read.md) | 从标准输入中读取并放入 `arr` 中。 |
| [`readln(): ?String`](readln.md) | 从标准输入中读取一行字符串。 |
| [`readToEnd(): ?String`](readtoend.md) | 从标准输入中读取所有字符。 |
| [`readUntil(predicate: (Rune) -> Bool): ?String`](readuntil.md) | 从标准输入中读取数据直到读取到的字符满足`predicate`条件结束。 |
| [`readUntil(ch: Rune): ?String`](readuntil.md) | 从标准输入中读取数据直到读取到字符 `ch` 结束。 |
