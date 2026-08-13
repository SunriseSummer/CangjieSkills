<!-- cj-doc kind="api-type" level="5" id="std.unittest.diff.interface.assertprintable" parent="std.unittest.diff" -->
# AssertPrintable

[← std.unittest.diff](../../index.md)

`AssertPrintable<T>`

提供打印 @Assert/@Expect 的检查结果的方法。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`hasNestedDiff: Bool`](prop-hasnesteddiff.md) | 获取是否有嵌套 diff 层级。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`pprintForAssertion( pp: PrettyPrinter, that: T, thisPrefix: String, thatPrefix: String, level: Int64 ): PrettyPrinter`](pprintforassertion.md) | 打印 @Assert/@Expect 的检查结果的方法。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Float16 <: AssertPrintable<Float16>`](extensions/extend-float16-assertprintable-float16.md) | 对 Float16 的扩展。 |
| [`extend Float32 <: AssertPrintable<Float32>`](extensions/extend-float32-assertprintable-float32.md) | 对 Float32 的扩展。 |
| [`extend Float64 <: AssertPrintable<Float64>`](extensions/extend-float64-assertprintable-float64.md) | 对 Float64 的扩展。 |
| [`extend<T> Option<T> <: AssertPrintable<Option<T>> where T <: Equatable<T>`](extensions/extend-t-option-t-assertprintable-option-t-where-t-equatable-t.md) | 对 Option<T> 的扩展。 |
| [`extend String <: AssertPrintable<String>`](extensions/extend-string-assertprintable-string.md) | 对 String 的扩展。 |
