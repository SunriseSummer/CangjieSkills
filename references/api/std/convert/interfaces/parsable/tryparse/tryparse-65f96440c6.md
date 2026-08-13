<!-- cj-doc kind="api-member" level="7" id="std.convert.interface.parsable.tryparse.tryparse-65f96440c6" parent="std.convert.interface.parsable.tryparse" -->
# Parsable<T>.static func tryParse(String)

[← Parsable<T>.tryParse](index.md)

## 签名

```cangjie role=signature
public static func tryParse(data: String): Option<Int8>
```

将 Int8 类型字面量的字符串转换为 Option<Int8> 值。

适用扩展：[extend Int8 <: Parsable<Int8>](../extensions/extend-int8-parsable-int8.md)。

## 契约

参数：

- data: String - 要转换的字符串。

返回值：

- Option\<Int8> - 返回转换后 Option\<Int8> 值，转换失败返回 Option\<Int8>.None。
