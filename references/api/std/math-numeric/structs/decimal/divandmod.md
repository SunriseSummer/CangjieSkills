<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.decimal.divandmod" parent="std.math.numeric.struct.decimal" -->
# Decimal.divAndMod

[← Decimal](index.md)

## 签名

```cangjie role=signature
public func divAndMod(d: Decimal): (BigInt, Decimal)
```

除法取商和余数运算，除以入参 Decimal 对象，返回整数商值和余数值。

## 契约

功能：除法取商和余数运算，除以入参 Decimal 对象，返回整数商值和余数值。结果保留实际精度值。

参数：

- d: Decimal - Decimal 除数对象。

返回值：

- (BigInt, Decimal) - 生成一个元组对象，分别用于存储整数商值结果和余数结果值。

异常：

- ArithmeticException - 当除数为 0 时，抛出此异常。
- OverflowException - 当除法结果值范围超过 -(maxValue(precision) * (10 <sup>[Int32.MAX</sup>)), maxValue(precision) * (10 <sup>Int32.MAX</sup>)] 时，抛出此异常。
