<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.rune.getpreviousfromutf8" parent="std.core.intrinsic.rune.extension.extend-rune" -->
# Rune.getPreviousFromUtf8

[← extend Rune](extensions/extend-rune.md)

## 签名

```cangjie role=signature
public static func getPreviousFromUtf8(arr: Array<UInt8>, index: Int64): (Rune, Int64)
```

获取字节数组中指定索引对应的字节所在的 UTF-8 编码字符，同时返回该字符首位字节码在数组中的索引。

## 契约

当指定了一个索引，那么函数会找到数组对应索引位置并且根据 UTF-8 规则，查看该字节码是否是字符的首位字节码，如果不是就继续向前遍历，直到该字节码是首位字节码，然后利用字节码序列找到对应的字符。

参数：

- arr: Array\<UInt8> - 待从中获取字符的字节数组。
- index: Int64 - 待查找字符在数组中的索引。

返回值：

- (Rune, Int64) - 找到的字符，以及该字符首位字节码在数组中的索引。

异常：

- IllegalArgumentException - 如果找不到对应首位字节码，即指定字节所在位置的字节不符合 UTF-8 编码，抛出异常。
