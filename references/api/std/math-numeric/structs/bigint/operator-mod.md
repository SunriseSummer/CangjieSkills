<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.bigint.operator-mod" parent="std.math.numeric.struct.bigint" -->
# BigInt.%

[← BigInt](index.md)

## 签名

```cangjie role=signature
public operator func %(that: BigInt): BigInt
```

BigInt 的模运算。

## 契约

取模运算的行为与基础类型保持一致，即符号与被除数保持一致。

参数：

- that: BigInt - 除数。除数不得为 0。

返回值：

- BigInt - 一个新 BigInt，它是此 BigInt 与另外一个 BigInt 相模后的结果。

异常：

- ArithmeticException - 除数为 0 抛此异常。
