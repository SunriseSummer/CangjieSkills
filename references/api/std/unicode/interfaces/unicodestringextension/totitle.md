<!-- cj-doc kind="api-member" level="6" id="std.unicode.interface.unicodestringextension.totitle" parent="std.unicode.interface.unicodestringextension" -->
# UnicodeStringExtension.toTitle

[← UnicodeStringExtension](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## func toTitle()

### 签名

```cangjie role=signature
func toTitle(): String
```

将当前字符串中 `Unicode` 字符集范围内可以转换为标题大写字符的转换为标题大写字符。

### 契约

返回值：

- String - 转换后的标题大写字符串。

异常：

- IllegalArgumentException - 如果字符串中存在无效的 UTF-8 编码，抛出异常。

## func toTitle(CasingOption)

### 签名

```cangjie role=signature
func toTitle(opt: CasingOption): String
```

将当前字符串中 `Unicode` 字符集范围内可以转换为标题大写字符的转换为标题大写字符。

### 契约

参数：

- opt: CasingOption - 传入的语言枚举。

返回值：

- String - 转换后的标题大写字符串。

异常：

- IllegalArgumentException - 如果字符串中存在无效的 UTF-8 编码，抛出异常。

## func toTitle()

适用扩展：[extend String <: UnicodeStringExtension](extensions/extend-string-unicodestringextension.md)。

### 签名

```cangjie role=signature
public func toTitle(): String
```

将当前字符串中 `Unicode` 字符集范围内可以转换为标题大写字符的转换为标题大写字符。

### 契约

返回值：

- String - 转换后的标题大写字符串。

异常：

- IllegalArgumentException - 如果字符串中存在无效的 UTF-8 编码，抛出异常。

## func toTitle(CasingOption)

适用扩展：[extend String <: UnicodeStringExtension](extensions/extend-string-unicodestringextension.md)。

### 签名

```cangjie role=signature
public func toTitle(opt: CasingOption): String
```

将当前字符串中 `Unicode` 字符集范围内可以转换为标题大写字符的转换为标题大写字符。

### 契约

参数：

- opt: CasingOption - 传入的语言枚举。

返回值：

- String - 转换后的标题大写字符串。

异常：

- IllegalArgumentException - 如果字符串中存在无效的 UTF-8 编码，抛出异常。
