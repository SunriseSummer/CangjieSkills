<!-- cj-doc kind="api-member" level="6" id="std.unicode.interface.unicoderuneextension.touppercase" parent="std.unicode.interface.unicoderuneextension" -->
# UnicodeRuneExtension.toUpperCase

[← UnicodeRuneExtension](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## func toUpperCase()

### 签名

```cangjie role=signature
func toUpperCase(): Rune
```

获取该类型对应的 `Unicode` 大写字符。

### 契约

返回值：

- Rune - 当前类型对应的小写字符。

## func toUpperCase(CasingOption)

### 签名

```cangjie role=signature
func toUpperCase(opt: CasingOption): Rune
```

获取该类型对应的 `Unicode` 大写字符。

### 契约

参数：

- opt: CasingOption - 传入的语言枚举。

返回值：

- Rune - 当前类型对应的小写字符。

## func toUpperCase()

适用扩展：[extend Rune <: UnicodeRuneExtension](extensions/extend-rune-unicoderuneextension.md)。

### 签名

```cangjie role=signature
public func toUpperCase(): Rune
```

获取该字符对应的 `Unicode` 大写字符。

### 契约

返回值：

- Rune - 当前字符对应的小写字符。

## func toUpperCase(CasingOption)

适用扩展：[extend Rune <: UnicodeRuneExtension](extensions/extend-rune-unicoderuneextension.md)。

### 签名

```cangjie role=signature
public func toUpperCase(opt: CasingOption): Rune
```

获取该字符对应的 `Unicode` 大写字符。

### 契约

参数：

- opt: CasingOption - 传入的语言枚举。

返回值：

- Rune - 当前字符对应的小写字符。
