<!-- cj-doc kind="api-member" level="6" id="std.ast.class.tokens.get" parent="std.ast.class.tokens" -->
# Tokens.get

[← Tokens](index.md)

## 签名

```cangjie role=signature
public open func get(index: Int64): Token
```

通过索引值获取 Token 元素。

## 契约

参数：

- index: Int64 - 待索引的数值。

返回值：

- Token - 指定索引的 Token。

异常：

- IndexOutOfBoundsException - 当 `index` 无效时，抛出异常。
