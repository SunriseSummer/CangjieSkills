<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.decimal.tointnative" parent="std.math.numeric.struct.decimal" -->
# Decimal.toIntNative

[← Decimal](index.md)

## 签名

```cangjie role=signature
public func toIntNative(overflowHandling!: OverflowStrategy = Throwing): IntNative
```

将当前 Decimal 对象转化为 IntNative 类型，支持自定义溢出策略。

## 契约

参数：

- overflowHandling!: OverflowStrategy - 转换溢出策略。

返回值：

- IntNative - 转换后的 IntNative 值。

异常：

- OverflowException - 当不指定溢出策略或溢出策略为 `throwing` 转换溢出时，抛出此异常。
