<!-- cj-doc kind="api-member" level="6" id="std.ast.class.lambdaexpr.prop-doublearrow" parent="std.ast.class.lambdaexpr" -->
# LambdaExpr.doubleArrow

[← LambdaExpr](index.md)

## 签名

```cangjie role=signature
public mut prop doubleArrow: Token
```

获取或设置 LambdaExpr 中的 `=>`。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 `=>` 操作符时，抛出异常。
