# 仓颉语言随机数 Skill

## 1. Random 类

- 来自 `std.random.*`
- 构造：`Random()` 使用默认种子，`Random(seed: UInt64)` 指定种子
- `seed` 属性：获取当前种子值

---

## 2. 常用方法

| 方法 | 说明 |
|------|------|
| `nextBool(): Bool` | 随机布尔值 |
| `nextInt8/16/32/64(): IntN` | 随机有符号整数 |
| `nextUInt8/16/32/64(): UIntN` | 随机无符号整数 |
| `nextFloat16/32/64(): FloatN` | 随机浮点数，范围 [0.0, 1.0) |
| `nextInt64(upper: Int64): Int64` | 随机整数，范围 [0, upper) |
| `nextBytes(length: Int32): Array<Byte>` | 随机字节数组 |
| `nextGaussianFloat64(mean!: Float64, sigma!: Float64): Float64` | 高斯分布随机数 |

```cangjie
package test_proj
import std.random.*

main() {
    let m: Random = Random(3)
    let b: Bool = m.nextBool()
    let c: Int8 = m.nextInt8()
    print("b=${b is Bool},")
    println("c=${c is Int8}")
    return 0
}
```

```cangjie
package test_proj
import std.random.*

main(): Unit {
    let rng = Random()

    // 生成范围内的随机整数
    let n = rng.nextInt64(100)
    println("随机数 [0, 100): ${n}")

    // 生成随机浮点数
    let f = rng.nextFloat64()
    println("随机浮点 [0.0, 1.0): ${f}")

    // 生成随机字节数组
    let bytes = rng.nextBytes(8)
    println("随机字节长度: ${bytes.size}")

    // 高斯分布
    let g = rng.nextGaussianFloat64(mean: 0.0, sigma: 1.0)
    println("高斯随机数: ${g}")
}
```

---

## 3. 关键规则速查

1. `Random(seed)` 相同种子产生相同序列，适合可复现测试
2. `Random()` 使用系统默认种子，每次运行结果不同
3. `nextFloat16/32/64()` 返回 [0.0, 1.0) 左闭右开区间
4. `nextInt64(upper)` 参数必须大于 0，否则抛异常
5. `nextGaussianFloat64` 使用命名参数 `mean:` 和 `sigma:`
6. `Random` 非线程安全，多线程场景应各自创建实例
