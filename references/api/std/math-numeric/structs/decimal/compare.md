<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.decimal.compare" parent="std.math.numeric.struct.decimal" -->
# Decimal.compare

[← Decimal](index.md)

## 签名

```cangjie role=signature
public func compare(d: Decimal): Ordering
```

比较当前对象与入参 Decimal 对象，返回比较结果值。

## 契约

参数：

- d: Decimal - Decimal 待比较对象。

返回值：

- Ordering - 返回比较结果，当前对象小于入参时，返回 Ordering.LT，大于入参时，返回 Ordering.GT，否则返回 Ordering.EQ。
