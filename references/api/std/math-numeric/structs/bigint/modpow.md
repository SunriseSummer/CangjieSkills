<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.bigint.modpow" parent="std.math.numeric.struct.bigint" -->
# BigInt.modPow

[← BigInt](index.md)

## 签名

```cangjie role=signature
public func modPow(n: BigInt, m!: ?BigInt = None): BigInt
```

计算此 BigInt 的 n 次幂模 `m` 的结果，并返回。

## 契约

模的规则与基础类型一致，即模的符号与被除数保持一致。

参数：

- n: BigInt - 指数，必须为非负数。
- m!: ?BigInt - 除数，此入参不得为 0。

返回值：

- BigInt - 乘方后取模的运算结果。

异常：

- ArithmeticException - 除数为 0 抛此异常。
- IllegalArgumentException - 指数为负数时抛此异常。
