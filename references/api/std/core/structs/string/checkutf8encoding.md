<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.checkutf8encoding" parent="std.core.struct.string" -->
# String.checkUtf8Encoding

[← String](index.md)

## 签名

```cangjie role=signature
public static func checkUtf8Encoding(data: Array<UInt8>): Bool
```

检查一个 Byte 数组是否符合 UTF-8 编码。

## 契约

参数：

- data: Array\<UInt8> - 根据该字节数组构造字符串。

返回值：

- Bool - 如果 Byte 数组符合 UTF-8 编码，返回 true，否则返回 false。
