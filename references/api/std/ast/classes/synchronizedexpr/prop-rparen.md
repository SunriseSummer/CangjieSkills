<!-- cj-doc kind="api-member" level="6" id="std.ast.class.synchronizedexpr.prop-rparen" parent="std.ast.class.synchronizedexpr" -->
# SynchronizedExpr.rParen

[← SynchronizedExpr](index.md)

## 签名

```cangjie role=signature
public mut prop rParen: Token
```

获取或设置 SynchronizedExpr 中的 ")"。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 ")" 时，抛出异常。
