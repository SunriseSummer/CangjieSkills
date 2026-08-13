<!-- cj-doc kind="api-member" level="7" id="std.math.numeric.struct.bigint.format" parent="std.math.numeric.struct.bigint.extension.extend-bigint-formattable" -->
# BigInt.format

[← extend BigInt <: Formattable](extensions/extend-bigint-formattable.md)

## 签名

```cangjie role=signature
public func format(fmt: String): String
```

根据格式化参数将当前 BigInt 类型实例格式化为对应格式的字符串。

## 契约

参数：

- fmt: String - 格式化参数。

返回值：

- String - 将当前 BigInt 类型实例格式化后得到的字符串。

异常：

- IllegalArgumentException - 当 fmt 不合法时抛出异常。
