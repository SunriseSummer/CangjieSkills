<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.decimal.powwithprecision" parent="std.math.numeric.struct.decimal" -->
# Decimal.powWithPrecision

[← Decimal](index.md)

## 签名

```cangjie role=signature
public func powWithPrecision(n: Int64, precision: Int64, roundingMode!: RoundingMode = RoundingMode.HalfEven): Decimal
```

乘方运算，支持自定义运算精度和舍入方式，获取当前对象为底数，入参 Int64 为指数的乘方运算结果，如果运算结果超过 `precision` 指定的精度，则根据指定的精度对乘方结果进行舍入。

## 契约

参数：

- n: Int64 - 乘方运算的指数值。
- precision: Int64 - 精度值。
- roundingMode!: RoundingMode - 舍入规则。

返回值：

- Decimal - 生成一个新的 Decimal 对象，用于存储乘方运算结果值。

异常：

- OverflowException - 当乘方运算结果标度值溢出时，抛出此异常。
