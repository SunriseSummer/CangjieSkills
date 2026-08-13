<!-- cj-doc kind="api-member" level="6" id="std.unicode.interface.unicoderuneextension.tolowercase" parent="std.unicode.interface.unicoderuneextension" -->
# UnicodeRuneExtension.toLowerCase

[← UnicodeRuneExtension](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## func toLowerCase()

### 签名

```cangjie role=signature
func toLowerCase(): Rune
```

获取该类型对应的 `Unicode` 小写字符。

### 契约

返回值：

- Rune - 当前类型对应的小写字符。

## func toLowerCase(CasingOption)

### 签名

```cangjie role=signature
func toLowerCase(opt: CasingOption): Rune
```

获取该类型对应的 `Unicode` 小写字符。

### 契约

参数：

- opt: CasingOption - 传入的语言枚举。

返回值：

- Rune - 当前类型对应的小写字符。

## func toLowerCase()

适用扩展：[extend Rune <: UnicodeRuneExtension](extensions/extend-rune-unicoderuneextension.md)。

### 签名

```cangjie role=signature
public func toLowerCase(): Rune
```

获取该字符对应的 `Unicode` 小写字符。

### 契约

返回值：

- Rune - 当前字符对应的小写字符。

## func toLowerCase(CasingOption)

适用扩展：[extend Rune <: UnicodeRuneExtension](extensions/extend-rune-unicoderuneextension.md)。

### 签名

```cangjie role=signature
public func toLowerCase(opt: CasingOption): Rune
```

获取该字符对应的 `Unicode` 小写字符。

### 契约

参数：

- opt: CasingOption - 传入的语言枚举。

返回值：

- Rune - 当前字符对应的小写字符。
