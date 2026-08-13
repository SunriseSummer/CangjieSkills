<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.decimal.operator-add" parent="std.math.numeric.struct.decimal" -->
# Decimal.+

[← Decimal](index.md)

## 签名

```cangjie role=signature
public operator func +(d: Decimal): Decimal
```

加法运算，加法运算符重载，加上入参 Decimal 对象，返回结果值。

## 契约

功能：加法运算，加法运算符重载，加上入参 Decimal 对象，返回结果值。结果保留实际精度值。

参数：

- d: Decimal - Decimal 加数对象。

返回值：

- Decimal - 生成一个新的 Decimal 对象，用于存储加法结果值。

异常：

- OverflowException - 当两个加数标度值相减溢出时，抛出此异常。
