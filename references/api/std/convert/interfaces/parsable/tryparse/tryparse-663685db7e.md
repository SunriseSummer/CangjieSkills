<!-- cj-doc kind="api-member" level="7" id="std.convert.interface.parsable.tryparse.tryparse-663685db7e" parent="std.convert.interface.parsable.tryparse" -->
# Parsable<T>.static func tryParse(String)

[← Parsable<T>.tryParse](index.md)

## 签名

```cangjie role=signature
public static func tryParse(data: String): Option<Int16>
```

将 Int16 类型字面量的字符串转换为 Option<Int16> 值。

适用扩展：[extend Int16 <: Parsable<Int16>](../extensions/extend-int16-parsable-int16.md)。

## 契约

参数：

- data: String - 要转换的字符串。

返回值：

- Option\<Int16> - 返回转换后 Option\<Int16> 值，转换失败返回 Option\<Int16>.None。
