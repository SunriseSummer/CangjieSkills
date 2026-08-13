<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.decimal.divwithprecision" parent="std.math.numeric.struct.decimal" -->
# Decimal.divWithPrecision

[← Decimal](index.md)

## 签名

```cangjie role=signature
public func divWithPrecision(d: Decimal, precision: Int64, roundingMode!: RoundingMode = HalfEven): Decimal
```

除法运算，支持自定义运算精度和舍入方式，除以入参 Decimal 对象，返回结果值，如果结果精度超过 `precision` 指定精度，则根据指定的精度对除法运算结果进行舍入。

## 契约

参数：

- d: Decimal - Decimal 除数对象。
- precision: Int64 - 精度值。
- roundingMode!: RoundingMode - 舍入规则。

返回值：

- Decimal - 生成一个新的 Decimal 对象，用于存储除法运算结果值。

异常：

- ArithmeticException - 当除数为 0 时，抛出此异常。
- OverflowException - 当除法结果值范围超过 -(maxValue(precision) * (10 <sup>[Int32.MAX</sup>)), maxValue(precision) * (10 <sup>Int32.MAX</sup>)] 时，抛出此异常。
