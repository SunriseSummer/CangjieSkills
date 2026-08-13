<!-- cj-doc kind="api-member" level="6" id="std.ast.class.lambdaexpr.prop-rbrace" parent="std.ast.class.lambdaexpr" -->
# LambdaExpr.rBrace

[← LambdaExpr](index.md)

## 签名

```cangjie role=signature
public mut prop rBrace: Token
```

获取或设置 LambdaExpr 中的 "}"。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 "}" 时，抛出异常。
