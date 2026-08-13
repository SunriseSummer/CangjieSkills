<!-- cj-doc kind="api-member" level="6" id="std.ast.class.matchexpr.prop-selector" parent="std.ast.class.matchexpr" -->
# MatchExpr.selector

[← MatchExpr](index.md)

## 签名

```cangjie role=signature
public mut prop selector: Expr
```

获取或设置关键字 `match` 之后的 Expr。

## 契约

类型：Expr

异常：

- ASTException - 当该表达式是一个不带 selector 的 `match` 表达式时，抛出异常。
