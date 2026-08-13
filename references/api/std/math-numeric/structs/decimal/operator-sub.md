<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.decimal.operator-sub" parent="std.math.numeric.struct.decimal" -->
# Decimal.-

[← Decimal](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## operator func -()

### 签名

```cangjie role=signature
public operator func -(): Decimal
```

取反运算，一元负数运算符重载，对当前 Decimal 对象取反，返回结果值。

### 契约

功能：取反运算，一元负数运算符重载，对当前 Decimal 对象取反，返回结果值。保留取反运算结果实际精度值。

返回值：

- Decimal - 生成一个新的 Decimal 对象，用于存储取反结果值。

## operator func -(Decimal)

### 签名

```cangjie role=signature
public operator func -(d: Decimal): Decimal
```

减法运算，减法运算符重载，减去入参 Decimal 对象，返回结果值。

### 契约

功能：减法运算，减法运算符重载，减去入参 Decimal 对象，返回结果值。保留减法运算结果实际精度值。

参数：

- d: Decimal - Decimal 减数对象。

返回值：

- Decimal - 生成一个新的 Decimal 对象，用于存储减法运算结果值。

异常：

- OverflowException - 当被减数与减数标度值相减溢出时，抛出此异常。
