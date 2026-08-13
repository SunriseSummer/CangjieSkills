<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.decimal.tofloat32" parent="std.math.numeric.struct.decimal" -->
# Decimal.toFloat32

[← Decimal](index.md)

## 签名

```cangjie role=signature
public func toFloat32(): Float32
```

将当前 Decimal 对象转化为 Float32 类型。

## 契约

返回值：

- Float32 - 转换后的 Float32 值，溢出时，当前值为正数，返回 `inf`，当前值为负数，返回 `-inf`。
