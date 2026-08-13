<!-- cj-doc kind="example-leaf" level="4" id="examples.random.seeded-range" parent="examples.random" -->
# 生成可重复的区间随机数

[← 可重复随机数](index.md)

同种子实例产生一致序列；nextInt64(upper) 的结果位于 [0, upper)。

## 典型示例

带种子的 `Random` 可重现伪随机序列；`nextInt64(upper)` 的结果位于 `[0, upper)`。不要依赖某一版本生成的具体数值，只验证同种子序列一致且范围正确。

```cangjie cjtest=run id=examples.random.seeded-range.api.random.next-int64.run form=unit timeout=20s
package random_next_int64_example

import std.random.*

main(): Unit {
    let first = Random(2025)
    let second = Random(2025)
    var reproducible = true
    var inRange = true

    for (_ in 0..100) {
        let left = first.nextInt64(10)
        let right = second.nextInt64(10)
        reproducible = reproducible && left == right
        inRange = inRange && left >= 0 && left < 10
    }

    println(reproducible)
    println(inRange)
}
```

预期标准输出：

```text cjtest=expect for=examples.random.seeded-range.api.random.next-int64.run stream=stdout match=exact
true
true
```
