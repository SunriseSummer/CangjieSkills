<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.decimal.roundwithprecision" parent="std.math.numeric.struct.decimal" -->
# Decimal.roundWithPrecision

[← Decimal](index.md)

## 签名

```cangjie role=signature
public func roundWithPrecision(precision: Int64, roundingMode!: RoundingMode = RoundingMode.HalfEven): Decimal
```

按照指定舍入精度和舍入规则对当前 Decimal 对象进行舍入操作。

## 契约

参数：

- precision: Int64 - 精度值。
- roundingMode!: RoundingMode - 舍入规则。

返回值：

- Decimal - 舍入操作生成的新的 Decimal 对象。

异常：

- OverflowException - 当舍入操作结果标度值溢出时，抛出此异常。
