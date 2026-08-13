<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.bigint.divandmod" parent="std.math.numeric.struct.bigint" -->
# BigInt.divAndMod

[← BigInt](index.md)

## 签名

```cangjie role=signature
public func divAndMod(that: BigInt): (BigInt, BigInt)
```

BigInt 的除法运算。

## 契约

与另一个 BigInt 相除，返回商和模。此除法运算的行为与基础类型保持一致，即商向靠近 0 的方向取整，模的符号与被除数保持一致。

参数：

- that: BigInt - 除数。除数不得为 0。

返回值：

- (BigInt, BigInt) - 商和模。

异常：

- ArithmeticException - 除数为 0 抛此异常。
