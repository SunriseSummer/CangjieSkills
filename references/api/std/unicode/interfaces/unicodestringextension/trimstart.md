<!-- cj-doc kind="api-member" level="6" id="std.unicode.interface.unicodestringextension.trimstart" parent="std.unicode.interface.unicodestringextension" -->
# UnicodeStringExtension.trimStart

[← UnicodeStringExtension](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func trimStart()

### 签名

```cangjie role=signature
func trimStart(): String
```

去除字符串开头的空字符，空字符定义见 Rune 类型的扩展函数 isWhiteSpace。

### 契约

返回值：

- String - 去除开头空字符后的字符串。

异常：

- IllegalArgumentException - 如果字符串中不存在有效的 UTF-8 编码，抛出异常。

## func trimStart()

适用扩展：[extend String <: UnicodeStringExtension](extensions/extend-string-unicodestringextension.md)。

### 签名

```cangjie role=signature
public func trimStart(): String
```

去除字符串开头的空字符，空字符定义见 Rune 类型的扩展函数 isWhiteSpace。

### 契约

返回值：

- String - 去除开头空字符后的字符串。

异常：

- IllegalArgumentException - 如果字符串中不存在有效的 UTF-8 编码，抛出异常。
