<!-- cj-doc kind="api-extension" level="6" id="std.unittest.prop_test.interface.randomsource.extension.extend-random" parent="std.unittest.prop_test.interface.randomsource" -->
# extend Random

[← RandomSource](../index.md)

`extend Random <: RandomSource`

对 Random 类型扩展 RandomSource 接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`open nextBool(): Bool`](../nextbool.md) | 获取一个布尔类型的伪随机值。 |
| [`open nextFloat16(): Float16`](../nextfloat16.md) | 获取一个 Float16 类型的伪随机数，其范围为 [0.0, 1.0)。 |
| [`open nextFloat32(): Float32`](../nextfloat32.md) | 获取一个 Float32 类型的伪随机数，其范围为 [0.0, 1.0)。 |
| [`open nextFloat64(): Float64`](../nextfloat64.md) | 获取一个 Float64 类型的伪随机数，其范围为 [0.0, 1.0)。 |
| [`nextGaussianFloat64(mean!: Float64 = 0.0, sigma!: Float64 = 1.0): Float64`](../nextgaussianfloat64.md) | 获取一个 Float64 类型的符合指定均值与标准差的高斯分布的随机数。 |
| [`open nextInt16(): Int16`](../nextint16.md) | 获取一个 Int16 类型的伪随机数。 |
| [`open nextInt16(upper: Int16): Int16`](../nextint16.md) | 获取一个范围在 0, `upper`) 的 [Int16 类型的伪随机数。 |
| [`open nextInt32(): Int32`](../nextint32.md) | 获取一个 Int32 类型的伪随机数。 |
| [`open nextInt32(upper: Int32): Int32`](../nextint32.md) | 获取一个范围在 0, `upper`) 的 [Int32 类型的伪随机数。 |
| [`open nextInt64(): Int64`](../nextint64.md) | 获取一个 Int64 类型的伪随机数。 |
| [`open nextInt64(upper: Int64): Int64`](../nextint64.md) | 获取一个范围在 0, `upper`) 的 [Int64 类型的伪随机数。 |
| [`open nextInt8(): Int8`](../nextint8.md) | 获取一个 Int8 类型的伪随机数。 |
| [`open nextInt8(upper: Int8): Int8`](../nextint8.md) | 获取一个范围在 0, `upper`) 的 [Int8 类型的伪随机数。 |
| [`nextIntNative(): IntNative`](../nextintnative.md) | 获取一个 IntNative 类型的伪随机数。 |
| [`open nextUInt16(): UInt16`](../nextuint16.md) | 获取一个 UInt16 类型的伪随机数。 |
| [`open nextUInt16(upper: UInt16): UInt16`](../nextuint16.md) | 获取一个范围在 0, `upper`) 的 [UInt16 类型的伪随机数。 |
| [`open nextUInt32(): UInt32`](../nextuint32.md) | 获取一个 UInt32 类型的伪随机数。 |
| [`open nextUInt32(upper: UInt32): UInt32`](../nextuint32.md) | 获取一个范围在 0, `upper`) 的 [UInt32 类型的伪随机数。 |
| [`open nextUInt64(): UInt64`](../nextuint64.md) | 获取一个 UInt64 类型的伪随机数。 |
| [`open nextUInt64(upper: UInt64): UInt64`](../nextuint64.md) | 获取一个范围在 0, `upper`) 的 [UInt64 类型的伪随机数。 |
| [`open nextUInt8(): UInt8`](../nextuint8.md) | 获取一个 UInt8 类型的伪随机数。 |
| [`open nextUInt8(upper: UInt8): UInt8`](../nextuint8.md) | 获取一个范围在 0, `upper`) 的 [UInt8 类型的伪随机数。 |
| [`nextUIntNative(): UIntNative`](../nextuintnative.md) | 获取一个 UIntNative 类型的伪随机数。 |
| [`open suggestBool(): Bool`](../suggestbool.md) | 获取一个布尔类型的伪随机值。 |
| [`open suggestRune(): Rune`](../suggestrune.md) | 获取一个 Rune 类型的伪随机值。 |
| [`open suggestFloat16(): Float16`](../suggestfloat16.md) | 获取一个 Float16 类型的伪随机数，其范围为 [0.0, 1.0)。 |
| [`open suggestFloat32(): Float32`](../suggestfloat32.md) | 获取一个 Float32 类型的伪随机数，其范围为 [0.0, 1.0)。 |
| [`open suggestFloat64(): Float64`](../suggestfloat64.md) | 获取一个 Float64 类型的伪随机数，其范围为 [0.0, 1.0)。 |
| [`open suggestInt16(): Int16`](../suggestint16.md) | 获取一个 Int16 类型的伪随机数。 |
| [`open suggestInt32(): Int32`](../suggestint32.md) | 获取一个 Int32 类型的伪随机数。 |
| [`open suggestInt64(): Int64`](../suggestint64.md) | 获取一个 Int64 类型的伪随机数。 |
| [`open suggestInt8(): Int8`](../suggestint8.md) | 获取一个 Int8 类型的伪随机数。 |
| [`suggestIntNative(): IntNative`](../suggestintnative.md) | 获取一个 IntNative 类型的伪随机数。 |
| [`open suggestUInt16(): UInt16`](../suggestuint16.md) | 获取一个 UInt16 类型的伪随机数。 |
| [`open suggestUInt32(): UInt32`](../suggestuint32.md) | 获取一个 UInt32 类型的伪随机数。 |
| [`open suggestUInt64(): UInt64`](../suggestuint64.md) | 获取一个 UInt64 类型的伪随机数。 |
| [`open suggestUInt8(): UInt8`](../suggestuint8.md) | 获取一个 UInt8 类型的伪随机数。 |
| [`suggestUIntNative(): UIntNative`](../suggestuintnative.md) | 获取一个 UIntNative 类型的伪随机数。 |
| [`suggestInt64(l: Int64, r: Int64): Int64`](../suggestint64.md) | 获取一个 Int64 类型的伪随机数。 |
| [`suggestUInt64(l: UInt64, r: UInt64): UInt64`](../suggestuint64.md) | 获取一个 UInt64 类型的伪随机数。 |
| [`suggestInt32(l: Int32, r: Int32): Int32`](../suggestint32.md) | 获取一个 Int32 类型的伪随机数。 |
| [`suggestUInt32(UInt32, UInt32): UInt32`](../suggestuint32.md) | 获取一个 UInt32 类型的伪随机数。 |
| [`suggestInt16(l: Int16, r: Int16): Int16`](../suggestint16.md) | 获取一个 Int16 类型的伪随机数。 |
| [`suggestUInt16(l: UInt16, r: UInt16): UInt16`](../suggestuint16.md) | 获取一个 UInt16 类型的伪随机数。 |
| [`suggestInt8(l: Int8, r: Int8): Int8`](../suggestint8.md) | 获取一个 Int8 类型的伪随机数。 |
| [`suggestUInt8(l: UInt8, r: UInt8): UInt8`](../suggestuint8.md) | 获取一个 UInt8 类型的伪随机数。 |
| [`suggestIntNative(l: IntNative, r: IntNative): IntNative`](../suggestintnative.md) | 获取一个 IntNative 类型的伪随机数。 |
| [`suggestUIntNative(l: UIntNative, r: UIntNative): UIntNative`](../suggestuintnative.md) | 获取一个 UIntNative 类型的伪随机数。 |
| [`suggestFloat64(l: Float64, r: Float64): Float64`](../suggestfloat64.md) | 获取一个 Float64 类型的伪随机数。 |
| [`suggestFloat32(l: Float32, r: Float32): Float32`](../suggestfloat32.md) | 获取一个 Float32 类型的伪随机数。 |
| [`suggestFloat16(l: Float16, r: Float16): Float16`](../suggestfloat16.md) | 获取一个 Float16 类型的伪随机数。 |
