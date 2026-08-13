<!-- cj-doc kind="api-type" level="5" id="std.unittest.common.class.prettytext" parent="std.unittest.common" -->
# PrettyText

[← std.unittest.common](../../index.md)

`PrettyText <: PrettyPrinter & PrettyPrintable & ToString`

存储打印的输出。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 默认构造器，生成一个空的对象。 |
| [`init(string: String)`](init.md) | 构造器，生成一个以入参开头的文本构造器。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`isEmpty(): Bool`](isempty.md) | 返回当前构造器是否为空，即未有值传入给构造器。 |
| [`pprint(to: PrettyPrinter): PrettyPrinter`](pprint.md) | 打印信息到打印器上。 |
| [`toString(): String`](tostring.md) | 打印文本到字符串上。 |
| [`static of<PP>(pp: PP): PrettyText where PP <: PrettyPrintable`](of.md) | 通过打印从 PrettyPrintable 创建 PrettyText。 |
