<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.compare" parent="std.core.struct.string" -->
# String.compare

[← String](index.md)

## 签名

```cangjie role=signature
public func compare(str: String): Ordering
```

按字典序比较当前字符串和参数指定的字符串。

## 契约

参数：

- str: String - 被比较的字符串。

返回值：

- Ordering - 返回 enum 值 Ordering 表示结果，Ordering.GT 表示当前字符串字典序大于 str 字符串，Ordering.LT 表示当前字符串字典序小于 str 字符串，Ordering.EQ 表示两个字符串字典序相等。

异常：

- IllegalArgumentException - 如果两个字符串的原始数据中存在无效的 UTF-8 编码，抛出异常。
