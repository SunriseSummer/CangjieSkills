<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.lines" parent="std.core.struct.string" -->
# String.lines

[← String](index.md)

## 签名

```cangjie role=signature
public func lines(): Iterator<String>
```

获取字符串的行迭代器，每行都由换行符进行分隔，换行符是 `\n` `\r` `\r\n` 之一，结果中每行不包括换行符。

## 契约

返回值：

- Iterator\<String> - 字符串的行迭代器。
