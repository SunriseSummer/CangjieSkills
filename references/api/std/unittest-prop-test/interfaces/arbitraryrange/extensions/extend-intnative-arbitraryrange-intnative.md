<!-- cj-doc kind="api-extension" level="6" id="std.unittest.prop_test.interface.arbitraryrange.extension.extend-intnative-arbitraryrange-intnative" parent="std.unittest.prop_test.interface.arbitraryrange" -->
# extend IntNative <: ArbitraryRange<IntNative>

[← ArbitraryRange<T>](../index.md)

`extend IntNative <: ArbitraryRange<IntNative>`

为 IntNative 类型实现的可以在一定范围内生成值的方法。

## 成员

| 签名 | 功能 |
|---|---|
| [`arbitraryRange(random: RandomSource, min: IntNative, max: IntNative): Generator<IntNative>`](../arbitraryrange/index.md) | 返回在范围内生成的值。 |
| [`max(): IntNative`](../max/index.md) | 返回最大值。 |
| [`min(): IntNative`](../min/index.md) | 返回最小值。 |
