<!-- cj-doc kind="api-member" level="7" id="std.convert.interface.parsable.tryparse.tryparse-cddfc7e662" parent="std.convert.interface.parsable.tryparse" -->
# Parsable<T>.static func tryParse(String)

[← Parsable<T>.tryParse](index.md)

## 签名

```cangjie role=signature
public static func tryParse(data: String): Option<Bool>
```

将 Bool 类型字面量的字符串转换为 Option<Bool> 值。

适用扩展：[extend Bool <: Parsable<Bool>](../extensions/extend-bool-parsable-bool.md)。

## 契约

参数：

- data: String - 要转换的字符串。

返回值：

- Option\<Bool> - 返回转换后 Option\<Bool> 值，转换失败返回 Option\<Bool>.None。
