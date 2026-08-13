<!-- cj-doc kind="api-member" level="7" id="std.convert.interface.parsable.tryparse.tryparse-b73668cf97" parent="std.convert.interface.parsable.tryparse" -->
# Parsable<T>.static func tryParse(String)

[← Parsable<T>.tryParse](index.md)

## 签名

```cangjie role=signature
public static func tryParse(data: String): Option<UInt8>
```

将 UInt8 类型字面量的字符串转换为 Option<UInt8> 值。

适用扩展：[extend UInt8 <: Parsable<UInt8>](../extensions/extend-uint8-parsable-uint8.md)。

## 契约

参数：

- data: String - 要转换的字符串。

返回值：

- Option\<UInt8> - 返回转换后 Option\<UInt8> 值，转换失败返回 Option\<UInt8>.None。
