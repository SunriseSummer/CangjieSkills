<!-- cj-doc kind="api-member" level="7" id="std.convert.interface.parsable.tryparse.tryparse-d5ac764240" parent="std.convert.interface.parsable.tryparse" -->
# Parsable<T>.static func tryParse(String)

[← Parsable<T>.tryParse](index.md)

## 签名

```cangjie role=signature
public static func tryParse(data: String): Option<Float16>
```

将 Float16 类型字面量的字符串转换为 Option<Float16> 值。

适用扩展：[extend Float16 <: Parsable<Float16>](../extensions/extend-float16-parsable-float16.md)。

## 契约

参数：

- data: String - 要转换的字符串。

返回值：

- Option\<Float16> - 返回转换后 Option\<Float16> 值，转换失败返回 Option\<Float16>.None。
