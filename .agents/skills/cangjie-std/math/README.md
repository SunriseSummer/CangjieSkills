# 仓颉语言数学运算 Skill

## 1. 常用数学函数

- 来自 `std.math.*`
- 提供数值计算、取整、幂运算、对数等常用数学函数

| 函数 | 说明 |
|------|------|
| `abs(x)` | 绝对值（支持 Float16/32/64, Int8/16/32/64） |
| `sqrt(x)` | 平方根 |
| `cbrt(x)` | 立方根 |
| `pow(base, exp)` | 幂运算 |
| `exp(x)` | e 的 x 次方 |
| `exp2(x)` | 2 的 x 次方 |
| `log(x)` | 自然对数 |
| `log2(x)` | 以 2 为底的对数 |
| `log10(x)` | 以 10 为底的对数 |
| `clamp(value, min, max)` | 将值限制在 [min, max] 范围内 |
| `checkedAbs(x)` | 安全绝对值，返回 `Option` |

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
| `sin(x)` | 正弦（参数为弧度，Float64） |
| `cos(x)` | 余弦 |
| `tan(x)` | 正切 |
| `asin(x)` | 反正弦 |
| `acos(x)` | 反余弦 |
| `atan(x)` | 反正切 |
| `atan2(y, x)` | 二参数反正切 |

```cangjie
package test_proj
import std.math.*

main(): Unit {
    // 三角函数示例
    let angle = Float64.PI / 6.0   // 30 度
    println(sin(angle))             // 0.5
    println(cos(angle))             // ~0.866
    println(atan2(1.0, 1.0))       // PI/4
}
```

---

## 3. 取整与截断

| 函数 | 说明 |
|------|------|
| `ceil(x)` | 向上取整 |
| `floor(x)` | 向下取整 |
| `round(x)` | 四舍五入 |
| `trunc(x)` | 截断小数部分 |

---

## 4. 整数运算（GCD/LCM/位旋转）

| 函数 | 说明 |
|------|------|
| `gcd(a, b)` | 最大公约数（整数类型） |
| `lcm(a, b)` | 最小公倍数（整数类型） |
| `rotate(value, bits)` | 位旋转 |

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

| 常量/函数 | 说明 |
|-----------|------|
| `NaN` | 非数值常量 |
| `Inf` / `-Inf` | 正/负无穷 |
| `isNaN(x)` | 是否为 NaN |
| `isInf(x)` | 是否为无穷 |
| `isFinite(x)` | 是否为有限数 |

- **接口**：`FloatingPoint<T>`、`Integer<T>`、`Number<T>` 提供类型约束

```cangjie
package test_proj
import std.math.*

main(): Unit {
    // 浮点数检查
    println(isNaN(Float64.NaN))     // true
    println(isInf(Float64.Inf))     // true
    println(isFinite(1.0))          // true
    println(isFinite(Float64.Inf))  // false
}
```

---

## 6. 关键规则速查

1. `abs` 支持多种数值类型（Float16/32/64, Int8/16/32/64）
2. 三角函数参数为弧度制，类型为 Float64
3. `gcd` / `lcm` 仅用于整数类型，支持负数参数
4. `clamp(value, min, max)` 将值限制在闭区间 [min, max]
5. `checkedAbs(x)` 返回 `Option`，用于安全处理溢出
6. 浮点数比较前应使用 `isNaN` / `isInf` 检查特殊值
7. `NaN` 与任何值比较均为 false，包括自身
