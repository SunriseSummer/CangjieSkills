<!-- cj-doc kind="api-member" level="7" id="std.convert.interface.parsable.tryparse.tryparse-0d2fcfbfed" parent="std.convert.interface.parsable.tryparse" -->
# Parsable<T>.static func tryParse(String)

[← Parsable<T>.tryParse](index.md)

## 签名

```cangjie role=signature
public static func tryParse(data: String): Option<UInt32>
```

将 UInt32 类型字面量的字符串转换为 Option<UInt32> 值。

适用扩展：[extend UInt32 <: Parsable<UInt32>](../extensions/extend-uint32-parsable-uint32.md)。

## 契约

参数：

- data: String - 要转换的字符串。

返回值：

- Option\<UInt32> - 返回转换后 Option\<UInt32> 值，转换失败返回 Option\<UInt32>.None。
