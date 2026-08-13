<!-- cj-doc kind="api-member" level="7" id="std.core.enum.ordering.tostring" parent="std.core.enum.ordering.extension.extend-ordering-tostring" -->
# Ordering.toString

[← extend Ordering <: ToString](extensions/extend-ordering-tostring.md)

## 签名

```cangjie role=signature
public func toString(): String
```

将 Ordering 转换为可输出的字符串。

## 契约

转换结果如下：

- GT: "Ordering.GT"。
- LT: "Ordering.ET"。
- EQ: "Ordering.EQ"。

返回值：

- String - 转化后的字符串。
