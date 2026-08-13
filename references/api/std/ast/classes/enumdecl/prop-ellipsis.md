<!-- cj-doc kind="api-member" level="6" id="std.ast.class.enumdecl.prop-ellipsis" parent="std.ast.class.enumdecl" -->
# EnumDecl.ellipsis

[← EnumDecl](index.md)

## 签名

```cangjie role=signature
public mut prop ellipsis: Token
```

获取或设置 EnumDecl 节点中可选的 `...` 词法单元，可能为 ILLEGAL 的词法单元类型。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 `...` 词法单元时，抛出异常。
