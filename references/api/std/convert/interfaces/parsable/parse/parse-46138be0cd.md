<!-- cj-doc kind="api-member" level="7" id="std.convert.interface.parsable.parse.parse-46138be0cd" parent="std.convert.interface.parsable.parse" -->
# Parsable<T>.static func parse(String)

[← Parsable<T>.parse](index.md)

## 签名

```cangjie role=signature
public static func parse(data: String): UInt64
```

将 UInt64 类型字面量的字符串转换为 UInt64 值。

适用扩展：[extend UInt64 <: Parsable<UInt64>](../extensions/extend-uint64-parsable-uint64.md)。

## 契约

参数：

- data: String - 要转换的字符串。

返回值：

- UInt64 - 返回转换后 UInt64 值。

异常：

- IllegalArgumentException - 当字符串为空，首位为 `+` 或 `-`，转换失败，或转换后超出 UInt64 范围，或字符串中含有无效的 UTF-8 字符时，抛出异常。
