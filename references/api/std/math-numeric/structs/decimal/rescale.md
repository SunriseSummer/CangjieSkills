<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.decimal.rescale" parent="std.math.numeric.struct.decimal" -->
# Decimal.reScale

[← Decimal](index.md)

## 签名

```cangjie role=signature
public func reScale(newScale: Int32, roundingMode!: RoundingMode = HalfEven): Decimal
```

调整 Decimal 对象标度值，允许指定舍入规则，返回标度调整后新的 Decimal 对象。

## 契约

参数：

- newScale: Int32 - 新的标度值。
- roundingMode!: RoundingMode - 舍入规则。

返回值：

- Decimal - 新的标度值的 Decimal 对象。
