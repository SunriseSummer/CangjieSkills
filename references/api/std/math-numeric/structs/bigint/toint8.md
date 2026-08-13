<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.bigint.toint8" parent="std.math.numeric.struct.bigint" -->
# BigInt.toInt8

[← BigInt](index.md)

## 签名

```cangjie role=signature
public func toInt8(overflowHandling!: OverflowStrategy = Throwing): Int8
```

将当前 BigInt 对象转化为 Int8 类型，支持自定义溢出策略。

## 契约

参数：

- overflowHandling!: OverflowStrategy - 转换溢出策略。

返回值：

- Int8 - 返回转换后的 Int8 值。

异常：

- OverflowException - 当不指定溢出策略或溢出策略为 `throwing` 转换溢出时，抛出此异常。
