<!-- cj-doc kind="api-type" level="5" id="std.math.numeric.struct.bigint" parent="std.math.numeric" -->
# BigInt

[← std.math.numeric](../../index.md)

`BigInt <: Comparable<BigInt> & Hashable & ToString`

BigInt 定义为任意精度（二进制）的有符号整数。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`bitLen: Int64`](prop-bitlen.md) | 获取此 BigInt 的最短 bit 长度。 |
| [`sign: Int64`](prop-sign.md) | 获取此 BigInt 的符号。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(bytes: Array<Byte>)`](init/index.md) | 通过大端的 Byte 数组以补码形式构建一个 BigInt 结构体。 |
| [`init(sign: Bool, magnitude: Array<Byte>)`](init/index.md) | 通过符号位和真值的绝对值构建一个 BigInt 结构体。 |
| [`init(sign: Bool, bitLen: Int64, rand!: Random = Random())`](init/index.md) | 通过指定正负、bit 长度和随机数种子构建一个随机的 BigInt 结构体。 |
| [`init(n: Float16)`](init/index.md) | 通过半精度浮点数构建一个 BigInt 结构体。 |
| [`init(n: Float32)`](init/index.md) | 通过单精度浮点数构建一个 BigInt 结构体。 |
| [`init(n: Float64)`](init/index.md) | 通过双精度浮点数构建一个 BigInt 结构体。 |
| [`init(n: Int16)`](init/index.md) | 通过 16 位有符号整数构建一个 BigInt 结构体。 |
| [`init(n: Int32)`](init/index.md) | 通过 32 位有符号整数构建一个 BigInt 结构体。 |
| [`init(n: Int64)`](init/index.md) | 通过 64 位有符号整数构建一个 BigInt 结构体。 |
| [`init(n: Int8)`](init/index.md) | 通过 8 位有符号整数构建一个 BigInt 结构体。 |
| [`init(n: IntNative)`](init/index.md) | 通过平台相关有符号整数构建一个 BigInt 结构体。 |
| [`init(n: UInt16)`](init/index.md) | 通过 16 位无符号整数构建一个 BigInt 结构体。 |
| [`init(n: UInt32)`](init/index.md) | 通过 32 位无符号整数构建一个 BigInt 结构体。 |
| [`init(n: UInt64)`](init/index.md) | 通过 64 位无符号整数构建一个 BigInt 结构体。 |
| [`init(n: UInt8)`](init/index.md) | 通过 8 位无符号整数构建一个 BigInt 结构体。 |
| [`init(n: UIntNative)`](init/index.md) | 通过平台相关无符号整数构建一个 BigInt 结构体。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static randomProbablePrime(bitLen: Int64, certainty: UInt64, rand!: Random = Random()): BigInt`](randomprobableprime.md) | 通过可选的随机数种子构建一个随机的 BigInt 素数，素数的 bit 长度不超过入参 `bitLen`。 |
| [`clearBit(index: Int64): BigInt`](clearbit.md) | 通过将指定索引位置的 bit 修改为 0 来构造一个新 BigInt。 |
| [`compare(that: BigInt): Ordering`](compare.md) | 判断 BigInt 与另一个 BigInt 的关系。 |
| [`divAndMod(that: BigInt): (BigInt, BigInt)`](divandmod.md) | BigInt 的除法运算。 |
| [`flipBit(index: Int64): BigInt`](flipbit.md) | 通过翻转指定索引位置的 bit 来构造一个新 BigInt。 |
| [`hashCode(): Int64`](hashcode.md) | 计算并返回此 BigInt 的哈希值。 |
| [`isProbablePrime(certainty: UInt64): Bool`](isprobableprime.md) | 判断一个数是不是素数。 |
| [`modInverse(that: BigInt): BigInt`](modinverse.md) | 求模逆元。 |
| [`modPow(n: BigInt, m!: ?BigInt = None): BigInt`](modpow.md) | 计算此 BigInt 的 n 次幂模 `m` 的结果，并返回。 |
| [`setBit(index: Int64): BigInt`](setbit.md) | 通过将指定索引位置的 bit 修改为 1 来构造一个新 BigInt。 |
| [`testBit(index: Int64): Bool`](testbit.md) | 判断指定位置的 bit 信息，如果指定位置的 bit 为 0，则返回 false；为 1，则返回 true。 |
| [`toBytes(): Array<Byte>`](tobytes.md) | 计算并返回此 BigInt 的大端补码字节数组。 |
| [`toFloat16(): Float16`](tofloat16.md) | 将当前 BigInt 对象转化为 Float16 类型。 |
| [`toFloat32(): Float32`](tofloat32.md) | 将当前 BigInt 对象转化为 Float32 类型。 |
| [`toFloat64(): Float64`](tofloat64.md) | 将当前 BigInt 对象转化为 Float64 类型。 |
| [`toInt16(overflowHandling!: OverflowStrategy = Throwing): Int16`](toint16.md) | 将当前 BigInt 对象转化为 Int16 类型，支持自定义溢出策略。 |
| [`toInt32(overflowHandling!: OverflowStrategy = Throwing): Int32`](toint32.md) | 将当前 BigInt 对象转化为 Int32 类型，支持自定义溢出策略。 |
| [`toInt64(overflowHandling!: OverflowStrategy = Throwing): Int64`](toint64.md) | 将当前 BigInt 对象转化为 Int64 类型，支持自定义溢出策略。 |
| [`toInt8(overflowHandling!: OverflowStrategy = Throwing): Int8`](toint8.md) | 将当前 BigInt 对象转化为 Int8 类型，支持自定义溢出策略。 |
| [`toIntNative(overflowHandling!: OverflowStrategy = Throwing): IntNative`](tointnative.md) | 将当前 BigInt 对象转化为 IntNative 类型，支持自定义溢出策略。 |
| [`toString(): String`](tostring.md) | 计算并返回此 BigInt 的十进制字符串表示。 |
| [`toUInt16(overflowHandling!: OverflowStrategy = Throwing): UInt16`](touint16.md) | 将当前 BigInt 对象转化为 UInt16 类型，支持自定义溢出策略。 |
| [`toUInt32(overflowHandling!: OverflowStrategy = Throwing): UInt32`](touint32.md) | 将当前 BigInt 对象转化为 UInt32 类型，支持自定义溢出策略。 |
| [`toUInt64(overflowHandling!: OverflowStrategy = Throwing): UInt64`](touint64.md) | 将当前 BigInt 对象转化为 UInt64 类型，支持自定义溢出策略。 |
| [`toUInt8(overflowHandling!: OverflowStrategy = Throwing): UInt8`](touint8.md) | 将当前 BigInt 对象转化为 UInt8 类型，支持自定义溢出策略。 |
| [`toUIntNative(overflowHandling!: OverflowStrategy = Throwing): UIntNative`](touintnative.md) | 将当前 BigInt 对象转化为 UIntNative 类型，支持自定义溢出策略。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !(): BigInt`](operator-not.md) | 按位非。 |
| [`operator !=(that: BigInt): Bool`](operator-ne.md) | 判不等运算。 |
| [`operator %(that: BigInt): BigInt`](operator-mod.md) | BigInt 的模运算。 |
| [`operator &(that: BigInt): BigInt`](operator-bitand.md) | 按位与。 |
| [`operator *(that: BigInt): BigInt`](operator-mul.md) | BigInt 乘法。 |
| [`operator **(n: UInt64): BigInt`](operator-pow.md) | 求 BigInt 的 n 次幂。 |
| [`operator +(that: BigInt): BigInt`](operator-add.md) | BigInt 加法。 |
| [`operator -(): BigInt`](operator-sub.md) | 求 BigInt 的相反数。 |
| [`operator -(that: BigInt): BigInt`](operator-sub.md) | BigInt 减法。 |
| [`operator <(that: BigInt): Bool`](operator-lt.md) | 小于比较运算。 |
| [`operator <<(n: Int64): BigInt`](operator-shl.md) | 左移运算。 |
| [`operator <=(that: BigInt): Bool`](operator-le.md) | 小于等于比较运算。 |
| [`operator ==(that: BigInt): Bool`](operator-eq.md) | 判等运算。 |
| [`operator >(that: BigInt): Bool`](operator-gt.md) | 大于比较运算。 |
| [`operator >=(that: BigInt): Bool`](operator-ge.md) | 大于等于比较运算。 |
| [`operator >>(n: Int64): BigInt`](operator-shr.md) | 右移运算。 |
| [`operator /(that: BigInt): BigInt`](operator-div.md) | BigInt 除法。 |
| [`operator ^(that: BigInt): BigInt`](operator-bitxor.md) | 按位异或。 |
| [`operator \|(that: BigInt): BigInt`](operator-bitor.md) | 按位或。 |

## 跨扩展成员

| 签名 | 功能 |
|---|---|
| [`static parse(value: String): BigInt`](parse.md) | 将字符串解析成一个 BigInt 结构体。 |
| [`static tryParse(value: String): ?BigInt`](tryparse.md) | 尝试将字符串解析成一个 BigInt 结构体。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend BigInt <: Formattable`](extensions/extend-bigint-formattable.md) | 为 BigInt 扩展 Formattable 接口，以实现将 BigInt 实例转换为格式化字符串。 |
| [`extend BigInt <: Integer<BigInt>`](extensions/extend-bigint-integer-bigint.md) | 为 BigInt 类型扩展 Integer<T> 接口。 |
| [`extend BigInt <: Number<BigInt>`](extensions/extend-bigint-number-bigint.md) | 为 BigInt 类型扩展 Number<T> 接口。 |
| [`extend BigInt <: Parsable<BigInt>`](extensions/extend-bigint-parsable-bigint.md) | 此扩展主要用于实现将 BigInt 类型字面量的字符串转换为 BigInt 结构体的相关操作函数。 |
| [`extend BigInt <: RadixConvertible<BigInt>`](extensions/extend-bigint-radixconvertible-bigint.md) | 此扩展主要用于实现将 BigInt 类型字面量的字符串转换为 BigInt 结构体的相关操作函数。 |
