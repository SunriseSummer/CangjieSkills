<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.decimal.shiftpoint" parent="std.math.numeric.struct.decimal" -->
# Decimal.shiftPoint

[← Decimal](index.md)

## 签名

```cangjie role=signature
public func shiftPoint(n: Int32): Decimal
```

移动当前 Decimal 对象小数点 `abs(n)` 位返回结果对象，当 n 为正数时，左移小数点，n 为负数时，右移小数点，n 为零时，返回当前对象。

## 契约

参数：

- n: Int32 - 指定小数点移动位数及方向。

返回值：

- Decimal - 对当前对象小数点移动指定位数后生成新的 Decimal 对象。
