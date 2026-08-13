<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.trimascii" parent="std.core.struct.string" -->
# String.trimAscii

[← String](index.md)

## 签名

```cangjie role=signature
public func trimAscii(): String
```

去除原字符串开头结尾以 ASCII 空白字符组成的子字符串。

## 契约

ASCII 空白字符包括 ASCII 码在区间 [0x09, 0x0D] 范围内的字符以及 ASCII 码为 0x20 的字符。具体字符见下表。

| 字符含义 | ASCII 码 |
| --- | --- |
| 水平制表符 (\t, HT) | 0x09 |
| 换行符 (\n, LF) | 0x0A |
| 垂直制表符 (\v, VT) | 0x0B |
| 换页符 (\f, FF) | 0x0C |
| 回车符 (\r, CR) | 0x0D |
| 空格 (Space) | 0x20 |

返回值：

- String - 转换后的新字符串。
