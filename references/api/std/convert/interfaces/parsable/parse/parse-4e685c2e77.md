<!-- cj-doc kind="api-member" level="7" id="std.convert.interface.parsable.parse.parse-4e685c2e77" parent="std.convert.interface.parsable.parse" -->
# Parsable<T>.static func parse(String)

[← Parsable<T>.parse](index.md)

## 签名

```cangjie role=signature
public static func parse(data: String): Float32
```

将 Float32 类型字面量的字符串转换为 Float32 值。

适用扩展：[extend Float32 <: Parsable<Float32>](../extensions/extend-float32-parsable-float32.md)。

## 契约

参数：

- data: String - 要转换的字符串。

返回值：

- Float32 - 返回转换后 Float32 值。

异常：

- IllegalArgumentException - 当字符串不符合浮点数语法时，抛出异常。
