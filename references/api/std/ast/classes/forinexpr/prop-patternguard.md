<!-- cj-doc kind="api-member" level="6" id="std.ast.class.forinexpr.prop-patternguard" parent="std.ast.class.forinexpr" -->
# ForInExpr.patternGuard

[← ForInExpr](index.md)

## 签名

```cangjie role=signature
public mut prop patternGuard: Expr
```

获取或设置 ForInExpr 中的 `patternGuard` 条件表达式。

## 契约

类型：Expr

异常：

- ASTException - 当 ForInExpr 节点中不存在 `patternGuard` 表达式时，抛出异常。
