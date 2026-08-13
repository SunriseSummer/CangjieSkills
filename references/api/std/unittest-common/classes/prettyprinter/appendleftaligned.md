<!-- cj-doc kind="api-member" level="6" id="std.unittest.common.class.prettyprinter.appendleftaligned" parent="std.unittest.common.class.prettyprinter" -->
# PrettyPrinter.appendLeftAligned

[← PrettyPrinter](index.md)

## 签名

```cangjie role=signature
public func appendLeftAligned(text: String, space: UInt64): PrettyPrinter
```

增加一个字符串到打印器中。

## 契约

功能：增加一个字符串到打印器中。左对齐至指定字符数，不足的字符由空格补齐。不支持多行字符串，对多行字符串不支持缩进。

参数：

- text: String - 被增加的字符串。
- space: UInt64 - 对齐的字符数量。

返回值：

- PrettyPrinter - 打印器。
