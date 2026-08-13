<!-- cj-doc kind="api-extension" level="6" id="std.unittest.diff.interface.assertprintable.extension.extend-float16-assertprintable-float16" parent="std.unittest.diff.interface.assertprintable" -->
# extend Float16 <: AssertPrintable<Float16>

[← AssertPrintable](../index.md)

`extend Float16 <: AssertPrintable<Float16>`

对 Float16 的扩展。

## 成员

| 签名 | 功能 |
|---|---|
| [`hasNestedDiff: Bool`](../prop-hasnesteddiff.md) | 获取是否有嵌套 diff 层级。 |
| [`pprintForAssertion( pp: PrettyPrinter, that: Float16, thisPrefix: String, thatPrefix: String, level: Int64 ): PrettyPrinter`](../pprintforassertion.md) | 打印 @Assert/@Expect 的检查结果的方法。 |
