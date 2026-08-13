<!-- cj-doc kind="api-member" level="6" id="std.ast.class.forinexpr.prop-lparen" parent="std.ast.class.forinexpr" -->
# ForInExpr.lParen

[← ForInExpr](index.md)

## 签名

```cangjie role=signature
public mut prop lParen: Token
```

获取或设置 ForInExpr 中关键字 `for` 后的 "("。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 "(" 时，抛出异常。
