<!-- cj-doc kind="api-member" level="7" id="std.convert.interface.parsable.tryparse.tryparse-47cb51a222" parent="std.convert.interface.parsable.tryparse" -->
# Parsable<T>.static func tryParse(String)

[← Parsable<T>.tryParse](index.md)

## 签名

```cangjie role=signature
public static func tryParse(data: String): Option<Int32>
```

将 Int32 类型字面量的字符串转换为 Option<Int32> 值。

适用扩展：[extend Int32 <: Parsable<Int32>](../extensions/extend-int32-parsable-int32.md)。

## 契约

参数：

- data: String - 要转换的字符串。

返回值：

- Option\<Int32> - 返回转换后 Option\<Int32> 值，转换失败返回 Option\<Int32>.None。
