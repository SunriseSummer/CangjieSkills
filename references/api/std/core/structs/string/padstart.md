<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.padstart" parent="std.core.struct.string" -->
# String.padStart

[← String](index.md)

## 签名

```cangjie role=signature
public func padStart(totalWidth: Int64, padding!: String = " "): String
```

按指定长度右对齐原字符串，如果原字符串长度小于指定长度，在其左侧添加指定字符串。

## 契约

当指定长度小于字符串长度时，返回字符串本身，不会发生截断；当指定长度大于字符串长度时，在左侧添加 padding 字符串，当 padding 长度大于 1 时，返回字符串的长度可能大于指定长度。

参数：

- totalWidth: Int64 - 指定对齐后字符串长度，取值需大于等于 0。
- padding!: String - 当长度不够时，在左侧用指定的字符串 padding 进行填充

返回值：

- String - 填充后的字符串。

异常：

- IllegalArgumentException - 如果 totalWidth 小于 0，抛出异常。
