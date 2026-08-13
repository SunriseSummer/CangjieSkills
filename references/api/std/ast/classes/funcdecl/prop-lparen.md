<!-- cj-doc kind="api-member" level="6" id="std.ast.class.funcdecl.prop-lparen" parent="std.ast.class.funcdecl" -->
# FuncDecl.lParen

[← FuncDecl](index.md)

## 签名

```cangjie role=signature
public mut prop lParen: Token
```

获取或设置 FuncDecl 节点的 "("。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 "(" 时，抛出异常。
