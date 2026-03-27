# 仓颉语言扩展数值类型 Skill

## 1. BigInt — 任意精度整数

- 来自 `std.math.numeric.*`
- 支持任意大小的整数运算，无溢出风险
- 实现 `Comparable & Hashable & ToString`
- 适用于密码学、大数计算等场景

| 方法 / 属性 | 说明 |
|-------------|------|
| `BigInt(intValue)` | 从整数构造 |
| `BigInt.parse(string)` | 从十进制字符串解析 |
| `BigInt.parse(string, radix)` | 从指定进制字符串解析 |
| `+, -, *, /` | 四则运算 |
| `divAndMod(other)` | 返回 `(商, 余数)` 元组 |
| `modPow(exp, mod)` | 模幂运算 |
| `bitLen` | 二进制位数 |
| `sign` | 符号：-1、0 或 1 |
| `toString()` | 转为十进制字符串 |
| `toString(radix)` | 转为指定进制字符串 |

```cangjie
package test_proj
import std.math.numeric.*

main(): Int64 {
    let int1: BigInt = BigInt.parse("123456789")
    let int2: BigInt = BigInt.parse("987654321")
    println("${int1} + ${int2} = ${int1 + int2}")
    println("${int1} - ${int2} = ${int1 - int2}")
    println("${int1} * ${int2} = ${int1 * int2}")
    println("${int1} / ${int2} = ${int1 / int2}")
    // divAndMod 返回商和余数
    let (quo, mod) = int1.divAndMod(int2)
    println("${int1} / ${int2} = ${quo} .. ${mod}")
    return 0
}
```

---

## 2. Decimal — 任意精度十进制数

- 精确表示十进制小数，避免浮点精度问题
- 实现 `Comparable & Hashable & ToString`
- 适用于金融计算、精确数值等场景

| 方法 / 属性 | 说明 |
|-------------|------|
| `Decimal(string)` | 从字符串构造 |
| `Decimal(intValue)` | 从整数构造 |
| `+, -, *, /` | 四则运算 |
| `precision` | 有效数字位数 |
| `scale` | 小数位数 |
| `isZero` | 是否为零 |
| `isPositive` | 是否为正 |
| `isNegative` | 是否为负 |

```cangjie
package test_proj
import std.math.numeric.*

main(): Int64 {
    let d1 = Decimal("3.14")
    let d2 = Decimal("2.86")
    println("${d1} + ${d2} = ${d1 + d2}")
    println("${d1} * ${d2} = ${d1 * d2}")
    // 精度与标度
    println("precision: ${d1.precision}")
    println("scale: ${d1.scale}")
    return 0
}
```

---

## 3. 数学运算函数

- 以下函数支持 `BigInt` 和 `Decimal` 类型

| 函数 | 说明 | 支持类型 |
|------|------|---------|
| `abs(value)` | 绝对值 | BigInt / Decimal |
| `gcd(a, b)` | 最大公约数 | BigInt |
| `lcm(a, b)` | 最小公倍数 | BigInt |
| `sqrt(value)` | 平方根 | BigInt / Decimal |

```cangjie
package test_proj
import std.math.numeric.*

main(): Int64 {
    let a = BigInt.parse("-42")
    println("abs: ${abs(a)}")         // 42
    let x = BigInt.parse("12")
    let y = BigInt.parse("18")
    println("gcd: ${gcd(x, y)}")      // 6
    println("lcm: ${lcm(x, y)}")      // 36
    return 0
}
```

---

## 4. 关键规则速查

1. `BigInt.parse(string)` 默认按十进制解析，可指定 `radix` 参数
2. `Decimal` 使用字符串构造以保证精度，避免 `Decimal(floatValue)`
3. `divAndMod` 同时返回商和余数，比分别计算更高效
4. `modPow(exp, mod)` 用于密码学等大数模幂场景
5. `BigInt` / `Decimal` 均实现 `Comparable`，可直接用于排序和比较
6. `scale` 表示小数位数，`precision` 表示有效数字总位数
