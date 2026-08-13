<!-- cj-doc kind="api-member" level="6" id="std.random.class.random.nextint64" parent="std.random.class.random" -->
# Random.nextInt64

[← Random](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func nextInt64()

### 签名

```cangjie role=signature
public func nextInt64(): Int64
```

获取一个 Int64 类型的伪随机数。

### 契约

返回值：

- Int64 - 一个 Int64 类型的伪随机数。

## func nextInt64(Int64)

### 签名

```cangjie role=signature
public func nextInt64(upper: Int64): Int64
```

获取一个范围在 0, `upper`) 的 [Int64 类型的伪随机数。

### 契约

参数：

- upper: Int64 - 生成的伪随机数范围上界（不包括 `upper`），取值范围 (0, Int64.Max]。

返回值：

- Int64 - 一个 Int64 类型的伪随机数。

异常：

- IllegalArgumentException - 如果 `upper` 小于等于 0，抛出异常。

## 典型示例

带种子的 `Random` 可重现伪随机序列；`nextInt64(upper)` 的结果位于 `[0, upper)`。不要依赖某一版本生成的具体数值，只验证同种子序列一致且范围正确。

```cangjie cjtest=run id=api.random.next-int64.run form=unit timeout=20s
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

```text cjtest=expect for=api.random.next-int64.run stream=stdout match=exact
true
true
```
