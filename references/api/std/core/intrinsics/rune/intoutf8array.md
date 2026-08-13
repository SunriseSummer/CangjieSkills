<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.rune.intoutf8array" parent="std.core.intrinsic.rune.extension.extend-rune" -->
# Rune.intoUtf8Array

[← extend Rune](extensions/extend-rune.md)

## 签名

```cangjie role=signature
public static func intoUtf8Array(c: Rune, arr: Array<UInt8>, index: Int64): Int64
```

该函数会把字符转成字节码序列然后覆盖 Array 数组内指定位置的字节码。

## 契约

参数：

- c: Rune - 待转换的字符。
- arr: Array\<UInt8> - 待覆盖的 Array 数组。
- index: Int64 - 目标位置的起始索引。

返回值：

- Int64 - 字符的字节码长度，例如中文是三个字节码长度。
