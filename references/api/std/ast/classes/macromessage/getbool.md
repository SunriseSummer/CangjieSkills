<!-- cj-doc kind="api-member" level="6" id="std.ast.class.macromessage.getbool" parent="std.ast.class.macromessage" -->
# MacroMessage.getBool

[← MacroMessage](index.md)

## 签名

```cangjie role=signature
public func getBool(key: String): Bool
```

获取对应 key 值的 Bool 类型信息。

## 契约

参数：

- key: String - 用于检索的关键字的名字。

返回值：

- Bool - 返回存在 key 值对应的 Bool 类型的信息。

异常：

- Exception - 当不存在 key 值对应的 Bool 类型的信息时，抛出异常。
