<!-- cj-doc kind="api-member" level="6" id="std.ast.class.letpatternexpr.prop-backarrow" parent="std.ast.class.letpatternexpr" -->
# LetPatternExpr.backArrow

[← LetPatternExpr](index.md)

## 签名

```cangjie role=signature
public mut prop backArrow: Token
```

获取或设置 LetPatternExpr 节点中 `<-` 操作符。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 `<-` 操作符时，抛出异常。
