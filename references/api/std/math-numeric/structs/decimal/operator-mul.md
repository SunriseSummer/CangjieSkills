<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.decimal.operator-mul" parent="std.math.numeric.struct.decimal" -->
# Decimal.*

[← Decimal](index.md)

## 签名

```cangjie role=signature
public operator func *(d: Decimal): Decimal
```

乘法运算，乘法运算符重载，乘以入参 Decimal 对象，返回结果值。

## 契约

功能：乘法运算，乘法运算符重载，乘以入参 Decimal 对象，返回结果值。保留乘法运算结果实际精度值。

参数：

- d: Decimal - Decimal 乘数对象。

返回值：

- Decimal - 生成一个新的 Decimal 对象，用于存储乘法运算结果值。

异常：

- OverflowException - 当两个乘数标度值相加溢出时，抛出此异常。
