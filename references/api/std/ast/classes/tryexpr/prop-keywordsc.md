<!-- cj-doc kind="api-member" level="6" id="std.ast.class.tryexpr.prop-keywordsc" parent="std.ast.class.tryexpr" -->
# TryExpr.keywordsC

[← TryExpr](index.md)

## 签名

```cangjie role=signature
public mut prop keywordsC: Tokens
```

获取或设置 TryExpr 中的关键字 `catch`。

## 契约

类型：Tokens

异常：

- ASTException - 当设置的 Token 不是 `catch` 关键字时，抛出异常。
