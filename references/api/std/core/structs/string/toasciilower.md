<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.toasciilower" parent="std.core.struct.string" -->
# String.toAsciiLower

[← String](index.md)

## 签名

```cangjie role=signature
public func toAsciiLower(): String
```

把 ASCII 大写字母转成小写；处理协议关键字、枚举文本等 ASCII 输入时直接调用 `text.toAsciiLower()`，无需导入 std.unicode。Unicode 大小写转换才使用 std.unicode 的 `toLower()`。

## 契约

返回值：

- String - 转换后的新字符串。
