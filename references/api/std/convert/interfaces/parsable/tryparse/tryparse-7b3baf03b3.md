<!-- cj-doc kind="api-member" level="7" id="std.convert.interface.parsable.tryparse.tryparse-7b3baf03b3" parent="std.convert.interface.parsable.tryparse" -->
# Parsable<T>.static func tryParse(String)

[← Parsable<T>.tryParse](index.md)

## 签名

```cangjie role=signature
public static func tryParse(data: String): Option<Float32>
```

将 Float32 类型字面量的字符串转换为 Option<Float32> 值。

适用扩展：[extend Float32 <: Parsable<Float32>](../extensions/extend-float32-parsable-float32.md)。

## 契约

参数：

- data: String - 要转换的字符串。

返回值：

- Option\<Float32> - 返回转换后 Option\<Float32> 值，转换失败返回 Option\<Float32>.None。
