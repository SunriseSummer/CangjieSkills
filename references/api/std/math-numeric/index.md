<!-- cj-doc kind="api-package" level="4" id="std.math.numeric" parent="api.std" -->
# std.math.numeric

[← std 包索引](../index.md)

对基础类型可表达范围之外提供扩展能力。

包路径：`std.math.numeric`。在代码中只导入实际使用的类型或函数。

## 结构体

| 声明 | 功能 |
|---|---|
| [`BigInt <: Comparable<BigInt> & Hashable & ToString`](structs/bigint/index.md) | BigInt 定义为任意精度（二进制）的有符号整数。 |
| [`Decimal <: Comparable<Decimal> & Hashable & ToString`](structs/decimal/index.md) | 任意精度有符号十进制数；`value` 是无标度 `BigInt`，`scale` 是小数位数。 |

## 枚举

| 声明 | 功能 |
|---|---|
| [`OverflowStrategy <: Equatable<OverflowStrategy> & ToString`](enums/overflowstrategy/index.md) | 溢出策略枚举类，共包含 3 种溢出策略。 |

## 顶层函数

| 声明 | 功能 |
|---|---|
| [`abs(…) — 2 个重载`](functions/abs.md) | 求一个 BigInt 的绝对值。 |
| [`countOnes(i: BigInt): Int64`](functions/countones-bigint.md) | 计算并返回入参 BigInt 的二进制补码中 1 的个数。 |
| [`gcd(i1: BigInt, i2: BigInt): BigInt`](functions/gcd-bigint-bigint.md) | 求两个 BigInt 的最大公约数。 |
| [`lcm(i1: BigInt, i2: BigInt): BigInt`](functions/lcm-bigint-bigint.md) | 求两个 BigInt 的最小公倍数。 |
| [`round(d: Decimal, roundingMode!: RoundingMode = RoundingMode.HalfEven): Decimal`](functions/round-decimal-roundingmode.md) | 计算 Decimal 的舍入值，根据舍入方式向邻近的整数舍入。 |
| [`sqrt(…) — 2 个重载`](functions/sqrt.md) | 求 BigInt 的算术平方根，向下取整。 |
| [`trailingZeros(x: BigInt): Int64`](functions/trailingzeros-bigint.md) | 求 `BigInt` 的二进制表达中的从最低位算起，连续位为 0 的个数。 |
