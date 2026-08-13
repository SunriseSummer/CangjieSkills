<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.operator-mul" parent="std.core.struct.string" -->
# String.*

[← String](index.md)

## 签名

```cangjie role=signature
public operator const func *(count: Int64): String
```

原字符串重复 count 次。

## 契约

参数：

- count: Int64 - 原字符串重复的次数。

返回值：

- String - 返回重复 count 次后的新字符串。

异常：

- IllegalArgumentException - 当试图构造长度超过 UInt32 的最大值 的字符串时，抛出异常。
