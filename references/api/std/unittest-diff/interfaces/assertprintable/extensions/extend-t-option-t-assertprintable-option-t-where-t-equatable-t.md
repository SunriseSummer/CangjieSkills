<!-- cj-doc kind="api-extension" level="6" id="std.unittest.diff.interface.assertprintable.extension.extend-t-option-t-assertprintable-option-t-where-t-equatable-t" parent="std.unittest.diff.interface.assertprintable" -->
# extend<T> Option<T> <: AssertPrintable<Option<T>> where T <: Equatable<T>

[← AssertPrintable](../index.md)

`extend<T> Option<T> <: AssertPrintable<Option<T>> where T <: Equatable<T>`

对 Option<T> 的扩展。

## 成员

| 签名 | 功能 |
|---|---|
| [`hasNestedDiff: Bool`](../prop-hasnesteddiff.md) | 获取是否有嵌套 diff 层级。 |
| [`pprintForAssertion( pp: PrettyPrinter, that: Option<T>, thisPrefix: String, thatPrefix: String, level: Int64 ): PrettyPrinter`](../pprintforassertion.md) | 打印 @Assert/@Expect 的检查结果的方法。 |
