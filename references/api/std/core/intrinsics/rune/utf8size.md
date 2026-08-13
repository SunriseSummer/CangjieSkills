<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.rune.utf8size" parent="std.core.intrinsic.rune.extension.extend-rune" -->
# Rune.utf8Size

[← extend Rune](extensions/extend-rune.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func utf8Size(Array<UInt8>, Int64)

### 签名

```cangjie role=signature
public static func utf8Size(arr: Array<UInt8>, index: Int64): Int64
```

该函数会返回字节数组指定索引位置为起始的字符占用的字节数。

### 契约

在 UTF-8 编码中，ASCII 码首位字节第一位不为 1，其他长度的字符首位字节开头 1 的个数表明了该字符对应的字节码长度，该函数通过扫描首位，判断字节码长度。如果索引对应的不是首位字节码，就会抛出异常。

参数：

- arr: Array\<UInt8> - 待获取字符的字节数组。
- index: Int64 - 指定字符的索引。

返回值：

- Int64 - 字符的字节码长度，例如中文是三个字节码长度。

异常：

- IllegalArgumentException - 如果索引位置的字节码不符合首位字节码规则，会抛出异常。

## static func utf8Size(Rune)

### 签名

```cangjie role=signature
public static func utf8Size(c: Rune): Int64
```

返回字符对应的 UTF-8 编码的字节码长度，例如中文字符的字节码长度是 3。

### 契约

参数：

- c: Rune - 待计算 UTF-8 字节码长度的字符。

返回值：

- Int64 - 字符的 UTF-8 字节码长度。
