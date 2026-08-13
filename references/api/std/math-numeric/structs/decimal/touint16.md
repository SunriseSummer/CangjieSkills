<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.decimal.touint16" parent="std.math.numeric.struct.decimal" -->
# Decimal.toUInt16

[← Decimal](index.md)

## 签名

```cangjie role=signature
public func toUInt16(overflowHandling!: OverflowStrategy = Throwing): UInt16
```

将当前 Decimal 对象转化为 UInt16 类型，支持自定义溢出策略。

## 契约

参数：

- overflowHandling!: OverflowStrategy - 转换溢出策略。

返回值：

- UInt16 - 转换后的 UInt16 值。

异常：

- OverflowException - 当不指定溢出策略或溢出策略为 `throwing` 转换溢出时，抛出此异常。
