<!-- cj-doc kind="api-member" level="7" id="std.math.numeric.struct.decimal.init.init-119f8e8c5b" parent="std.math.numeric.struct.decimal.init" -->
# Decimal.init(Float16)

[← Decimal.init](index.md)

## 签名

```cangjie role=signature
public init(val: Float16)
```

通过 16 位有符号浮点数构建 Decimal 对象。

## 契约

功能：通过 16 位有符号浮点数构建 Decimal 对象。默认采用精度值为 0，即无限精度进行构建。

> **注意：**
>
> 由于部分十进制小数无法通过二进制浮点数精确表示，此构造函数以精确值构建 Decimal 对象，传入浮点数值可能与最终构建 Decimal 对象字符串打印值不一致。

参数：

- val: Float16 - 16 位有符号二进制浮点数。

异常：

- IllegalArgumentException - 当入参为 `inf`、`-inf` 或 `nan` 时，抛出此异常。
