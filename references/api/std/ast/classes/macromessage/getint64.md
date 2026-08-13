<!-- cj-doc kind="api-member" level="6" id="std.ast.class.macromessage.getint64" parent="std.ast.class.macromessage" -->
# MacroMessage.getInt64

[← MacroMessage](index.md)

## 签名

```cangjie role=signature
public func getInt64(key: String): Int64
```

获取对应 key 值的 Int64 类型信息。

## 契约

参数：

- key: String - 用于检索的关键字的名字。

返回值：

- Int64 - 返回存在 key 值对应的 Int64 类型的信息。

异常：

- Exception - 当不存在 key 值对应的 Int64 类型的信息时，抛出异常。
