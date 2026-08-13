<!-- cj-doc kind="api-member" level="5" id="std.math.numeric.func.gcd-bigint-bigint" parent="std.math.numeric" -->
# gcd(BigInt, BigInt)

[← std.math.numeric](../index.md)

## 签名

```cangjie role=signature
public func gcd(i1: BigInt, i2: BigInt): BigInt
```

求两个 BigInt 的最大公约数。

## 契约

功能：求两个 BigInt 的最大公约数。总是返回非负数（相当于绝对值的最大公约数）。

参数：

- i1: BigInt - 需要计算最大公约数的第一个入参。
- i2: BigInt - 需要计算最大公约数的第二个入参。

返回值：

- BigInt - 返回 `i1` 和 `i2` 的最大公约数，总是返回非负数。
