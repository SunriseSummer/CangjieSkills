<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.decimal.prop-sign" parent="std.math.numeric.struct.decimal" -->
# Decimal.sign

[← Decimal](index.md)

## 签名

```cangjie role=signature
public prop sign: Int64
```

获取 Decimal 实例符号值。

## 契约

- Decimal 值大于 0，返回 1；
- Decimal 值等于 0，返回 0；
- Decimal 值小于 0，返回 -1。

类型：Int64
