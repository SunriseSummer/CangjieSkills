<!-- cj-doc kind="api-member" level="7" id="std.convert.interface.formattable.format.format-207178cba2" parent="std.convert.interface.formattable.format" -->
# Formattable.func format(String)

[← Formattable.format](index.md)

## 签名

```cangjie role=signature
public func format(fmt: String): String
```

根据格式化参数将当前 UInt8 类型实例格式化为对应格式的字符串。

适用扩展：[extend UInt8 <: Formattable](../extensions/extend-uint8-formattable.md)。

## 契约

参数：

- fmt: String - 格式化参数。

返回值：

- String - 将当前 UInt8 类型实例格式化后得到的字符串。

异常：

- IllegalArgumentException - 当 fmt 不合法时抛出异常。
