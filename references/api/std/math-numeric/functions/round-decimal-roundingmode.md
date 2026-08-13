<!-- cj-doc kind="api-member" level="5" id="std.math.numeric.func.round-decimal-roundingmode" parent="std.math.numeric" -->
# round(Decimal, RoundingMode)

[← std.math.numeric](../index.md)

## 签名

```cangjie role=signature
public func round(d: Decimal, roundingMode!: RoundingMode = RoundingMode.HalfEven): Decimal
```

计算 Decimal 的舍入值，根据舍入方式向邻近的整数舍入。

## 契约

参数：

- d: Decimal - 需要计算舍入值的 Decimal。
- roundingMode!: RoundingMode - 舍入规则。

返回值：

- Decimal - 舍入操作生成的新的 Decimal 对象。

异常：

- OverflowException - 当舍入操作结果标度值溢出时，抛出此异常。
