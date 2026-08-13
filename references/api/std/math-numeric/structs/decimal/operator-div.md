<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.decimal.operator-div" parent="std.math.numeric.struct.decimal" -->
# Decimal./

[← Decimal](index.md)

## 签名

```cangjie role=signature
public operator func /(d: Decimal): Decimal
```

除法运算，除法运算符重载，除以入参 Decimal 对象，返回结果值。

## 契约

> **注意：**
>
> 结果为无限小数场景时，默认采用 IEEE 754-2019 decimal128 对结果进行舍入。

参数：

- d: Decimal - Decimal 除数对象。

返回值：

- Decimal - 生成一个新的 Decimal 对象，用于存储除法运算结果值。

异常：

- IllegalArgumentException - 当除数为 0 时，抛出此异常。
- OverflowException - 当除法结果值范围超过 -(maxValue(precision) * (10 <sup>[Int32.MAX</sup>)), maxValue(precision) * (10 <sup>Int32.MAX</sup>)] 时，抛出此异常。
