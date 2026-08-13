<!-- cj-doc kind="api-member" level="7" id="std.convert.interface.parsable.tryparse.tryparse-491fcc2140" parent="std.convert.interface.parsable.tryparse" -->
# Parsable<T>.static func tryParse(String)

[← Parsable<T>.tryParse](index.md)

## 签名

```cangjie role=signature
public static func tryParse(data: String): Option<Float64>
```

将 Float64 类型字面量的字符串转换为 Option<Float64> 值。

适用扩展：[extend Float64 <: Parsable<Float64>](../extensions/extend-float64-parsable-float64.md)。

## 契约

参数：

- data: String - 要转换的字符串。

返回值：

- Option\<Float64> - 返回转换后 Option\<Float64> 值，转换失败返回 Option\<Float64>.None。
