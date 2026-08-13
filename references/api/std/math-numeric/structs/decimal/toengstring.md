<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.decimal.toengstring" parent="std.math.numeric.struct.decimal" -->
# Decimal.toEngString

[← Decimal](index.md)

## 签名

```cangjie role=signature
public func toEngString(): String
```

以工程计数法的形式打印输出 Decimal 对象，指数为 3 的倍数，当值小于 0 时以 “-” 开头后跟十进制数字，大于等于 0 时，直接打印输出数字，不额外添加 “+”。

## 契约

功能：以工程计数法的形式打印输出 Decimal 对象，指数为 3 的倍数，当值小于 0 时以 “-” 开头后跟十进制数字，大于等于 0 时，直接打印输出数字，不额外添加 “+”。指数小于 0 时同样遵循以上规则。

返回值：

- String - 工程计数法形式的 Decimal 字符串。
