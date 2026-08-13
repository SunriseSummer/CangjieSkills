<!-- cj-doc kind="api-type" level="5" id="std.unittest.prop_test.interface.arbitraryrange" parent="std.unittest.prop_test" -->
# ArbitraryRange<T>

[← std.unittest.prop_test](../../index.md)

`ArbitraryRange<T> where T <: Arbitrary<T> & Comparable<T>`

接口为不同类型提供可以在一定范围内生成值的方法。

## 方法

| 签名 | 功能 |
|---|---|
| [`arbitraryRange(random: RandomSource, min: T, max: T): Generator<T>`](arbitraryrange/index.md) | 返回在范围内生成的值。 |
| [`max(): T`](max/index.md) | 返回最大值。 |
| [`min(): T`](min/index.md) | 返回最小值。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Float16 <: ArbitraryRange<Float16>`](extensions/extend-float16-arbitraryrange-float16.md) | 为 Float16 类型实现的可以在一定范围内生成值的方法。 |
| [`extend Float32 <: ArbitraryRange<Float32>`](extensions/extend-float32-arbitraryrange-float32.md) | 为 Float32 类型实现的可以在一定范围内生成值的方法。 |
| [`extend Float64 <: ArbitraryRange<Float64>`](extensions/extend-float64-arbitraryrange-float64.md) | 为 Float64 类型实现的可以在一定范围内生成值的方法。 |
| [`extend Int16 <: ArbitraryRange<Int16>`](extensions/extend-int16-arbitraryrange-int16.md) | 为 Int16 类型实现的可以在一定范围内生成值的方法。 |
| [`extend Int32 <: ArbitraryRange<Int32>`](extensions/extend-int32-arbitraryrange-int32.md) | 为 UInt32 类型实现的可以在一定范围内生成值的方法。 |
| [`extend Int64 <: ArbitraryRange<Int64>`](extensions/extend-int64-arbitraryrange-int64.md) | 为 Int64 类型实现的可以在一定范围内生成值的方法。 |
| [`extend Int8 <: ArbitraryRange<Int8>`](extensions/extend-int8-arbitraryrange-int8.md) | 为 Int8 类型实现的可以在一定范围内生成值的方法。 |
| [`extend IntNative <: ArbitraryRange<IntNative>`](extensions/extend-intnative-arbitraryrange-intnative.md) | 为 IntNative 类型实现的可以在一定范围内生成值的方法。 |
| [`extend UInt16 <: ArbitraryRange<UInt16>`](extensions/extend-uint16-arbitraryrange-uint16.md) | 为 UInt16 类型实现的可以在一定范围内生成值的方法。 |
| [`extend UInt32 <: ArbitraryRange<UInt32>`](extensions/extend-uint32-arbitraryrange-uint32.md) | 为 UInt32 类型实现的可以在一定范围内生成值的方法。 |
| [`extend UInt64 <: ArbitraryRange<UInt64>`](extensions/extend-uint64-arbitraryrange-uint64.md) | 为 UInt64 类型实现的可以在一定范围内生成值的方法。 |
| [`extend UInt8 <: ArbitraryRange<UInt8>`](extensions/extend-uint8-arbitraryrange-uint8.md) | 为 UInt8 类型实现的可以在一定范围内生成值的方法。 |
| [`extend UIntNative <: ArbitraryRange<UIntNative>`](extensions/extend-uintnative-arbitraryrange-uintnative.md) | 为 UIntNative 类型实现的可以在一定范围内生成值的方法。 |
