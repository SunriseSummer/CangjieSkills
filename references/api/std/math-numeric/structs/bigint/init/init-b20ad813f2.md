<!-- cj-doc kind="api-member" level="7" id="std.math.numeric.struct.bigint.init.init-b20ad813f2" parent="std.math.numeric.struct.bigint.init" -->
# BigInt.init(Float32)

[← BigInt.init](index.md)

## 签名

```cangjie role=signature
public init(n: Float32)
```

通过单精度浮点数构建一个 BigInt 结构体。

## 契约

将丢弃浮点数的小数部分，即向零取整。

参数：

- n: Float32 - 单精度浮点数。

异常：

- IllegalArgumentException - 如果 n 为 `Inf` 或 `NaN`，则抛此异常。
