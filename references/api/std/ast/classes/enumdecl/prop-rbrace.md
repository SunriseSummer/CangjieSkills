<!-- cj-doc kind="api-member" level="6" id="std.ast.class.enumdecl.prop-rbrace" parent="std.ast.class.enumdecl" -->
# EnumDecl.rBrace

[← EnumDecl](index.md)

## 签名

```cangjie role=signature
public mut prop rBrace: Token
```

获取或设置 EnumDecl 节点的 `}` 词法单元类型。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 `}` 词法单元类型时，抛出异常。
