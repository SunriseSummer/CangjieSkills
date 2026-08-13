<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.crypto.class.securerandom" parent="stdx.crypto.crypto" -->
# SecureRandom

[← stdx.crypto.crypto](../../index.md)

`SecureRandom`

用于生成加密安全的伪随机数。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(priv!: Bool = false)`](init.md) | 创建 SecureRandom 实例，可指定是否使用更加安全的加密安全伪随机生成器，加密安全伪随机生成器可用于会话密钥和证书私钥等加密场景。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`nextBits(bits: UInt64): UInt64`](nextbits.md) | 生成一个指定位长的随机整数。 |
| [`nextBool(): Bool`](nextbool.md) | 获取一个随机的 Bool 类型实例。 |
| [`nextBytes(bytes: Array<Byte>): Unit`](nextbytes.md) | 生成随机数替换入参数组中的每个元素。 |
| [`nextBytes(length: Int32): Array<Byte>`](nextbytes.md) | 获取一个指定长度的随机字节的数组。 |
| [`nextFloat16(): Float16`](nextfloat16.md) | 获取一个 Float16 类型且在区间 [0.0, 1.0) 内的随机数。 |
| [`nextFloat32(): Float32`](nextfloat32.md) | 获取一个 Float32 类型且在区间 [0.0, 1.0) 内的随机数。 |
| [`nextFloat64(): Float64`](nextfloat64.md) | 获取一个 Float64 类型且在区间 [0.0, 1.0) 内的随机数。 |
| [`nextGaussianFloat16(mean!: Float16 = 0.0, sigma!: Float16 = 1.0): Float16`](nextgaussianfloat16.md) | 默认获取一个 Float16 类型且符合均值为 0.0 标准差为 1.0 的高斯分布的随机数，其中均值是期望值，可解释为位置参数，决定了分布的位置，标准差可解释为尺度参数，决定了分布的幅度。 |
| [`nextGaussianFloat32(mean!: Float32 = 0.0, sigma!: Float32 = 1.0): Float32`](nextgaussianfloat32.md) | 默认获取一个 Float32 类型且符合均值为 0.0 标准差为 1.0 的高斯分布的随机数，其中均值是期望值，可解释为位置参数，决定了分布的位置，标准差可解释为尺度参数，决定了分布的幅度。 |
| [`nextGaussianFloat64(mean!: Float64 = 0.0, sigma!: Float64 = 1.0): Float64`](nextgaussianfloat64.md) | 默认获取一个 Float64 类型且符合均值为 0.0 标准差为 1.0 的高斯分布的随机数，其中均值是期望值，可解释为位置参数，决定了分布的位置，标准差可解释为尺度参数，决定了分布的幅度。 |
| [`nextInt16(): Int16`](nextint16.md) | 获取一个 Int16 类型的随机数。 |
| [`nextInt32(): Int32`](nextint32.md) | 获取一个 Int32 类型的随机数。 |
| [`nextInt16(max: Int16): Int16`](nextint16.md) | 获取一个 Int16 类型且在区间 [0, max) 内的随机数。 |
| [`nextInt32(max: Int32): Int32`](nextint32.md) | 获取一个 Int32 类型且在区间 [0, max) 内的随机数。 |
| [`nextInt64(): Int64`](nextint64.md) | 获取一个 Int64 类型的随机数。 |
| [`nextInt64(max: Int64): Int64`](nextint64.md) | 获取一个 Int64 类型且在区间 [0, max) 内的随机数。 |
| [`nextInt8(): Int8`](nextint8.md) | 获取一个 Int8 类型的随机数。 |
| [`nextInt8(max: Int8): Int8`](nextint8.md) | 获取一个 Int8 类型且在区间 [0, max) 内的随机数。 |
| [`nextUInt16(): UInt16`](nextuint16.md) | 获取一个 UInt16 类型的随机数。 |
| [`nextUInt16(max: UInt16): UInt16`](nextuint16.md) | 获取一个 UInt16 类型且在区间 [0, max) 内的随机数。 |
| [`nextUInt32(): UInt32`](nextuint32.md) | 获取一个 UInt32 类型的随机数。 |
| [`nextUInt32(max: UInt32): UInt32`](nextuint32.md) | 获取一个 UInt32 类型且在区间 [0, max) 内的随机数。 |
| [`nextUInt64(): UInt64`](nextuint64.md) | 获取一个 UInt64 类型的随机数。 |
| [`nextUInt64(max: UInt64): UInt64`](nextuint64.md) | 获取一个 UInt64 类型且在区间 [0, max) 内的随机数。 |
| [`nextUInt8(): UInt8`](nextuint8.md) | 获取一个 UInt8 类型的随机数。 |
| [`nextUInt8(max: UInt8): UInt8`](nextuint8.md) | 获取一个 UInt8 类型且在区间 [0, max) 内的随机数。 |
