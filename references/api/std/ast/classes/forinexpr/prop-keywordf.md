<!-- cj-doc kind="api-member" level="6" id="std.ast.class.forinexpr.prop-keywordf" parent="std.ast.class.forinexpr" -->
# ForInExpr.keywordF

[← ForInExpr](index.md)

## 签名

```cangjie role=signature
public mut prop keywordF: Token
```

获取或设置 ForInExpr 中的关键字 `for`。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 `for` 关键字时，抛出异常。
