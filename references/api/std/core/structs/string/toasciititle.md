<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.toasciititle" parent="std.core.struct.string" -->
# String.toAsciiTitle

[← String](index.md)

## 签名

```cangjie role=signature
public func toAsciiTitle(): String
```

将该字符串标题化。

## 契约

该函数只转换 Ascii 英文字符，当该英文字符是字符串中第一个字符或者该字符的前一个字符不是英文字符，则该字符大写，其他英文字符小写。

返回值：

- String - 转换后的新字符串。
