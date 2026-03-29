# 仓颉语言数学运算 Skill

## 1. 常用数学函数

- 来自 `std.math.*`
- 提供数值计算、取整、幂运算、对数等常用数学函数

| 函数 | 说明 |
|------|------|
| `abs(x: T): T` | 绝对值（支持 Float16/32/64, Int8/16/32/64） |
| `sqrt(x: Float64): Float64` | 平方根 |
| `cbrt(x: Float64): Float64` | 立方根 |
| `pow(base: Float64, exponent: Float64): Float64` | 幂运算 |
| `exp(x: Float64): Float64` | e 的 x 次方 |
| `exp2(x: Float64): Float64` | 2 的 x 次方 |
| `log(x: Float64): Float64` | 自然对数 |
| `log2(x: Float64): Float64` | 以 2 为底的对数 |
| `log10(x: Float64): Float64` | 以 10 为底的对数 |
| `clamp(v: T, min: T, max: T): T` | 将值限制在 [min, max] 范围内 |
| `checkedAbs(x: T): ?T` | 安全绝对值，返回 `Option` |

```cangjie
package test_proj
import std.math.*

main(): Unit {
    // 基本数学运算
    println(abs(-3.14))       // 3.14
    println(sqrt(16.0))       // 4.0
    println(cbrt(27.0))       // 3.0
    println(pow(2.0, 10.0))   // 1024.0
    println(log2(1024.0))     // 10.0

    // clamp 限制范围
    let v: Float16 = 0.121
    let c = clamp(v, Float16(-0.123), Float16(0.123))
    println("${c == v}")
}
```

---

## 2. 三角函数

| 函数 | 说明 |
|------|------|
| `sin(x: Float64): Float64` | 正弦（参数为弧度，Float64） |
| `cos(x: Float64): Float64` | 余弦 |
| `tan(x: Float64): Float64` | 正切 |
| `asin(x: Float64): Float64` | 反正弦 |
| `acos(x: Float64): Float64` | 反余弦 |
| `atan(x: Float64): Float64` | 反正切 |
| `atan2(y: Float64, x: Float64): Float64` | 二参数反正切 |

```cangjie
package test_proj
import std.math.*

main(): Unit {
    // 三角函数示例（参数为弧度）
    let angle = 3.141592653589793 / 6.0   // 30 度 = PI/6
    println(sin(angle))                    // 0.5
    println(cos(angle))                    // ~0.866
    println(atan2(1.0, 1.0))              // PI/4 ≈ 0.785
}
```

---

## 3. 取整与截断

| 函数 | 说明 |
|------|------|
| `ceil(x: Float64): Float64` | 向上取整 |
| `floor(x: Float64): Float64` | 向下取整 |
| `round(x: Float64): Float64` | 四舍五入 |
| `trunc(x: Float64): Float64` | 截断小数部分 |

---

## 4. 整数运算（GCD/LCM/位旋转）

| 函数 | 说明 |
|------|------|
| `gcd(x: T, y: T): T` | 最大公约数（整数类型） |
| `lcm(x: T, y: T): T` | 最小公倍数（整数类型） |
| `rotate(num: T, d: Int8): T` | 位旋转 |

```cangjie
package test_proj
import std.math.*

main(): Unit {
    let c2 = gcd(0, -60)
    println("c2=${c2}")

    let c4 = gcd(-33, 27)
    println("c4=${c4}")

    let a: Int8 = lcm(Int8(-3), Int8(5))
    println("a=${a}")
}
```

---

## 5. 浮点数检查

| 常量/方法 | 说明 |
|-----------|------|
| `Float64.NaN` | 非数值常量 |
| `Float64.Inf` | 正无穷常量 |
| `Float64.Max` / `Float64.Min` | 最大/最小值 |
| `x.isNaN()` | 是否为 NaN（实例方法） |
| `x.isInf()` | 是否为无穷（实例方法） |

- **接口**：`FloatingPoint<T>`、`Integer<T>`、`Number<T>` 提供类型约束

```cangjie
package test_proj
import std.math.*

main(): Unit {
    // 浮点数特殊值检查（实例方法）
    println(Float64.NaN.isNaN())     // true
    println(Float64.Inf.isInf())     // true
    println(1.0.isNaN())             // false
}
```

---

## 6. 关键规则速查

1. `abs` 支持多种数值类型（Float16/32/64, Int8/16/32/64）
2. 三角函数参数为弧度制，类型为 Float64
3. `gcd` / `lcm` 仅用于整数类型，支持负数参数
4. `clamp(v, min, max)` 将值限制在闭区间 [min, max]
5. `checkedAbs(x)` 返回 `Option`，用于安全处理溢出
6. 浮点数特殊值检查使用实例方法：`x.isNaN()`、`x.isInf()`
7. `NaN` 与任何值比较均为 false，包括自身
