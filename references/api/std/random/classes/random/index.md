<!-- cj-doc kind="api-type" level="5" id="std.random.class.random" parent="std.random" -->
# Random

[← std.random](../../index.md)

`Random`

提供生成伪随机数的相关功能。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`seed: UInt64`](prop-seed.md) | 获取随机数种子。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 默认无参构造函数创建新的 Random 对象。 |
| [`init(seed: UInt64)`](init.md) | 使用随机数种子创建新的 Random 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`nextBits(bits: UInt64): UInt64`](nextbits.md) | 生成一个指定位长的随机整数。 |
| [`nextBool(): Bool`](nextbool.md) | 获取一个布尔类型的伪随机值。 |
| [`nextBytes(bytes: Array<Byte>): Unit`](nextbytes.md) | 生成随机数替换入参数组中的每个元素。 |
| [`nextBytes(length: Int32): Array<Byte>`](nextbytes.md) | 生成指定长度的随机数数组。 |
| [`nextFloat16(): Float16`](nextfloat16.md) | 获取一个 Float16 类型的伪随机数，其范围为 [0.0, 1.0)。 |
| [`nextFloat32(): Float32`](nextfloat32.md) | 获取一个 Float32 类型的伪随机数，其范围为 [0.0, 1.0)。 |
| [`nextFloat64(): Float64`](nextfloat64.md) | 获取一个 Float64 类型的伪随机数，其范围为 [0.0, 1.0)。 |
| [`nextGaussianFloat16(mean!: Float16 = 0.0, sigma!: Float16 = 1.0): Float16`](nextgaussianfloat16.md) | 获取一个 Float16 类型的符合指定均值与标准差的高斯分布的随机数。 |
| [`nextGaussianFloat32(mean!: Float32 = 0.0, sigma!: Float32 = 1.0): Float32`](nextgaussianfloat32.md) | 获取一个 Float32 类型的符合指定均值与标准差的高斯分布的随机数。 |
| [`nextGaussianFloat64(mean!: Float64 = 0.0, sigma!: Float64 = 1.0): Float64`](nextgaussianfloat64.md) | 获取一个 Float64 类型的符合指定均值与标准差的高斯分布的随机数。 |
| [`nextInt16(): Int16`](nextint16.md) | 获取一个 Int16 类型的伪随机数。 |
| [`nextInt16(upper: Int16): Int16`](nextint16.md) | 获取一个范围在 0, `upper`) 的 [Int16 类型的伪随机数。 |
| [`nextInt32(): Int32`](nextint32.md) | 获取一个 Int32 类型的伪随机数。 |
| [`nextInt32(upper: Int32): Int32`](nextint32.md) | 获取一个范围在 0, `upper`) 的 [Int32 类型的伪随机数。 |
| [`nextInt64(): Int64`](nextint64.md) | 获取一个 Int64 类型的伪随机数。 |
| [`nextInt64(upper: Int64): Int64`](nextint64.md) | 获取一个范围在 0, `upper`) 的 [Int64 类型的伪随机数。 |
| [`nextInt8(): Int8`](nextint8.md) | 获取一个 Int8 类型的伪随机数。 |
| [`nextInt8(upper: Int8): Int8`](nextint8.md) | 获取一个范围在 0, `upper`) 的 [Int8 类型的伪随机数。 |
| [`nextUInt16(): UInt16`](nextuint16.md) | 获取一个 UInt16 类型的伪随机数。 |
| [`nextUInt16(upper: UInt16): UInt16`](nextuint16.md) | 获取一个范围在 0, `upper`) 的 [UInt16 类型的伪随机数。 |
| [`nextUInt32(): UInt32`](nextuint32.md) | 获取一个 UInt32 类型的伪随机数。 |
| [`nextUInt32(upper: UInt32): UInt32`](nextuint32.md) | 获取一个范围在 0, `upper`) 的 [UInt32 类型的伪随机数。 |
| [`nextUInt64(): UInt64`](nextuint64.md) | 获取一个 UInt64 类型的伪随机数。 |
| [`nextUInt64(upper: UInt64): UInt64`](nextuint64.md) | 获取一个范围在 0, `upper`) 的 [UInt64 类型的伪随机数。 |
| [`nextUInt8(): UInt8`](nextuint8.md) | 获取一个 UInt8 类型的伪随机数。 |
| [`nextUInt8(upper: UInt8): UInt8`](nextuint8.md) | 获取一个范围在 0, `upper`) 的 [UInt8 类型的伪随机数。 |
