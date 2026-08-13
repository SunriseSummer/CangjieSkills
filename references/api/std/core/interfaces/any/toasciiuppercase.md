<!-- cj-doc kind="api-member" level="7" id="std.core.interface.any.toasciiuppercase" parent="std.core.interface.any.extension.extend-byte" -->
# Any.toAsciiUpperCase

[← extend Byte](extensions/extend-byte.md)

## 签名

```cangjie role=signature
public func toAsciiUpperCase(): Byte
```

将 Byte 换为对应的 Ascii 大写字符 Byte，如果无法转换则保持现状。

## 契约

返回值：

- Byte - 转换后的 Byte，如果无法转换则返回原来的 Byte。
