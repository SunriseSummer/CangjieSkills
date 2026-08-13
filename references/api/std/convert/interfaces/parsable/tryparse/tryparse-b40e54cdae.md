<!-- cj-doc kind="api-member" level="7" id="std.convert.interface.parsable.tryparse.tryparse-b40e54cdae" parent="std.convert.interface.parsable.tryparse" -->
# Parsable<T>.static func tryParse(String)

[← Parsable<T>.tryParse](index.md)

## 签名

```cangjie role=signature
public static func tryParse(data: String): Option<Int64>
```

将 Int64 类型字面量的字符串转换为 Option<Int64> 值。

适用扩展：[extend Int64 <: Parsable<Int64>](../extensions/extend-int64-parsable-int64.md)。

## 契约

参数：

- data: String - 要转换的字符串。

返回值：

- Option\<Int64> - 返回转换后 Option\<Int64> 值，转换失败返回 Option\<Int64>.None。
