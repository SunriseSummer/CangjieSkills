<!-- cj-doc kind="api-member" level="6" id="std.ast.class.forinexpr.prop-keywordw" parent="std.ast.class.forinexpr" -->
# ForInExpr.keywordW

[← ForInExpr](index.md)

## 签名

```cangjie role=signature
public mut prop keywordW: Token
```

获取或设置 ForInExpr 中的关键字 `where`。

## 契约

类型：Token

异常：

- ASTException - 当设置的 Token 不是 `where` 关键字时，抛出异常。
