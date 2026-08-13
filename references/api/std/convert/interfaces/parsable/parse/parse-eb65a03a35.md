<!-- cj-doc kind="api-member" level="7" id="std.convert.interface.parsable.parse.parse-eb65a03a35" parent="std.convert.interface.parsable.parse" -->
# Parsable<T>.static func parse(String)

[← Parsable<T>.parse](index.md)

## 签名

```cangjie role=signature
public static func parse(data: String): UInt32
```

将 UInt32 类型字面量的字符串转换为 UInt32 值。

适用扩展：[extend UInt32 <: Parsable<UInt32>](../extensions/extend-uint32-parsable-uint32.md)。

## 契约

参数：

- data: String - 要转换的字符串。

返回值：

- UInt32 - 返回转换后 UInt32 值。

异常：

- IllegalArgumentException - 当字符串为空，首位为 `+` 或 `-`，转换失败，或转换后超出 UInt32 范围，或字符串中含有无效的 UTF-8 字符时，抛出异常。
