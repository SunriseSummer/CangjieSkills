<!-- cj-doc kind="api-member" level="7" id="std.math.numeric.struct.bigint.init.init-2bdac5ff6c" parent="std.math.numeric.struct.bigint.init" -->
# BigInt.init(Float16)

[← BigInt.init](index.md)

## 签名

```cangjie role=signature
public init(n: Float16)
```

通过半精度浮点数构建一个 BigInt 结构体。

## 契约

将丢弃浮点数的小数部分，即向零取整。

参数：

- n: Float16 - 半精度浮点数。

异常：

- IllegalArgumentException - 如果 n 为 `Inf` 或 `NaN`，则抛此异常。
