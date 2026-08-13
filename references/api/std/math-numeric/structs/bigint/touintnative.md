<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.bigint.touintnative" parent="std.math.numeric.struct.bigint" -->
# BigInt.toUIntNative

[← BigInt](index.md)

## 签名

```cangjie role=signature
public func toUIntNative(overflowHandling!: OverflowStrategy = Throwing): UIntNative
```

将当前 BigInt 对象转化为 UIntNative 类型，支持自定义溢出策略。

## 契约

参数：

- overflowHandling!: OverflowStrategy - 转换溢出策略。

返回值：

- UIntNative - 返回转换后的 UInt64 值。

异常：

- OverflowException - 当不指定溢出策略或溢出策略为 `throwing` 转换溢出时，抛出此异常。
