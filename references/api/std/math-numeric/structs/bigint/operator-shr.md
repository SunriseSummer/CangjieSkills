<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.bigint.operator-shr" parent="std.math.numeric.struct.bigint" -->
# BigInt.>>

[← BigInt](index.md)

## 签名

```cangjie role=signature
public operator func >>(n: Int64): BigInt
```

右移运算。

## 契约

参数：

- n: Int64 - 右移 n 位，n 需要大于等于 0。

返回值：

- BigInt - 返回此 BigInt 右移 n 位的结果。

异常：

- ArithmeticException - 入参小于 0 时抛此异常。
