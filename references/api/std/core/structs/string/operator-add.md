<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.operator-add" parent="std.core.struct.string" -->
# String.+

[← String](index.md)

## 签名

```cangjie role=signature
public operator const func +(right: String): String
```

两个字符串相加，将 right 字符串拼接在原字符串的末尾。

## 契约

参数：

- right: String - 待追加的字符串。

返回值：

- String - 返回拼接后的字符串。

异常：

- IllegalArgumentException - 当试图构造长度超过 UInt32 的最大值 的字符串时，抛出异常。
