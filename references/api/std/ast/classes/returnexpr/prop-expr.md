<!-- cj-doc kind="api-member" level="6" id="std.ast.class.returnexpr.prop-expr" parent="std.ast.class.returnexpr" -->
# ReturnExpr.expr

[← ReturnExpr](index.md)

## 签名

```cangjie role=signature
public mut prop expr: Expr
```

获取或设置 ReturnExpr 节点中的表达式节点。

## 契约

类型：Expr

异常：

- ASTException - 当 ReturnExpr 节点没有表达式时，抛出异常。
