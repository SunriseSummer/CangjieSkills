<!-- cj-doc kind="api-package" level="4" id="std.math" parent="api.std" -->
# std.math

[← std 包索引](../index.md)

提供数学常量与数值函数；自然对数使用 `log`（没有 `ln`）；常用 Float64 签名包括 `sqrt(x: Float64)`、`log(x: Float64)`、`sin(x: Float64)`、`cos(x: Float64)`，返回值均为 Float64。

包路径：`std.math`。在代码中只导入实际使用的类型或函数。

## 接口

| 声明 | 功能 |
|---|---|
| [`FloatingPoint<T> <: Number<T>`](interfaces/floatingpoint/index.md) | 本接口提供了浮点数相关的方法。 |
| [`Integer<T> <: Number<T>`](interfaces/integer/index.md) | 本接口提供了整数类型相关的方法。 |
| [`MaxMinValue<T>`](interfaces/maxminvalue/index.md) | 提供获取最大值和最小值的方法。 |
| [`Number<T>`](interfaces/number/index.md) | 提供数值类型相关的方法。 |

## 枚举

| 声明 | 功能 |
|---|---|
| [`RoundingMode <: Equatable<RoundingMode> & ToString`](enums/roundingmode/index.md) | 舍入规则枚举类，共包含 6 种舍入规则。 |

## 顶层函数

| 声明 | 功能 |
|---|---|
| [`abs(…) — 7 个重载`](functions/abs.md) | 求一个数值的绝对值。 |
| [`acos(…) — 3 个重载`](functions/acos.md) | 计算数值的反余弦函数值。 |
| [`acosh(…) — 3 个重载`](functions/acosh.md) | 计算数值的反双曲余弦函数值。 |
| [`asin(…) — 3 个重载`](functions/asin.md) | 计算数值的反正弦函数值。 |
| [`asinh(…) — 3 个重载`](functions/asinh.md) | 计算数值的反双曲正弦函数值。 |
| [`atan(…) — 3 个重载`](functions/atan.md) | 计算数值的反正切函数值。 |
| [`atan2(…) — 3 个重载`](functions/atan2.md) | 计算两个数值 y/x 的反正切函数值，单位为弧度。 |
| [`atanh(…) — 3 个重载`](functions/atanh.md) | 计算数值的反双曲正切函数值。 |
| [`cbrt(…) — 3 个重载`](functions/cbrt.md) | 求数值的立方根。 |
| [`ceil(…) — 3 个重载`](functions/ceil.md) | 求数值的向上取整值。 |
| [`checkedAbs(…) — 4 个重载`](functions/checkedabs.md) | 求一个整数的绝对值。 |
| [`clamp(…) — 3 个重载`](functions/clamp.md) | 把浮点数限制在给定的最小值与最大值之间。 |
| [`cos(…) — 3 个重载`](functions/cos.md) | 计算数值的余弦函数值。 |
| [`cosh(…) — 3 个重载`](functions/cosh.md) | 计算数值的双曲余弦函数值。 |
| [`countOnes(…) — 8 个重载`](functions/countones.md) | 求整数的二进制表达中 1 的个数。 |
| [`erf(…) — 3 个重载`](functions/erf.md) | 求数值的误差值。 |
| [`exp(…) — 3 个重载`](functions/exp.md) | 求自然常数 e 的 `x` 次幂。 |
| [`exp2(…) — 3 个重载`](functions/exp2.md) | 求 2 的 `x` 次幂。 |
| [`floor(…) — 3 个重载`](functions/floor.md) | 求浮点数的向下取整值。 |
| [`fmod(…) — 3 个重载`](functions/fmod.md) | 求两个数值 x/y 的余数。 |
| [`gamma(…) — 3 个重载`](functions/gamma.md) | 计算浮点数的伽马函数值，即阶乘向实数域的推广。 |
| [`gcd(…) — 8 个重载`](functions/gcd/index.md) | 求两个整数的最大公约数。 |
| [`lcm(…) — 8 个重载`](functions/lcm/index.md) | 求两个整数的最小的非负的公倍数，当入参有 0 时才返回 0。 |
| [`leadingZeros(…) — 8 个重载`](functions/leadingzeros.md) | 求整数的二进制表达中的从最高位算起，连续位为 0 的个数。 |
| [`log(…) — 3 个重载`](functions/log.md) | 求以 e 为底 `x` 的对数。 |
| [`log10(…) — 3 个重载`](functions/log10.md) | 求以 10 为底 `x` 的对数。 |
| [`log2(…) — 3 个重载`](functions/log2.md) | 求以 2 为底 `x` 的对数。 |
| [`logBase(…) — 3 个重载`](functions/logbase.md) | 求以 `base` 为底 `x` 的对数。 |
| [`pow(…) — 4 个重载`](functions/pow.md) | 求浮点数 `base` 的 `exponent` 次幂。 |
| [`reverse(…) — 4 个重载`](functions/reverse.md) | 求无符号整数按位反转后的数。 |
| [`rotate(…) — 8 个重载`](functions/rotate.md) | 求整数的按位旋转后的结果。 |
| [`round(…) — 3 个重载`](functions/round.md) | 此函数采用 IEEE-754 的向最近舍入规则，计算浮点数的舍入值。 |
| [`sin(…) — 3 个重载`](functions/sin.md) | 计算数值的正弦函数值。 |
| [`sinh(…) — 3 个重载`](functions/sinh.md) | 计算数值的双曲正弦函数值。 |
| [`sqrt(…) — 3 个重载`](functions/sqrt.md) | 求浮点数的算术平方根。 |
| [`tan(…) — 3 个重载`](functions/tan.md) | 计算数值的正切函数值。 |
| [`tanh(…) — 3 个重载`](functions/tanh.md) | 计算数值的双曲正切函数值。 |
| [`trailingZeros(…) — 8 个重载`](functions/trailingzeros.md) | 求整数的二进制表达中的从最低位算起，连续位为 0 的个数。 |
| [`trunc(…) — 3 个重载`](functions/trunc.md) | 求浮点数的截断取整值。 |
