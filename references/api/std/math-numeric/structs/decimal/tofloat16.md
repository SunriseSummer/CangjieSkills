<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.decimal.tofloat16" parent="std.math.numeric.struct.decimal" -->
# Decimal.toFloat16

[← Decimal](index.md)

## 签名

```cangjie role=signature
public func toFloat16(): Float16
```

将当前 Decimal 对象转化为 Float16 类型。

## 契约

返回值：

- Float16 - 转换后的 Float16 值，溢出时，当前值为正数，返回 `inf`，当前值为负数，返回 `-inf`。
