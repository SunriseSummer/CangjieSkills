<!-- cj-doc kind="api-member" level="6" id="std.ast.class.ifexpr.prop-elseexpr" parent="std.ast.class.ifexpr" -->
# IfExpr.elseExpr

[← IfExpr](index.md)

## 签名

```cangjie role=signature
public mut prop elseExpr: Expr
```

获取或设置 IfExpr 节点中 `else` 分支节点。

## 契约

类型：Expr

异常：

- ASTException - 当前 IfExpr 节点没有 else 分支节点。
