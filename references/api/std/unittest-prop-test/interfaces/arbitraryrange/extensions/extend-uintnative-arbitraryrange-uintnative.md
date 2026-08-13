<!-- cj-doc kind="api-extension" level="6" id="std.unittest.prop_test.interface.arbitraryrange.extension.extend-uintnative-arbitraryrange-uintnative" parent="std.unittest.prop_test.interface.arbitraryrange" -->
# extend UIntNative <: ArbitraryRange<UIntNative>

[← ArbitraryRange<T>](../index.md)

`extend UIntNative <: ArbitraryRange<UIntNative>`

为 UIntNative 类型实现的可以在一定范围内生成值的方法。

## 成员

| 签名 | 功能 |
|---|---|
| [`arbitraryRange(random: RandomSource, min: UIntNative, max: UIntNative): Generator<UIntNative>`](../arbitraryrange/index.md) | 返回在范围内生成的值。 |
| [`max(): UIntNative`](../max/index.md) | 返回最大值。 |
| [`min(): UIntNative`](../min/index.md) | 返回最小值。 |
