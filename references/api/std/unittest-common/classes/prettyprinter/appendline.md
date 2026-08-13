<!-- cj-doc kind="api-member" level="6" id="std.unittest.common.class.prettyprinter.appendline" parent="std.unittest.common.class.prettyprinter" -->
# PrettyPrinter.appendLine

[← PrettyPrinter](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func appendLine(String): PrettyPrinter

### 签名

```cangjie role=signature
public func appendLine(text: String): PrettyPrinter
```

增加一个字符串到打印器中，跟着一个换行符。

### 契约

参数：

- text: String - 被增加的字符串。

返回值：

- PrettyPrinter - 打印器。

## func appendLine<PP>(PP) where PP <: PrettyPrintable

### 签名

```cangjie role=signature
public func appendLine<PP>(value: PP): PrettyPrinter where PP <: PrettyPrintable
```

增加一个实现了 PrettyPrintable 的对象到打印器中，跟着一个换行符。

### 契约

参数：

- value: PP - 一个实现了 PrettyPrintable 的对象。

返回值：

- PrettyPrinter - 打印器。
