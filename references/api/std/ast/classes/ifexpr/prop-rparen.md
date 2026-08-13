<!-- cj-doc kind="api-member" level="6" id="std.ast.class.ifexpr.prop-rparen" parent="std.ast.class.ifexpr" -->
# IfExpr.rParen

[← IfExpr](index.md)

## 签名

```cangjie role=signature
public mut prop rParen: Token
```

获取或设置 IfExpr 节点中的 `if` 后的 ")"。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 ")" 时，抛出异常。
