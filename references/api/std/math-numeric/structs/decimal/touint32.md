<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.decimal.touint32" parent="std.math.numeric.struct.decimal" -->
# Decimal.toUInt32

[← Decimal](index.md)

## 签名

```cangjie role=signature
public func toUInt32(overflowHandling!: OverflowStrategy = Throwing): UInt32
```

将当前 Decimal 对象转化为 UInt32 类型，支持自定义溢出策略。

## 契约

参数：

- overflowHandling!: OverflowStrategy - 转换溢出策略。

返回值：

- UInt32 - 转换后的 UInt32 值。

异常：

- OverflowException - 当不指定溢出策略或溢出策略为 `throwing` 转换溢出时，抛出此异常。
