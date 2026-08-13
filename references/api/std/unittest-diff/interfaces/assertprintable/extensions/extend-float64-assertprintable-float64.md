<!-- cj-doc kind="api-extension" level="6" id="std.unittest.diff.interface.assertprintable.extension.extend-float64-assertprintable-float64" parent="std.unittest.diff.interface.assertprintable" -->
# extend Float64 <: AssertPrintable<Float64>

[← AssertPrintable](../index.md)

`extend Float64 <: AssertPrintable<Float64>`

对 Float64 的扩展。

## 成员

| 签名 | 功能 |
|---|---|
| [`hasNestedDiff: Bool`](../prop-hasnesteddiff.md) | 获取是否有嵌套 diff 层级。 |
| [`pprintForAssertion( pp: PrettyPrinter, that: Float64, thisPrefix: String, thatPrefix: String, level: Int64 ): PrettyPrinter`](../pprintforassertion.md) | 打印 @Assert/@Expect 的检查结果的方法。 |
