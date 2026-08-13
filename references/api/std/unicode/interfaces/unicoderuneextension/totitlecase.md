<!-- cj-doc kind="api-member" level="6" id="std.unicode.interface.unicoderuneextension.totitlecase" parent="std.unicode.interface.unicoderuneextension" -->
# UnicodeRuneExtension.toTitleCase

[← UnicodeRuneExtension](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## func toTitleCase()

### 签名

```cangjie role=signature
func toTitleCase(): Rune
```

获取该类型对应的 `Unicode` 标题大写字符。

### 契约

返回值：

- Rune - 当前类型对应的标题大写字符。

## func toTitleCase(CasingOption)

### 签名

```cangjie role=signature
func toTitleCase(opt: CasingOption): Rune
```

获取该类型对应的 `Unicode` 标题大写字符。

### 契约

参数：

- opt: CasingOption - 传入的语言枚举。

返回值：

- Rune - 当前类型对应的标题大写字符。

## func toTitleCase()

适用扩展：[extend Rune <: UnicodeRuneExtension](extensions/extend-rune-unicoderuneextension.md)。

### 签名

```cangjie role=signature
public func toTitleCase(): Rune
```

获取该字符对应的 `Unicode` 标题大写字符。

### 契约

返回值：

- Rune - 当前字符对应的标题大写字符。

## func toTitleCase(CasingOption)

适用扩展：[extend Rune <: UnicodeRuneExtension](extensions/extend-rune-unicoderuneextension.md)。

### 签名

```cangjie role=signature
public func toTitleCase(opt: CasingOption): Rune
```

获取该字符对应的 `Unicode` 标题大写字符。

### 契约

参数：

- opt: CasingOption - 传入的语言枚举。

返回值：

- Rune - 当前字符对应的标题大写字符。
