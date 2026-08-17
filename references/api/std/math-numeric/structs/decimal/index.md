<!-- cj-doc kind="api-type" level="5" id="std.math.numeric.struct.decimal" parent="std.math.numeric" -->
# Decimal

[← std.math.numeric](../../index.md)

`Decimal <: Comparable<Decimal> & Hashable & ToString`

任意精度有符号十进制数；`value` 是无标度 `BigInt`，`scale` 是小数位数。字符串入口由 `Parsable` 扩展提供：使用 `Decimal.tryParse` 保留失败，或用 `Decimal.parse` 让非法输入抛异常。

## 关键契约

解析与标度：

- `Decimal.parse`/`Decimal.tryParse` 由 `extend Decimal <: Parsable<Decimal>` 提供；前者对非法文本抛异常，后者返回 `None`。
- `reScale(newScale, roundingMode: ...)` 改变标度并按指定模式舍入；`value` 返回结果的无标度 `BigInt`，适合转换成最小货币单位。
- `shiftPoint(n)` 的 1.1.3 方向容易误读：正数向左移动小数点（`Decimal.parse("25").shiftPoint(1)` 为 `2.5`），负数向右移动。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`precision: Int64`](prop-precision.md) | 获取 Decimal 精度值，即无标度整数部分十进制有效数字位数，非负数。 |
| [`scale: Int32`](prop-scale.md) | 获取 Decimal 标度值。 |
| [`sign: Int64`](prop-sign.md) | 获取 Decimal 实例符号值。 |
| [`value: BigInt`](prop-value.md) | 获取 Decimal 无标度整数值，BigInt 承载。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(val: BigInt)`](init/index.md) | 通过有符号大整数 BigInt 构建 `Decimal` 结构体。 |
| [`init(val: BigInt, scale: Int32)`](init/index.md) | 通过有符号大整数 BigInt 和标度值构建 `Decimal` 结构体。 |
| [`init(val: Float16)`](init/index.md) | 通过 16 位有符号浮点数构建 Decimal 对象。 |
| [`init(val: Float32)`](init/index.md) | 通过 32 位有符号浮点数构建 Decimal 对象。 |
| [`init(val: Float64)`](init/index.md) | 通过 64 位有符号浮点数构建 Decimal 对象。 |
| [`init(val: Int16)`](init/index.md) | 通过 16 位有符号整数构建 Decimal 结构体。 |
| [`init(val: Int32)`](init/index.md) | 通过 32 位有符号整数构建 Decimal 对象。 |
| [`init(val: Int64)`](init/index.md) | 通过 64 位有符号整数构建 Decimal 对象。 |
| [`init(val: Int8)`](init/index.md) | 通过 8 位有符号整数构建 Decimal 结构体。 |
| [`init(val: IntNative)`](init/index.md) | 通过 32 位或 64 位（具体长度与平台相关）有符号整数构建 Decimal 对象。 |
| [`init(val: UInt16)`](init/index.md) | 通过 16 位无符号整数构建 Decimal 对象。 |
| [`init(val: UInt32)`](init/index.md) | 通过 32 位无符号整数构建 Decimal 对象。 |
| [`init(val: UInt64)`](init/index.md) | 通过 64 位无符号整数构建 Decimal 对象。 |
| [`init(val: UInt8)`](init/index.md) | 通过 8 位无符号整数构建 Decimal 对象。 |
| [`init(val: UIntNative)`](init/index.md) | 通过 32 位或 64 位（具体长度与平台相关）无符号整数构建 Decimal 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`compare(d: Decimal): Ordering`](compare.md) | 比较当前对象与入参 Decimal 对象，返回比较结果值。 |
| [`divAndMod(d: Decimal): (BigInt, Decimal)`](divandmod.md) | 除法取商和余数运算，除以入参 Decimal 对象，返回整数商值和余数值。 |
| [`divWithPrecision(d: Decimal, precision: Int64, roundingMode!: RoundingMode = HalfEven): Decimal`](divwithprecision.md) | 除法运算，支持自定义运算精度和舍入方式，除以入参 Decimal 对象，返回结果值，如果结果精度超过 `precision` 指定精度，则根据指定的精度对除法运算结果进行舍入。 |
| [`hashCode(): Int64`](hashcode.md) | 获取当前对象哈希值。 |
| [`isInteger(): Bool`](isinteger.md) | 判断当前 Decimal 对象是否为整数。 |
| [`powWithPrecision(n: Int64, precision: Int64, roundingMode!: RoundingMode = RoundingMode.HalfEven): Decimal`](powwithprecision.md) | 乘方运算，支持自定义运算精度和舍入方式，获取当前对象为底数，入参 Int64 为指数的乘方运算结果，如果运算结果超过 `precision` 指定的精度，则根据指定的精度对乘方结果进行舍入。 |
| [`removeTrailingZeros(): Decimal`](removetrailingzeros.md) | 对当前 Decimal 对象移除尾部零，不改变对象数值。 |
| [`reScale(newScale: Int32, roundingMode!: RoundingMode = HalfEven): Decimal`](rescale.md) | 调整 Decimal 对象标度值，允许指定舍入规则，返回标度调整后新的 Decimal 对象。 |
| [`roundWithPrecision(precision: Int64, roundingMode!: RoundingMode = RoundingMode.HalfEven): Decimal`](roundwithprecision.md) | 按照指定舍入精度和舍入规则对当前 Decimal 对象进行舍入操作。 |
| [`scaleUnit(): Decimal`](scaleunit.md) | 对当前 Decimal 对象返回标度单位，即数值为 1 ，标度值与当前对象相等的 Decimal 对象。 |
| [`shiftPoint(n: Int32): Decimal`](shiftpoint.md) | 移动当前 Decimal 对象小数点 `abs(n)` 位返回结果对象，当 n 为正数时，左移小数点，n 为负数时，右移小数点，n 为零时，返回当前对象。 |
| [`sqrtWithPrecision(precision: Int64, roundingMode!: RoundingMode = RoundingMode.HalfEven): Decimal`](sqrtwithprecision.md) | 开方运算，支持自定义运算精度和结果舍入方式，获取当前对象开方结果，如果运算结果超过 `precision` 指定的精度，则根据指定的精度对开方结果进行舍入。 |
| [`toBigInt(): BigInt`](tobigint.md) | 将当前 Decimal 对象转化为 BigInt 类型。 |
| [`toEngString(): String`](toengstring.md) | 以工程计数法的形式打印输出 Decimal 对象，指数为 3 的倍数，当值小于 0 时以 “-” 开头后跟十进制数字，大于等于 0 时，直接打印输出数字，不额外添加 “+”。 |
| [`toFloat16(): Float16`](tofloat16.md) | 将当前 Decimal 对象转化为 Float16 类型。 |
| [`toFloat32(): Float32`](tofloat32.md) | 将当前 Decimal 对象转化为 Float32 类型。 |
| [`toFloat64(): Float64`](tofloat64.md) | 将当前 Decimal 对象转化为 Float64 类型。 |
| [`toInt16(overflowHandling!: OverflowStrategy = Throwing): Int16`](toint16.md) | 将当前 Decimal 对象转化为 Int16 类型，支持自定义溢出策略。 |
| [`toInt32(overflowHandling!: OverflowStrategy = Throwing): Int32`](toint32.md) | 将当前 Decimal 对象转化为 Int32 类型，支持自定义溢出策略。 |
| [`toInt64(overflowHandling!: OverflowStrategy = Throwing): Int64`](toint64.md) | 将当前 Decimal 对象转化为 Int64 类型，支持自定义溢出策略。 |
| [`toInt8(overflowHandling!: OverflowStrategy = Throwing): Int8`](toint8.md) | 将当前 Decimal 对象转化为 Int8 类型，支持自定义溢出策略。 |
| [`toIntNative(overflowHandling!: OverflowStrategy = Throwing): IntNative`](tointnative.md) | 将当前 Decimal 对象转化为 IntNative 类型，支持自定义溢出策略。 |
| [`toSciString(): String`](toscistring.md) | 以科学计数法的形式打印输出 Decimal 对象，当值小于 0 时以 “-” 开头后跟十进制数字，大于等于 0 时，直接打印输出数字，不额外添加 “+”。 |
| [`toString(): String`](tostring.md) | 以不带指数形式打印输出 Decimal 对象，小于 0 时以 “-” 开头后跟十进制数字，大于等于 0 时，直接打印输出数字，不额外添加 “+”。 |
| [`toUInt16(overflowHandling!: OverflowStrategy = Throwing): UInt16`](touint16.md) | 将当前 Decimal 对象转化为 UInt16 类型，支持自定义溢出策略。 |
| [`toUInt32(overflowHandling!: OverflowStrategy = Throwing): UInt32`](touint32.md) | 将当前 Decimal 对象转化为 UInt32 类型，支持自定义溢出策略。 |
| [`toUInt64(overflowHandling!: OverflowStrategy = Throwing): UInt64`](touint64.md) | 将当前 Decimal 对象转化为 UInt64 类型，支持自定义溢出策略。 |
| [`toUInt8(overflowHandling!: OverflowStrategy = Throwing): UInt8`](touint8.md) | 将当前 Decimal 对象转化为 UInt8 类型，支持自定义溢出策略。 |
| [`toUIntNative(overflowHandling!: OverflowStrategy = Throwing): UIntNative`](touintnative.md) | 将当前 Decimal 对象转化为 UIntNative 类型，支持自定义溢出策略。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(d: Decimal): Bool`](operator-ne.md) | 不等比较运算，不等运算符重载，判断入参 Decimal 对象与当前对象是否不相等，返回比较结果值。 |
| [`operator *(d: Decimal): Decimal`](operator-mul.md) | 乘法运算，乘法运算符重载，乘以入参 Decimal 对象，返回结果值。 |
| [`operator **(n: Int64): Decimal`](operator-pow.md) | 乘方运算，乘方运算符重载，获取当前对象为底数，入参 Int64 为指数的乘方运算结果，其中指数为入参 Decimal 对象的整数部分。 |
| [`operator +(d: Decimal): Decimal`](operator-add.md) | 加法运算，加法运算符重载，加上入参 Decimal 对象，返回结果值。 |
| [`operator -(): Decimal`](operator-sub.md) | 取反运算，一元负数运算符重载，对当前 Decimal 对象取反，返回结果值。 |
| [`operator -(d: Decimal): Decimal`](operator-sub.md) | 减法运算，减法运算符重载，减去入参 Decimal 对象，返回结果值。 |
| [`operator <(d: Decimal): Bool`](operator-lt.md) | 小于比较运算，小于运算符重载，判断入参 Decimal 对象是否小于当前对象，返回比较结果值。 |
| [`operator <=(d: Decimal): Bool`](operator-le.md) | 小于等于比较运算，小于等于运算符重载，判断入参 Decimal 对象是否小于等于当前对象，返回比较结果值。 |
| [`operator ==(d: Decimal): Bool`](operator-eq.md) | 等于比较运算，等于运算符重载，判断入参 Decimal 对象与当前对象是否相等，返回比较结果值。 |
| [`operator >(d: Decimal): Bool`](operator-gt.md) | 大于比较运算，大于运算符重载，判断入参 Decimal 对象是否大于当前对象，返回比较结果值。 |
| [`operator >=(d: Decimal): Bool`](operator-ge.md) | 大于等于比较运算，大于等于运算符重载，判断入参 Decimal 对象是否大于等于当前对象，返回比较结果值。 |
| [`operator /(d: Decimal): Decimal`](operator-div.md) | 除法运算，除法运算符重载，除以入参 Decimal 对象，返回结果值。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Decimal <: Formattable`](extensions/extend-decimal-formattable.md) | 为 Decimal 扩展 Formattable 接口，以实现将 Decimal 实例转换为格式化字符串。 |
| [`extend Decimal <: Number<Decimal>`](extensions/extend-decimal-number-decimal.md) | 为 Decimal 类型扩展 Number<T> 接口。 |
| [`extend Decimal <: Parsable<Decimal>`](extensions/extend-decimal-parsable-decimal.md) | 此扩展主要用于实现将 Decimal 类型字面量的字符串转换为 Decimal 结构体的相关操作函数。 |
