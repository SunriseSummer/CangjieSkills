<!-- cj-doc kind="api-member" level="6" id="std.ast.class.funcdecl.prop-colon" parent="std.ast.class.funcdecl" -->
# FuncDecl.colon

[← FuncDecl](index.md)

## 签名

```cangjie role=signature
public mut prop colon: Token
```

获取或设置 FuncDecl 节点的冒号。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是冒号时，抛出异常。
