<!-- cj-doc kind="api-member" level="5" id="std.math.numeric.func.sqrt" parent="std.math.numeric" -->
# sqrt

[← std.math.numeric](../index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## sqrt(BigInt)

### 签名

```cangjie role=signature
public func sqrt(i: BigInt): BigInt
```

求 BigInt 的算术平方根，向下取整。

### 契约

参数：

- i: BigInt - 需要计算算术平方根的 BigInt，入参需要非负。

返回值：

- BigInt - 返回入参 BigInt 的算术平方根，向下取整。

异常：

- IllegalArgumentException - 如果入参为负数，则抛此异常。

## sqrt(Decimal)

### 签名

```cangjie role=signature
public func sqrt(d: Decimal): Decimal
```

求 Decimal 的算术平方根。

### 契约

功能：求 Decimal 的算术平方根。结果为无限小数场景时，默认采用 IEEE 754-2019 decimal128 对结果进行舍入。

参数：

- d: Decimal - 需要计算算术平方根的 Decimal，入参需要非负。

返回值：

- Decimal - 返回入参 Decimal 的算术平方根。

异常：

- IllegalArgumentException - 如果入参为负数，则抛此异常。
- OverflowException - 当计算平方根操作结果标度值溢出时，抛出此异常。
