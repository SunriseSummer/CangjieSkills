<!-- cj-doc kind="api-member" level="7" id="std.convert.interface.parsable.tryparse.tryparse-d49bfe1625" parent="std.convert.interface.parsable.tryparse" -->
# Parsable<T>.static func tryParse(String)

[← Parsable<T>.tryParse](index.md)

## 签名

```cangjie role=signature
public static func tryParse(data: String): Option<UInt64>
```

将 UInt64 类型字面量的字符串转换为 Option<UInt64> 值。

适用扩展：[extend UInt64 <: Parsable<UInt64>](../extensions/extend-uint64-parsable-uint64.md)。

## 契约

参数：

- data: String - 要转换的字符串。

返回值：

- Option\<UInt64> - 返回转换后 Option\<UInt64> 值，转换失败返回 Option\<UInt64>.None。
