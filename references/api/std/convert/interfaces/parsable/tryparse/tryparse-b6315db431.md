<!-- cj-doc kind="api-member" level="7" id="std.convert.interface.parsable.tryparse.tryparse-b6315db431" parent="std.convert.interface.parsable.tryparse" -->
# Parsable<T>.static func tryParse(String)

[← Parsable<T>.tryParse](index.md)

## 签名

```cangjie role=signature
public static func tryParse(data: String): Option<Rune>
```

将 Rune 类型字面量的字符串转换为 Option<Rune> 值。

适用扩展：[extend Rune <: Parsable<Rune>](../extensions/extend-rune-parsable-rune.md)。

## 契约

参数：

- data: String - 要转换的字符串。

返回值：

- Option\<Rune> - 返回转换后 Option\<Rune> 值，转换失败返回 Option\<Rune>.None。
