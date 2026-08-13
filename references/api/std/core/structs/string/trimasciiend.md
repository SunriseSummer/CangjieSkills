<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.trimasciiend" parent="std.core.struct.string" -->
# String.trimAsciiEnd

[← String](index.md)

## 签名

```cangjie role=signature
public func trimAsciiEnd(): String
```

去除原字符串结尾以 ASCII 空白字符组成的子字符串。

## 契约

ASCII 空白字符包括 ASCII 码在区间 [0x09, 0x0D] 范围内的字符以及 ASCII 码为 0x20 的字符。具体字符见 trimAscii()。

返回值：

- String - 转换后的新字符串。
