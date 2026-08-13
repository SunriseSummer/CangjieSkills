<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.rune.fromutf8" parent="std.core.intrinsic.rune.extension.extend-rune" -->
# Rune.fromUtf8

[← extend Rune](extensions/extend-rune.md)

## 签名

```cangjie role=signature
public static func fromUtf8(arr: Array<UInt8>, index: Int64): (Rune, Int64)
```

将字节数组中的指定元素，根据 UTF-8 编码规则转换成字符，并告知字符占用字节长度。

## 契约

参数：

- arr: Array\<UInt8> - 待转换字节所在的字节数组。
- index: Int64 - 待转换字节在数组中的下标。

返回值：

- (Rune, Int64) - 转换得到的字符，以及该字符占用的字节长度。

异常：

- IllegalArgumentException - 不合法的 UTF-8 字节序列。
