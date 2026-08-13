<!-- cj-doc kind="api-member" level="5" id="std.math.numeric.func.lcm-bigint-bigint" parent="std.math.numeric" -->
# lcm(BigInt, BigInt)

[← std.math.numeric](../index.md)

## 签名

```cangjie role=signature
public func lcm(i1: BigInt, i2: BigInt): BigInt
```

求两个 BigInt 的最小公倍数。

## 契约

功能：求两个 BigInt 的最小公倍数。入参为 0 时返回 0，其余情形总是返回正数（相当于绝对值的最小公倍数）。

参数：

- i1: BigInt - 需要计算最小公倍数的第一个入参。
- i2: BigInt - 需要计算最小公倍数的第二个入参。

返回值：

- BigInt - 返回 `i1` 和 `i2` 的最小公倍数，入参为 0 时返回 0，其余情形总是返回正数（相当于绝对值的最小公倍数）。
