<!-- cj-doc kind="api-member" level="7" id="std.convert.interface.parsable.parse.parse-9a6e7a4d55" parent="std.convert.interface.parsable.parse" -->
# Parsable<T>.static func parse(String)

[← Parsable<T>.parse](index.md)

## 签名

```cangjie role=signature
public static func parse(data: String): Rune
```

将 Rune 类型字面量的字符串转换为 Rune 值。

适用扩展：[extend Rune <: Parsable<Rune>](../extensions/extend-rune-parsable-rune.md)。

## 契约

参数：

- data: String - 要转换的字符串。

返回值：

- Rune - 返回转换后 Rune 值。

异常：

- IllegalArgumentException - 当字符串为空，或转换失败时，或字符串中含有无效的 UTF-8 字符时，抛出异常。
