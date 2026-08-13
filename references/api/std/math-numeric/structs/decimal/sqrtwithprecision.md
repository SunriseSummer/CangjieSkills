<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.decimal.sqrtwithprecision" parent="std.math.numeric.struct.decimal" -->
# Decimal.sqrtWithPrecision

[← Decimal](index.md)

## 签名

```cangjie role=signature
public func sqrtWithPrecision(precision: Int64, roundingMode!: RoundingMode = RoundingMode.HalfEven): Decimal
```

开方运算，支持自定义运算精度和结果舍入方式，获取当前对象开方结果，如果运算结果超过 `precision` 指定的精度，则根据指定的精度对开方结果进行舍入。

## 契约

功能：开方运算，支持自定义运算精度和结果舍入方式，获取当前对象开方结果，如果运算结果超过 `precision` 指定的精度，则根据指定的精度对开方结果进行舍入。

参数：

- precision: Int64 - 精度值。
- roundingMode!: RoundingMode - 舍入规则。

返回值：

- Decimal - 返回入参 Decimal 的算术平方根，根据输入精度和舍入方式进行取整。

异常：

- IllegalArgumentException - 如果被计算平方根的对象为负数，则抛此异常。
- OverflowException - 当计算平方根操作结果标度值溢出时，抛出此异常。
