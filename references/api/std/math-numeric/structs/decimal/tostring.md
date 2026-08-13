<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.decimal.tostring" parent="std.math.numeric.struct.decimal" -->
# Decimal.toString

[← Decimal](index.md)

## 签名

```cangjie role=signature
public func toString(): String
```

以不带指数形式打印输出 Decimal 对象，小于 0 时以 “-” 开头后跟十进制数字，大于等于 0 时，直接打印输出数字，不额外添加 “+”。

## 契约

返回值：

- String - 不带指数形式的 Decimal 字符串。
