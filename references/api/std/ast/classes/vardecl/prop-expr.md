<!-- cj-doc kind="api-member" level="6" id="std.ast.class.vardecl.prop-expr" parent="std.ast.class.vardecl" -->
# VarDecl.expr

[← VarDecl](index.md)

## 签名

```cangjie role=signature
public mut prop expr: Expr
```

获取或设置 VarDecl 节点的变量初始化节点。

## 契约

类型：Expr

异常：

- ASTException - 当 VarDecl 节点没有对变量进行初始化时，抛出异常。
