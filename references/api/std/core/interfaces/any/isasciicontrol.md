<!-- cj-doc kind="api-member" level="7" id="std.core.interface.any.isasciicontrol" parent="std.core.interface.any.extension.extend-byte" -->
# Any.isAsciiControl

[← extend Byte](extensions/extend-byte.md)

## 签名

```cangjie role=signature
public func isAsciiControl(): Bool
```

判断 Byte 是否是在 Ascii 控制字符范围内。

## 契约

功能：判断 Byte 是否是在 Ascii 控制字符范围内。其取值范围为 [00, 1F] 和 {7F} 的并集。

返回值：

- Bool - 如果 Byte 在 Ascii 控制字符范围内返回 true，否则返回 false。
