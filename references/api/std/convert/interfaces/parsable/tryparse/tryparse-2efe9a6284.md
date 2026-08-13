<!-- cj-doc kind="api-member" level="7" id="std.convert.interface.parsable.tryparse.tryparse-2efe9a6284" parent="std.convert.interface.parsable.tryparse" -->
# Parsable<T>.static func tryParse(String)

[← Parsable<T>.tryParse](index.md)

## 签名

```cangjie role=signature
static func tryParse(value: String): Option<T>
```

从字符串中解析特定类型。

## 契约

参数：

- value: String - 待解析的字符串。

返回值：

- Option\<T> - 转换后值，转换失败返回 Option\<T>.None。
