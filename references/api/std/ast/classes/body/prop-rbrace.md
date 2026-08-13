<!-- cj-doc kind="api-member" level="6" id="std.ast.class.body.prop-rbrace" parent="std.ast.class.body" -->
# Body.rBrace

[← Body](index.md)

## 签名

```cangjie role=signature
public mut prop rBrace: Token
```

获取或设置 `}` 词法单元。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 `}` 词法单元时，抛出异常。
