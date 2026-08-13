<!-- cj-doc kind="api-extension" level="6" id="std.unittest.diff.interface.assertprintable.extension.extend-string-assertprintable-string" parent="std.unittest.diff.interface.assertprintable" -->
# extend String <: AssertPrintable<String>

[← AssertPrintable](../index.md)

`extend String <: AssertPrintable<String>`

对 String 的扩展。

## 成员

| 签名 | 功能 |
|---|---|
| [`hasNestedDiff: Bool`](../prop-hasnesteddiff.md) | 获取是否有嵌套 diff 层级。 |
| [`pprintForAssertion( pp: PrettyPrinter, that: String, thisPrefix: String, thatPrefix: String, level: Int64 ): PrettyPrinter`](../pprintforassertion.md) | 打印 @Assert/@Expect 的检查结果的方法。 |
