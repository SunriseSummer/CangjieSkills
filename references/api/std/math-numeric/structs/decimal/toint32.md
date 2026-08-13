<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.decimal.toint32" parent="std.math.numeric.struct.decimal" -->
# Decimal.toInt32

[← Decimal](index.md)

## 签名

```cangjie role=signature
public func toInt32(overflowHandling!: OverflowStrategy = Throwing): Int32
```

将当前 Decimal 对象转化为 Int32 类型，支持自定义溢出策略。

## 契约

参数：

- overflowHandling!: OverflowStrategy - 转换溢出策略。

返回值：

- Int32 - 转换后的 Int32 值。

异常：

- OverflowException - 当不指定溢出策略或溢出策略为 `throwing` 转换溢出时，抛出此异常。
