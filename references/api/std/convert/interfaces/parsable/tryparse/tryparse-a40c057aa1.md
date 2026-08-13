<!-- cj-doc kind="api-member" level="7" id="std.convert.interface.parsable.tryparse.tryparse-a40c057aa1" parent="std.convert.interface.parsable.tryparse" -->
# Parsable<T>.static func tryParse(String)

[← Parsable<T>.tryParse](index.md)

## 签名

```cangjie role=signature
public static func tryParse(data: String): Option<UInt16>
```

将 UInt16 类型字面量的字符串转换为 Option<UInt16> 值。

适用扩展：[extend UInt16 <: Parsable<UInt16>](../extensions/extend-uint16-parsable-uint16.md)。

## 契约

参数：

- data: String - 要转换的字符串。

返回值：

- Option\<UInt16> - 返回转换后 Option\<UInt16> 值，转换失败返回 Option\<UInt16>.None。
