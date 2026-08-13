<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.decimal.operator-gt" parent="std.math.numeric.struct.decimal" -->
# Decimal.>

[← Decimal](index.md)

## 签名

```cangjie role=signature
public operator func >(d: Decimal): Bool
```

大于比较运算，大于运算符重载，判断入参 Decimal 对象是否大于当前对象，返回比较结果值。

## 契约

参数：

- d: Decimal - Decimal 待比较对象

返回值：

- Bool - 返回大于比较运算结果。当前对象大于入参时，返回 true，否则返回 false
