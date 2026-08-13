<!-- cj-doc kind="api-member" level="6" id="std.ast.class.matchcase.prop-expr" parent="std.ast.class.matchcase" -->
# MatchCase.expr

[← MatchCase](index.md)

## 签名

```cangjie role=signature
public mut prop expr: Expr
```

获取或设置 MatchCase 中位于 case 后的表达式节点。

## 契约

类型：Expr

异常：

- ASTException - 当 MatchCase 节点中不存在表达式节点时，抛出异常。
