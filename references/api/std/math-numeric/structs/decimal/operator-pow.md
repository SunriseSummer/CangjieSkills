<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.decimal.operator-pow" parent="std.math.numeric.struct.decimal" -->
# Decimal.**

[← Decimal](index.md)

## 签名

```cangjie role=signature
public operator func **(n: Int64): Decimal
```

乘方运算，乘方运算符重载，获取当前对象为底数，入参 Int64 为指数的乘方运算结果，其中指数为入参 Decimal 对象的整数部分。

## 契约

> **注意：**
>
> 指数为负值且结果为无限小数场景时，默认采用 IEEE 754-2019 decimal128 对结果进行舍入。

参数：

- n: Int64 - 乘方运算的指数值。

返回值：

- Decimal - 生成一个新的 Decimal 对象，用于存储乘方运算结果值。

异常：

- OverflowException - 当乘方运算结果标度值溢出时，抛出此异常。
