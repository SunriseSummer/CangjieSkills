<!-- cj-doc kind="api-member" level="6" id="std.ast.class.matchcase.prop-patternguard" parent="std.ast.class.matchcase" -->
# MatchCase.patternGuard

[← MatchCase](index.md)

## 签名

```cangjie role=signature
public mut prop patternGuard: Expr
```

获取或设置 MatchCase 中可选的 pattern guard 表达式节点。

## 契约

类型：Expr

异常：

- ASTException - 当 MatchCase 节点中不存在 pattern guard 表达式时，抛出异常。
